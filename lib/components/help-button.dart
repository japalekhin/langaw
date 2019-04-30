import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:langaw/langaw-game.dart';
import 'package:langaw/view.dart';

class HelpButton {
  final LangawGame game;
  Rect rect;
  Sprite sprite;

  HelpButton(this.game) {
    resize();
    sprite = Sprite('ui/icon-help.png');
  }

  void render(Canvas c) {
    sprite.renderRect(c, rect);
  }

  void resize() {
    rect = Rect.fromLTWH(
      game.tileSize * .25,
      game.screenSize.height - (game.tileSize * 1.25),
      game.tileSize,
      game.tileSize,
    );
  }

  void onTapDown() {
    game.activeView = View.help;
  }
}
