import 'dart:ui';
import 'package:langaw/langaw-game.dart';

class Fly {
  final LangawGame game;
  Rect flyRect;
  Paint flyPaint;
  bool isDead = false;

  Fly(this.game, double x, double y) {
    flyRect = Rect.fromLTWH(x, y, game.tileSize, game.tileSize);
    flyPaint = Paint();
    flyPaint.color = Color(0xff6ab04c);
  }

  void render(Canvas c) {
    c.drawRect(flyRect, flyPaint);
  }

  void update(double t) {}

  void onTapDown() {
    isDead = true;
    flyPaint.color = Color(0xffff4757);
  }
}
