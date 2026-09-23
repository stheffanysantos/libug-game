import 'package:debuga_o_mascote/core/progress/progress_repository.dart';
import 'package:debuga_o_mascote/core/progress/progress_state.dart';

/// [ProgressRepository] de teste — guarda tudo em memória, sem tocar o
/// Firestore real (mesmo espírito de `FakeOnboardingRepository`/
/// `FakeSoundPlayer`/`FakeLeaderboardRepository`).
///
/// - `fetch()` devolve o que foi semeado em [seeded] (padrão `null` = "nada
///   salvo ainda / infraestrutura indisponível", igual ao real).
/// - `save(state)` captura o último estado em [lastSaved] e conta as chamadas
///   em [saveCount] — usado por `ProgressNotifier.markWelcomeSeen()` (tarefa
///   3.3) para verificar que `state.seenWelcome` virou `true`, que `_syncNow()`
///   gravou, e a idempotência (`if (state.seenWelcome) return`).
///
/// Extraído para `test/helpers/` (antes duplicado como `_FakeProgressRepository`
/// em `progress_notifier_test.dart`) para poder ser reutilizado pelos testes
/// do bugfix `boas-vindas-primeira-vez` sem Firebase real — o seam é o
/// `ProviderContainer` sobrescrevendo `progressRepositoryProvider`.
class FakeProgressRepository implements ProgressRepository {
  FakeProgressRepository({this.seeded});

  /// Estado devolvido por `fetch()` — semeie para simular progresso já salvo
  /// numa conta (ex.: `ProgressState(seenWelcome: true)` para o cenário
  /// "conta já viu as boas-vindas antes").
  ProgressState? seeded;

  /// Último estado passado a `save()`.
  ProgressState? lastSaved;

  /// Quantas vezes `save()` foi chamado — útil para asserir idempotência.
  int saveCount = 0;

  @override
  Future<ProgressState?> fetch() async => seeded;

  @override
  Future<void> save(ProgressState state) async {
    lastSaved = state;
    saveCount++;
  }
}
