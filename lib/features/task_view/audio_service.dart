import 'package:assets_audio_player/assets_audio_player.dart';

abstract class AudioService {
  Future<void> playMusic();
  Future<void> stopMusic();
}

class AssetAudioService implements AudioService {
  final assetsAudioPlayer = AssetsAudioPlayer();
  final songs = <Audio>[
    Audio("assets/music/in_the_moment_steve_oxen_1.mp3"),
    Audio("assets/music/in_the_moment_steve_oxen_2.mp3"),
    Audio("assets/music/in_the_moment_steve_oxen_3.mp3"),
    Audio("assets/music/serenity_david_renda.mp3"),
    Audio("assets/music/we_were_friends_david_fesliyan.mp3"),
  ];

  Future<void> playMusic() async {
    songs.shuffle();

    assetsAudioPlayer.open(
      Playlist(audios: songs),
      loopMode: LoopMode.playlist,
    );
  }

  Future<void> stopMusic() async {
    assetsAudioPlayer.stop();
  }
}
