import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:langaw/components/fly.dart';
import 'package:langaw/langaw-game.dart';

class AgileFly extends Fly {
  double get speed => game.tileSize * 5;

  AgileFly(LangawGame game, double x, double y) : super(game) {
    resize(x: x, y: y);
    flyingSprite = List<Sprite>();
    flyingSprite.add(Sprite('flies/agile-fly-1.png'));
    flyingSprite.add(Sprite('flies/agile-fly-2.png'));
    deadSprite = Sprite('flies/agile-fly-dead.png');
  }

  void resize({double x, double y}) {
    x ??= (flyRect?.left) ?? 0;
    y ??= (flyRect?.top) ?? 0;
    flyRect = Rect.fromLTWH(x, y, game.tileSize * 1, game.tileSize * 1);
    super.resize();
  }
}
