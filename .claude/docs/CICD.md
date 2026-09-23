# CI/CD, Ambientes e Infra

Documento único de tudo que é pipeline, ambientes de deploy e infraestrutura do
Debuga o Mascote. Se for mexer em workflow, projeto Firebase ou infra, é aqui.

## Ambientes

Dois ambientes, cada um com projeto Firebase, branch e workflow próprios e
**isolados** (Firestore/Auth/Hosting separados — dados de teste nunca sujam a
produção; ver issue #2 / #1):

| Ambiente | Branch | Projeto Firebase | URL | Workflow | Secret do token |
|---|---|---|---|---|---|
| **Produção** | `main` | `debugaomascote` | `debugaomascote.web.app` · `libug.tets.app.br` | `firebase-hosting-deploy.yml` | `FIREBASE_TOKEN` |
| **Develop** | `develop` | `debugaomascote-dev` | `debugaomascote-dev.web.app` | `firebase-hosting-deploy-dev.yml` | `FIREBASE_TOKEN_DEV` |

Push/merge na branch → CI roda → build web → deploy no Hosting do projeto
correspondente. Automático, sem passo manual. **Tempo:** ~2-3min.

### Seleção de ambiente no build
A escolha do projeto Firebase é feita em **build-time** por
`--dart-define=APP_ENV=dev` (só o workflow de dev passa essa flag). O seletor está
em `lib/core/firebase_env.dart`, que decide entre:
- `DefaultFirebaseOptions` (`lib/firebase_options.dart`) → prod `debugaomascote`
- `DevFirebaseOptions` (`lib/firebase_options_dev.dart`) → dev `debugaomascote-dev`

Sem a flag, o build **sempre** cai em prod (fail-safe — nenhum build aponta pro
Firebase de dev por acidente).

## Pipeline (os dois workflows)

Cada workflow tem 2 jobs. O deploy **depende** do gate de qualidade (`needs:
quality`) — se a análise falhar, não faz deploy.

### Job 1 — `quality` (gate)
- `flutter pub get`
- `flutter analyze --fatal-infos` — **lint + typecheck** num comando só. Em Dart,
  a checagem de tipos faz parte da análise estática, não existe passo separado
  tipo `tsc --noEmit`; `flutter analyze` é o equivalente a rodar ESLint + `tsc`
  juntos. `--fatal-infos` faz qualquer info/warning (não só erro) derrubar o CI.

### Job 2 — `build_and_deploy[_dev]`
1. `flutter pub get`
2. `flutter build web --release` (dev acrescenta `--dart-define=APP_ENV=dev`)
3. `npm install -g firebase-tools`
4. `firebase deploy --only hosting --project <projeto> --token "$FIREBASE_TOKEN"`
   - Dev também publica as regras: `--only hosting,firestore:rules` — mantém as
     regras de dev sincronizadas com o repo (`firestore.rules`), sem divergir da
     prod.

> **`build_runner`**: o CI **não** roda. Os arquivos gerados
> (`.g.dart`/`.freezed.dart`) já vêm comitados. **Se mexer em
> `@riverpod`/`@freezed`, rode `dart run build_runner build` e comite antes do
> push**, senão o deploy sai desatualizado.

## Autenticação (tokens)

Secrets no GitHub (Settings → Secrets → Actions), gerados via `firebase login:ci`:
- `FIREBASE_TOKEN` — produção.
- `FIREBASE_TOKEN_DEV` — develop.

Um token de `firebase login:ci` é por-conta (não por-projeto), então o mesmo
token serviria pros dois — manter separados é higiene (revogar um sem afetar o
outro).

Trocar um token:
```bash
firebase login:ci
gh secret set FIREBASE_TOKEN --repo stheffanysantos/libug-game       # prod
gh secret set FIREBASE_TOKEN_DEV --repo stheffanysantos/libug-game   # dev
```

## Domínios

Produção — mesmo deploy atualiza os dois, sempre juntos:
- `debugaomascote.web.app`
- `libug.tets.app.br` (CNAME no Cloudflare → `debugaomascote.web.app`, SSL automático)

Develop:
- `debugaomascote-dev.web.app` (domínio customizado opcional, não configurado).

## Comandos úteis

```bash
gh run list --repo stheffanysantos/libug-game --limit 5
gh run watch <run-id> --repo stheffanysantos/libug-game
```

Deploy manual (sem CI) — `prod`/`dev` são aliases do `.firebaserc`:
```bash
# produção
flutter build web --release
firebase deploy --only hosting --project prod

# develop
flutter build web --release --dart-define=APP_ENV=dev
firebase deploy --only hosting,firestore:rules --project dev
```

## Como o ambiente de dev foi montado (setup, opção B — projeto separado)

Registro do que foi feito uma vez para criar o ambiente de develop isolado.
Repetir só se precisar recriar/rotacionar.

**Manual (Firebase Console / GitHub):**
1. Projeto `debugaomascote-dev` criado no console.
2. Auth habilitado: **Anônimo** + **E-mail/senha** + **Google** (mesmos da prod).
3. Firestore Database criado.
4. Apps registrados via FlutterFire, gerando as credenciais de dev:
   ```bash
   flutterfire configure --project=debugaomascote-dev \
     --out=lib/firebase_options_dev.dart --platforms=web,android
   ```
   ⚠️ O `flutterfire configure` **sobrescreve** `android/app/google-services.json`
   com o do projeto escolhido — o de **produção** foi restaurado depois
   (`git checkout -- android/app/google-services.json`). O `google-services.json`
   de dev pertence a `android/app/src/dev/` (flavor `dev`, ver `firebase.json`),
   mas Android de dev está **fora de escopo** (o app é PWA web; o build web não
   usa esse arquivo).
5. Token gerado (`firebase login:ci`) e salvo como secret `FIREBASE_TOKEN_DEV`.

**Código/config (no repo):**
- `.firebaserc` — aliases `default`/`prod` → `debugaomascote`, `dev` → `debugaomascote-dev`.
- `lib/firebase_options_dev.dart` — credenciais de dev; classe renomeada para
  `DevFirebaseOptions` (evita colidir com `DefaultFirebaseOptions` da prod).
- `lib/core/firebase_env.dart` — seletor por `APP_ENV`.
- `lib/main.dart` — usa `currentFirebaseOptions` em vez de `DefaultFirebaseOptions.currentPlatform`.
- `.github/workflows/firebase-hosting-deploy-dev.yml` — workflow de dev.

## Problemas comuns

- **Build/analyze falha**: código quebrado, info/warning novo (o CI é
  `--fatal-infos`), ou `.g.dart`/`.freezed.dart` desatualizado.
- **Erro de autenticação no deploy**: `FIREBASE_TOKEN`/`FIREBASE_TOKEN_DEV` expirou → gerar novo.
- **Site não atualiza**: cache da CDN (Fastly) — resolve sozinho ou com novo deploy.
- **Dev gravando na prod (ou vice-versa)**: conferir que o build de dev passou
  `--dart-define=APP_ENV=dev` — sem a flag, aponta pra prod.

## Próximos passos / futuro

- **Checagem de formatação no CI** (`dart format --output=none --set-exit-if-changed .`):
  hoje **não** está no gate. O projeto não segue `dart format` (na última medição,
  ~122 de 171 arquivos mudariam) — adotar exige uma decisão de estilo + um commit
  de reformatação em massa dedicado (fora de issues de feature/infra). Enquanto
  isso não acontece, o gate é só `flutter analyze`.
- **Testes no gate** (`flutter test`): adicionar como terceiro step do job
  `quality` quando a suíte estiver estável no CI, para bloquear deploy com teste
  quebrado.
- **Android de dev**: gerar `android/app/src/dev/google-services.json` e um flavor
  `dev` no Gradle, se um dia houver build APK de teste. Hoje só web.
- **Infra como código (Terraform)**: hoje o setup do Firebase (projetos, Auth,
  Firestore, Hosting, domínios) é **manual via console** — descrito na seção de
  setup acima como runbook. Um passo futuro é descrever essa infra em **Terraform**
  (provider `google`/`google-beta`, que cobre Firebase via os recursos
  `google_firebase_*`), para os dois projetos (`debugaomascote` e
  `debugaomascote-dev`) virarem reproduzíveis/versionados em vez de cliques no
  console. Escopo natural: `google_firebase_project`, `google_firebase_web_app`,
  `google_firestore_database`, regras do Firestore, e config de Hosting. Ficaria
  num diretório `infra/terraform/` com workspaces/vars por ambiente. Só vale a
  pena quando a infra parar de ser "criada uma vez e esquecida" — por ora, o
  runbook manual acima é suficiente.
