import 'dart:math';
import 'dart:ui';
import 'package:card_base/components/highscore_text.dart';
import 'package:card_base/components/start_text.dart';
import 'package:card_base/enemy_spawner.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/enemy.dart';
import 'components/health_bar.dart';
import 'components/player.dart';
import 'components/score_text.dart';
import 'game_state.dart';

class GameController extends Game{
  final SharedPreferences storage;
  Random rand;
  Size screenSize;
  double tileSize;
  Player player;
  List<Enemy> enemies;
  HealthBar healthBar;
  EnemySpawner enemySpawner;
  int score;
  ScoreText scoreText;
  GameState state;
  HighscoreText highscoreText;
  StartText startText;

  GameController(this.storage) {
    initialize();
  }

  void initialize() async {
    resize(await Flame.util.initialDimensions());
    state = GameState.menu;
    rand = Random();
    player = Player(this);
    enemies = List<Enemy>();
    healthBar = HealthBar(this);
    enemySpawner = EnemySpawner(this);
    score = 0;
    scoreText = ScoreText(this);
    highscoreText = HighscoreText(this);
    startText = StartText(this);
  }

  void render(Canvas c){
    Rect background = Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
    Paint backgroundPaint = Paint()..color = Color(0xFFFAFAFA);
    c.drawRect(background, backgroundPaint);

    player.render(c);

    if (state == GameState.menu){
      startText.render(c);
      highscoreText.render(c);
    }
    else if (state == GameState.playing) {
      enemies.forEach((Enemy enemy) => enemy.render(c));
      scoreText.render(c);
      healthBar.render(c);
    }
  }

  void update(double t){
    if (state == GameState.menu){
      startText.update(t);
      highscoreText.update(t);
    }
    else if (state == GameState.playing) {
      enemySpawner.update(t);
      enemies.forEach((Enemy enemy) => enemy.update(t));
      enemies.removeWhere((Enemy enemy) => enemy.isDead);
      player.update(t);
      scoreText.update(t);
      healthBar.update(t);
    }
  }

  void resize(Size size){
    screenSize = size;
    tileSize = screenSize.width / 10;
  }

  void onTapDown(TapDownDetails d) {
    if (state == GameState.menu){
      state = GameState.playing;
    }
    else if (state == GameState.playing){
      enemies.forEach((Enemy enemy) {
        if (enemy.enemyRect.contains(d.globalPosition)){
          enemy.onTapDown();
        }
      });
    }
  }

  void spawnEnemy() {
    double x, y;
    switch (rand.nextInt(4)){
      case 0: //Top
        x = rand.nextDouble() * screenSize.width;
        y = -tileSize * 2.5;
        break;
      case 1: //Right
        x = screenSize.width + tileSize * 2.5;
        y = rand.nextDouble() * screenSize.height;
        break;
      case 2://Bottom
        x = rand.nextDouble() * screenSize.width;
        y = screenSize.height + tileSize * 2.5;
        break;
      case 3://Left
        x = -tileSize * 2.5;
        y = rand.nextDouble() * screenSize.height;
        break;
    }
    enemies.add(Enemy(this, x, y));
  }
}