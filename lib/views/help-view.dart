import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:langaw/langaw-game.dart';

class HelpView {
  final LangawGame game;
  Rect rect;
  Sprite sprite;

  HelpView(this.game) {
    resize();
    sprite = Sprite('ui/dialog-help.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void resize() {
    rect = Rect.fromLTWH(
      game.tileSize * .5,
      (game.screenSize.height / 2) - (game.tileSize * 6),
      game.tileSize * 8,
      game.tileSize * 12,
    );
  }
}
