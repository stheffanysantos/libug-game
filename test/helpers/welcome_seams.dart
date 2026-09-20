import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod/misc.dart' show Override;
import 'package:flutter_test/flutter_test.dart';

import 'package:debuga_o_mascote/core/onboarding/onboarding_notifier.dart';
import 'package:debuga_o_mascote/core/onboarding/onboarding_repository.dart';
import 'package:debuga_o_mascote/core/onboarding/onboarding_state.dart';
import 'package:debuga_o_mascote/core/progress/progress_notifier.dart';
import 'package:debuga_o_mascote/core/progress/progress_repository.dart';
import 'package:debuga_o_mascote/core/progress/progress_state.dart';
import 'package:debuga_o_mascote/models/progress.dart';

import 'fake_onboarding_repository.dart';
import 'fake_progress_repository.dart';

/// Pontos de costura (seams) de teste para o bugfix `boas-vindas-primeira-vez`
/// (issue #3) — **infraestrutura de teste apenas, NÃO é código de produção**.
///
/// Reúne os quatro seams descritos na Testing Strategy do design, para que a
/// lógica de decisão da Splash (`local OR sincronizado`), o `mergedWith` (OR de
/// `seenWelcome`) e o mapeamento Firestore (`Map <-> ProgressState`) sejam
/// testáveis em nível de unidade **sem Firebase real**:
///
/// 1. [shouldShowWelcome] — decisão pura da Splash (`F`/`F'`), sem montar a
///    árvore de widgets.
/// 2. [welcomeDecisionFor] — decisão via `ProviderContainer` sobrescrevendo
///    `onboardingProvider`/`progressProvider` com estados
///    controlados (alternativa "de integração leve" ao seam puro).
/// 3. [progressStateFromFirestoreMap]/[firestoreMapFromProgressState] —
///    funções puras de (de)serialização `Map <-> ProgressState` que espelham
///    `FirestoreProgressRepository.fetch`/`save`, incluindo o fallback
///    `data['seenWelcome'] ?? false` e a escrita de `seenWelcome`.
/// 4. [containerWithFakeProgress] — helper de `ProviderContainer` com um
///    `ProgressRepository` fake que captura `save(state)`, para testar
///    `ProgressNotifier.markWelcomeSeen()` (tarefa 3.3).
///
/// > **Nota de dependência de tarefa**: o campo sincronizado
/// > `ProgressState.seenWelcome` e `ProgressNotifier.markWelcomeSeen()` ainda
/// > **não existem** no código de produção nesta tarefa (Task 0) — são
/// > introduzidos nas tarefas 3.1/3.3 do fix. Este arquivo só depende de tipos
/// > públicos já existentes (`ProgressState`, `OnboardingState`, os providers)
/// > e de helpers de teste; a leitura de `progress.seenWelcome` só compilará
/// > após 3.1. Ver os TODOs marcados abaixo.

/// Resultado observável da decisão feita no `onTap` do botão "JOGAR" na Splash
/// (`splash_view.dart`) — o design chama isto de `GO_TO_WORLD_SELECT` vs
/// mostrar a `WelcomeView`. Modelado como enum de teste para asserir a decisão
/// sem depender de `Navigator`/rotas.
enum WelcomeDecision {
  /// Vai direto pra Seleção de Mundo (`WorldSelectView`), sem boas-vindas.
  goToWorldSelect,

  /// Mostra a `WelcomeView` (3 slides + escolha de conta).
  showWelcome,
}

/// **Seam 1 — decisão pura da Splash.**
///
/// Equivalente puro do `onTap` de "JOGAR": mostra a `WelcomeView` só quando
/// **nenhuma** das fontes indica "já viu". No código não corrigido (`F`) a
/// Splash lê só `onboarding.seenWelcome`; no corrigido (`F'`) a decisão é
/// `local OR sincronizado`. Este helper cobre `F'` (a versão que considera as
/// duas fontes); para reproduzir `F`, basta passar `syncedSeenWelcome: false`.
///
/// `syncedSeenWelcome` é passado como `bool` cru (em vez de `ProgressState`)
/// para que este seam **não** dependa do campo `ProgressState.seenWelcome`
/// ainda inexistente nesta tarefa — os testes do fix passarão
/// `progress.seenWelcome` aqui depois da tarefa 3.1.
WelcomeDecision shouldShowWelcome({
  required bool localSeenWelcome,
  required bool syncedSeenWelcome,
}) {
  final seenWelcome = localSeenWelcome || syncedSeenWelcome;
  return seenWelcome ? WelcomeDecision.goToWorldSelect : WelcomeDecision.showWelcome;
}

