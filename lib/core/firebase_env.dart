import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;

import '../firebase_options.dart';
import '../firebase_options_dev.dart';

/// Ambiente de build, escolhido em build-time por `--dart-define=APP_ENV=...`.
/// Sem a flag (build local comum, e o deploy de produção), cai em `prod` — um
/// build nunca aponta para o Firebase de dev por acidente. O workflow de dev
/// (`.github/workflows/firebase-hosting-deploy-dev.yml`) passa `APP_ENV=dev`.
const String appEnv = String.fromEnvironment('APP_ENV', defaultValue: 'prod');

/// `true` quando o build é do ambiente de develop (`debugaomascote-dev`).
bool get isDevEnv => appEnv == 'dev';

/// As opções do Firebase do ambiente atual — `DevFirebaseOptions` (projeto
/// `debugaomascote-dev`) quando `APP_ENV=dev`, senão `DefaultFirebaseOptions`
/// (produção, `debugaomascote`). Usado por `main.dart` ao inicializar o
/// Firebase, isolando os dados de dev da produção (ver issue #2 / #1).
FirebaseOptions get currentFirebaseOptions =>
    isDevEnv ? DevFirebaseOptions.currentPlatform : DefaultFirebaseOptions.currentPlatform;
