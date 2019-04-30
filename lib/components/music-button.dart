import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:langaw/langaw-game.dart';

class MusicButton {
  final LangawGame game;
  Rect rect;
  Sprite enabledSprite;
  Sprite disabledSprite;
  bool isEnabled = true;

  MusicButton(this.game) {
    resize();
    enabledSprite = Sprite('ui/icon-music-enabled.png');
    disabledSprite = Sprite('ui/icon-music-disabled.png');
  }

  void render(Canvas c) {
    if (isEnabled) {
      enabledSprite.renderRect(c, rect);
    } else {
      disabledSprite.renderRect(c, rect);
    }
  }

  void resize() {
    rect = Rect.fromLTWH(
      game.tileSize * .25,
      game.tileSize * .25,
      game.tileSize,
      game.tileSize,
    );
  }

  void onTapDown() {
    if (isEnabled) {
      isEnabled = false;
      game.homeBGM.setVolume(0);
      game.playingBGM.setVolume(0);
    } else {
      isEnabled = true;
      game.homeBGM.setVolume(.25);
      game.playingBGM.setVolume(.25);
    }
  }
}