/// **Seam 1 (variante `F`) — decisão original, só a fonte local.**
///
/// Espelha o comportamento do código NÃO corrigido (`splash_view.dart` atual),
/// que lê apenas `ref.read(onboardingProvider).seenWelcome`. Útil para
/// os testes de exploração da Bug Condition (tarefa 1) e para comparar
/// `decideWelcome(X) == decideWelcome'(X)` fora da bug condition (tarefa 2).
WelcomeDecision shouldShowWelcomeLocalOnly({required bool localSeenWelcome}) {
  return localSeenWelcome ? WelcomeDecision.goToWorldSelect : WelcomeDecision.showWelcome;
}

/// **Seam 3 (leitura) — `Map -> ProgressState` puro.**
///
/// Espelha exatamente a construção de `ProgressState` em
/// `FirestoreProgressRepository.fetch()`, incluindo todos os fallbacks legados.
/// O ponto de costura é a **transformação de dados**, não o
/// `FirebaseFirestore.instance` real: os testes podem passar um `Map` como o
/// que viria do documento `players/{uid}` e verificar o mapeamento —
/// notadamente o fallback `data['seenWelcome'] as bool? ?? false` para
/// documentos antigos sem o campo.
///
/// > **TODO (tarefa 3.2)**: quando o fix adicionar
/// > `seenWelcome: data['seenWelcome'] as bool? ?? false` ao `fetch()` real,
/// > descomentar a linha correspondente abaixo (marcada) para manter este
/// > espelho fiel. Nesta tarefa (Task 0) o campo ainda não existe em
/// > `ProgressState`, então deixá-lo ativo não compilaria.
ProgressState progressStateFromFirestoreMap(Map<String, dynamic> data) {
  final rawProgress = (data['progress'] as Map<String, dynamic>?) ?? const {};
  final byLevelId = {
    for (final entry in rawProgress.entries)
      entry.key: LevelProgress(
        stars: (entry.value['stars'] as num).toInt(),
        bestBlocks: (entry.value['bestBlocks'] as num).toInt(),
        bestPoints: (entry.value['bestPoints'] as num?)?.toInt() ?? 0,
      ),
  };
  return ProgressState(
    byLevelId: byLevelId,
    sessionScore: (data['sessionScore'] as num?)?.toInt() ?? 0,
    hasSubmittedToLeaderboard: data['hasSubmittedToLeaderboard'] as bool? ?? false,
    surveyAge: (data['surveyAge'] as num?)?.toInt() ?? (data['age'] as num?)?.toInt(),
    surveyHasProgrammedBefore: data['surveyHasProgrammedBefore'] as bool? ?? data['hasProgrammedBefore'] as bool?,
    gameCompleted: data['gameCompleted'] as bool? ?? false,
    gameCompletedAt: data['gameCompletedAt'] != null ? DateTime.parse(data['gameCompletedAt'] as String) : null,
    username: data['username'] as String?,
    avatarId: data['avatarId'] as String?,
    // Espelha o fetch() real (tarefa 3.2) — fallback seguro para documentos
    // antigos sem o campo.
    seenWelcome: data['seenWelcome'] as bool? ?? false,
  );
}

/// **Seam 3 (leitura, foco no bugfix) — fallback puro de `seenWelcome`.**
///
/// Isola só a regra de leitura do campo novo (`data['seenWelcome'] as bool? ??
/// false`), sem depender do campo em `ProgressState` — testável já nesta
/// tarefa. Documentos antigos (sem a chave) resolvem para `false`; um doc com
/// `seenWelcome: true` resolve para `true`.
bool seenWelcomeFromFirestoreMap(Map<String, dynamic> data) {
  return data['seenWelcome'] as bool? ?? false;
}

