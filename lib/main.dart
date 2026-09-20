import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/firebase_env.dart';
import 'core/progress/progress_notifier.dart';
import 'features/splash/presentation/splash_view.dart';
import 'theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(options: currentFirebaseOptions);
    // Blindagem contra sessão anônima volátil na web: garante persistência
    // LOCAL da sessão (IndexedDB). É o default do Firebase Web — não muda
    // comportamento observável, apenas documenta a intenção e protege contra
    // regressão. Em plataformas nativas a persistência é automática e não
    // configurável, então só aplicamos na web. A chamada está dentro deste
    // mesmo try: se falhar, o boot não derruba o app (jogo segue jogável;
    // Placar/sync via Firebase ficam off).
    if (kIsWeb) {
      await FirebaseAuth.instance.setPersistence(Persistence.LOCAL);
    }
  } catch (_) {
    // Sem projeto configurado corretamente para esta plataforma, ou sem
    // internet no estande — o jogo continua 100% jogável, só o Placar do
    // Dia e a sincronização de progresso via Firebase ficam indisponíveis
    // (Leaderboard cai para o armazenamento local, ver lib/core/leaderboard/).
  }

  // Container criado explicitamente (em vez de deixar o 1º `ConsumerWidget`
  // criar um implícito) só pra poder ler `progressProvider` uma vez
  // aqui — isso já dispara a hidratação fire-and-forget do progresso
  // (`ProgressNotifier.build()`) o mais cedo possível, sem travar o
  // primeiro frame — mesmo comportamento de antes da migração pra
  // Riverpod (`unawaited(ProgressSync.instance.hydrate())`).
  final container = ProviderContainer();
  container.read(progressProvider);

  runApp(UncontrolledProviderScope(container: container, child: const DebugaOMascoteApp()));
}

class DebugaOMascoteApp extends StatelessWidget {
  const DebugaOMascoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Debuga o Mascote',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.theme,
      home: const SplashView(),
    );
  }
}
