import 'dart:ui';
import 'package:flame/sprite.dart';
import 'package:langaw/langaw-game.dart';

class Fly {
  final LangawGame game;
  List<Sprite> flyingSprite;
  Sprite deadSprite;
  double flyingSpriteIndex = 0;
  Rect flyRect;
  bool isDead = false;
  bool isOffScreen = false;
  Offset targetLocation;

  double get speed => game.tileSize * 3;

  Fly(this.game) {
    setTargetLocation();
  }

void setTargetLocation() {
  double x = game.rnd.nextDouble() * (game.screenSize.width - game.tileSize);
  double y = game.rnd.nextDouble() * (game.screenSize.height - game.tileSize);
  targetLocation = Offset(x, y);
}

  void render(Canvas c) {
    if (isDead) {
      deadSprite.renderRect(c, flyRect.inflate(2));
    } else {
      flyingSprite[flyingSpriteIndex.toInt()].renderRect(c, flyRect.inflate(2));
    }
  }

  void update(double t) {
    if (isDead) {
      flyRect = flyRect.translate(0, game.tileSize * 12 * t);
      if (flyRect.top > game.screenSize.height) {
        isOffScreen = true;
      }
    } else {
      flyingSpriteIndex += 30 * t;
      if (flyingSpriteIndex >= 2) {
        flyingSpriteIndex -= 2;
      }
    }
  }

  void onTapDown() {
    isDead = true;
    game.spawnFly();
  }
}
