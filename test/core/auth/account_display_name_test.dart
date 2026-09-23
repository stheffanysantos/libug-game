import 'package:flutter_test/flutter_test.dart';

import 'package:debuga_o_mascote/core/auth/auth_service.dart';
import 'package:debuga_o_mascote/core/auth/firebase_auth_service.dart';

void main() {
  group('accountDisplayName', () {
    test('sem nome, usa a parte do e-mail antes do @', () {
      expect(accountDisplayName(email: 'ana@exemplo.com'), 'ana');
    });

    test('nome salvo tem prioridade sobre o e-mail', () {
      expect(accountDisplayName(name: 'Ana Paula', email: 'ana@exemplo.com'), 'Ana Paula');
    });

    test('nome vazio ou só com espaços conta como sem nome', () {
      expect(accountDisplayName(name: '  ', email: 'ana@exemplo.com'), 'ana');
    });

    test('sem nome e sem e-mail devolve null', () {
      expect(accountDisplayName(), isNull);
      expect(accountDisplayName(email: '@exemplo.com'), isNull);
    });
  });

  group('authErrorMessage', () {
    test('invalid-credential cobre e-mail sem conta e senha errada', () {
      expect(authErrorMessage('invalid-credential'), 'E-mail ou senha incorretos.');
    });

    test('user-not-found e wrong-password continuam com a mensagem específica', () {
      expect(authErrorMessage('user-not-found'), 'Não encontramos uma conta com esse e-mail.');
      expect(authErrorMessage('wrong-password'), 'Senha incorreta.');
    });
  });
}