/// **Seam 3 (escrita) — `ProgressState -> Map` puro.**
///
/// Espelha o map passado a `.set(..., SetOptions(merge: true))` em
/// `FirestoreProgressRepository.save()`. O `uid`/`platform`/timestamps
/// dependem de `FirebaseAuth`/plataforma e ficam de fora — o seam cobre só os
/// campos derivados de `ProgressState`, que é o que o mapeamento precisa
/// verificar (incluindo, após o fix, `'seenWelcome': state.seenWelcome`).
///
/// > **TODO (tarefa 3.2)**: quando o fix incluir
/// > `'seenWelcome': state.seenWelcome` no `save()` real, descomentar a linha
/// > marcada abaixo.
Map<String, dynamic> firestoreMapFromProgressState(ProgressState state) {
  return <String, dynamic>{
    'progress': {
      for (final entry in state.byLevelId.entries)
        entry.key: {'stars': entry.value.stars, 'bestBlocks': entry.value.bestBlocks, 'bestPoints': entry.value.bestPoints},
    },
    'sessionScore': state.sessionScore,
    'hasSubmittedToLeaderboard': state.hasSubmittedToLeaderboard,
    'surveyAge': state.surveyAge,
    'surveyHasProgrammedBefore': state.surveyHasProgrammedBefore,
    'gameCompleted': state.gameCompleted,
    'gameCompletedAt': state.gameCompletedAt?.toIso8601String(),
    'username': state.username,
    'avatarId': state.avatarId,
    // Espelha o save() real (tarefa 3.2).
    'seenWelcome': state.seenWelcome,
  };
}

/// **Seam 4 — `ProviderContainer` com fakes para `ProgressNotifier`.**
///
/// Cria um container com `progressRepositoryProvider` sobrescrito por um
/// [FakeProgressRepository] (retornado no [repositoryOut] via out-param
/// pattern) e `onboardingRepositoryProvider` por um [FakeOnboardingRepository],
/// de modo que nenhum notifier toque Firestore/`shared_preferences` reais. Use
/// para testar `ProgressNotifier.markWelcomeSeen()` (tarefa 3.3): captura o
/// `save(state)` e conta chamadas via o fake.
///
/// `addTearDown(container.dispose)` já é registrado — não precisa dispor à mão.
ProviderContainer containerWithFakeProgress(
  FakeProgressRepository progressRepository, {
  FakeOnboardingRepository? onboardingRepository,
  List<Override> extraOverrides = const [],
}) {
  final container = ProviderContainer(
    overrides: [
      progressRepositoryProvider.overrideWithValue(progressRepository),
      onboardingRepositoryProvider.overrideWithValue(onboardingRepository ?? FakeOnboardingRepository()),
      ...extraOverrides,
    ],
  );
  addTearDown(container.dispose);
  return container;
}

/// **Seam 2 — decisão via `ProviderContainer` com estados controlados.**
///
/// Alternativa ao seam puro [shouldShowWelcome]: lê a decisão a partir dos
/// providers reais, sobrescritos com estados semeados. Útil quando o teste
/// quer exercitar a hidratação/leitura via Riverpod em vez de valores crus.
///
/// - [localSeenWelcome] semeia `OnboardingState.seenWelcome` (via fake repo).
/// - [syncedSeenWelcome] representa o `ProgressState.seenWelcome` sincronizado.
///
/// > **TODO (tarefa 3.1/3.5)**: `syncedSeenWelcome` é lido do
/// > `ProgressState.seenWelcome`, que só existe após a tarefa 3.1; até lá este
/// > helper trata o sincronizado como o `bool` passado. Após 3.1, pode-se
/// > semear `ProgressState(seenWelcome: ...)` no fake e ler do provider.
Future<WelcomeDecision> welcomeDecisionFor({
  required bool localSeenWelcome,
  required bool syncedSeenWelcome,
}) async {
  final onboardingRepo = FakeOnboardingRepository()..saved = OnboardingState(seenWelcome: localSeenWelcome);
  final progressRepo = FakeProgressRepository();
  final container = containerWithFakeProgress(progressRepo, onboardingRepository: onboardingRepo);

  // Dispara e aguarda a hidratação fire-and-forget de ambos os notifiers.
  container.read(onboardingProvider);
  container.read(progressProvider);
  await Future<void>.delayed(Duration.zero);
  await Future<void>.delayed(Duration.zero);

  final local = container.read(onboardingProvider).seenWelcome;
  // Após a tarefa 3.1, trocar por: container.read(progressProvider).seenWelcome
  return shouldShowWelcome(localSeenWelcome: local, syncedSeenWelcome: syncedSeenWelcome);
}
