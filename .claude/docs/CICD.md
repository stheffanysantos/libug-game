# CI/CD — Deploy automático

Push/merge na `main` → build web → deploy no Firebase Hosting. Automático, sem passo manual.

**Workflow:** `.github/workflows/firebase-hosting-deploy.yml` · **Tempo:** ~2min

## Passos

1. Checkout
2. Instala Flutter (stable)
3. `flutter pub get`
4. `flutter build web --release`
5. `firebase deploy --only hosting --project debugaomascote --token "$FIREBASE_TOKEN"`

Não roda `build_runner` — os arquivos gerados (`.g.dart`/`.freezed.dart`) já vêm comitados no
repo. **Se mexer em `@riverpod`/`@freezed`, rode `build_runner build` e comite antes do push**,
senão o deploy vai sair desatualizado.

## Autenticação

Secret `FIREBASE_TOKEN` no GitHub (Settings → Secrets → Actions), gerado via `firebase login:ci`.

Trocar o token:
```bash
firebase login:ci
gh secret set FIREBASE_TOKEN --repo stheffanysantos/libug-game
```

## Domínios

Mesmo deploy atualiza os dois, sempre juntos:
- `debugaomascote.web.app`
- `libug.tets.app.br` (CNAME no Cloudflare → `debugaomascote.web.app`, SSL automático)

## Comandos úteis

```bash
gh run list --repo stheffanysantos/libug-game --limit 5
gh run watch <run-id> --repo stheffanysantos/libug-game
```

Deploy manual (sem CI):
```bash
flutter build web --release
firebase deploy --only hosting --project debugaomascote
```

## Problemas comuns

- **Build falha**: código quebrado ou `.g.dart`/`.freezed.dart` desatualizado.
- **Erro de autenticação no deploy**: `FIREBASE_TOKEN` expirou → gerar novo.
- **Site não atualiza**: cache da CDN (Fastly) — resolve sozinho ou com novo deploy.
