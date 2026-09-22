/// Abstração mínima sobre "tocar um arquivo de áudio", só para permitir um
/// fake nos testes sem precisar mockar o `MethodChannel` do `audioplayers`
/// (ver `audioplayers_sound_player.dart` para a implementação real).
abstract class SoundPlayer {
  /// `assetPath` é relativo a `assets/audio/` (ex.: `'walk.wav'`).
  Future<void> play(String assetPath);
}
