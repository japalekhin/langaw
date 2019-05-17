import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/widgets.dart';

class BGM {
  static AudioCache home;
  static AudioCache playing;
  static BGMType current;
  static bool isPaused = false;
  static bool isInitialized = false;

  static Future<void> preload() async {
    home = AudioCache(prefix: 'audio/', fixedPlayer: AudioPlayer());
    await home.load('bgm/home.mp3');
    await home.fixedPlayer.setReleaseMode(ReleaseMode.LOOP);

    playing = AudioCache(prefix: 'audio/', fixedPlayer: AudioPlayer());
    await playing.load('bgm/playing.mp3');
    await playing.fixedPlayer.setReleaseMode(ReleaseMode.LOOP);

    isInitialized = true;
  }

  static Future<void> _update() async {
    if (!isInitialized) return;
    if (current == null) return;

    if (isPaused) {
      if (current == BGMType.home) await home.fixedPlayer.pause();
      if (current == BGMType.playing) await home.fixedPlayer.pause();
    } else {
      if (current == BGMType.home) await home.fixedPlayer.resume();
      if (current == BGMType.playing) await home.fixedPlayer.resume();
    }
  }

  static Future<void> play(BGMType what) async {
    if (current != what) {
      if (what == BGMType.home) {
        current = BGMType.home;
        await playing.fixedPlayer.stop();
        await home.loop('bgm/home.mp3', volume: .25);
      }
      if (what == BGMType.playing) {
        current = BGMType.playing;
        await playing.fixedPlayer.stop();
        await home.loop('bgm/playing.mp3', volume: .25);
      }
    }
    _update();
  }

  static void pause() {
    isPaused = true;
    _update();
  }

  static void resume() {
    isPaused = false;
    _update();
  }
}

class BGMHandler extends WidgetsBindingObserver {
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      BGM.resume();
    } else {
      BGM.pause();
    }
  }
}

enum BGMType {
  home,
  playing,
}
