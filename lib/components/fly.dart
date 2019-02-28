import 'dart:ui';
import 'package:langaw/langaw-game.dart';

class Fly {
  final LangawGame game;
  Rect flyRect;

  Fly(this.game, double x, double y) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
  }

  void render(Canvas c) {}

  void update(double t) {}
}
