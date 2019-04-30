import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:langaw/langaw-game.dart';

class SoundButton {
  final LangawGame game;
  Rect rect;
  Sprite enabledSprite;
  Sprite disabledSprite;
  bool isEnabled = true;

  SoundButton(this.game) {
    resize();
    enabledSprite = Sprite('ui/icon-sound-enabled.png');
    disabledSprite = Sprite('ui/icon-sound-disabled.png');
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
      game.tileSize * 1.5,
      game.tileSize * .25,
      game.tileSize,
      game.tileSize,
    );
  }

  void onTapDown() {
    isEnabled = !isEnabled;
  }
}
