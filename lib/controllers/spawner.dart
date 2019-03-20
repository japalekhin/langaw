import 'package:langaw/components/fly.dart';
import 'package:langaw/langaw-game.dart';

class FlySpawner {
  final LangawGame game;
  final int maxSpawnInterval = 3000;
  final int minSpawnInterval = 200;
  final int intervalChange = 200;
  final int maxFliesOnScreen = 7;
  int currentInterval;
  int nextSpawn;

  FlySpawner(this.game) {
    start();
    game.spawnFly();
  }

  void start() {
    killAll();
    currentInterval = maxSpawnInterval;
    nextSpawn = DateTime.now().millisecondsSinceEpoch + currentInterval;
  }

  void killAll() {
    game.flies.forEach((Fly fly) => fly.isDead = true);
  }

  void update(double t) {}
}
