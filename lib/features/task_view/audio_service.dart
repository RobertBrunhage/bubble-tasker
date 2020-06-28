import 'package:assets_audio_player/assets_audio_player.dart';

abstract class AudioService {
  Future<void> playMusic();
  Future<void> stopMusic();
}

class AssetAudioService implements AudioService {
  final assetsAudioPlayer = AssetsAudioPlayer();

  Future<void> playMusic() async {
    assetsAudioPlayer.open(
      Audio("assets/music/test_music.mp3"),
      loopMode: LoopMode.playlist,
    );
  }

  Future<void> stopMusic() async {
    assetsAudioPlayer.stop();
  }
}
