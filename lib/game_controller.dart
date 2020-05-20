import 'dart:math';
import 'dart:ui';
import 'package:card_base/components/cards/hand.dart';
import 'package:card_base/gameplay/TurnSequence.dart';
import 'package:flame/anchor.dart';
import 'package:flame/components/text_component.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/palette.dart';
import 'package:flame/text_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'components/cards/active.dart';
import 'components/cards/bench.dart';
import 'components/system/background.dart';
import 'components/cards/card.dart';
import 'components/cards/deck.dart';

//import 'components/player.dart';
import 'enums/game_state.dart';

class GameController extends BaseGame {
  final SharedPreferences storage;
  TextConfig regular =
      TextConfig(color: BasicPalette.black.color, fontSize: 48);
  Background background;
  Deck deck;
  Hand hand;
  Bench bench;
  Active activeCard;
  TurnSequence turn;
  Random rand;
  Size screenSize;
  double tileSize;
  //Player player;
  //List<Enemy> enemies;
  //HealthBar healthBar;
  //EnemySpawner enemySpawner;
  int score;
  //ScoreText scoreText;
  GameState state;
  //HighscoreText highscoreText;
  TextComponent startText;

  @override
  bool debugMode() => true;

  GameController(this.storage) {
    initialize();
  }

  void initialize() async {
    Size size = await Flame.util.initialDimensions();
    resize(size);
    state = GameState.menu;
    rand = Random();
    background = Background(this);
    setElements(size);

    this..add(startText)..add(hand)..add(bench)..add(activeCard)..add(deck);
    //player = Player(this);
    //card = Card(this, 'cover');
    //enemies = List<Enemy>();
    //healthBar = HealthBar(this);
    //enemySpawner = EnemySpawner(this);
    //score = 0;
    //scoreText = ScoreText(this);
    //highscoreText = HighscoreText(this);
    //startText = StartText(this);
    //Draggable(child: deck, feedback: Deck(this))
  }

  void setElements(Size size) {
    deck = Deck(this);
    hand = Hand(this, 10, this.screenSize.height - tileSize * 1.8, 5);
    bench = Bench(this, this.screenSize.width * 0.2 + 3,
        this.screenSize.height * 0.74, 3);
    activeCard =
        Active(this, this.screenSize.width * 4, this.screenSize.height * 0.55);
    turn = TurnSequence(this);

    startText = new TextComponent('Start', config: regular)
      ..anchor = Anchor.bottomCenter
      ..x = size.width / 2
      ..y = size.height * 0.9;
  }

  @override
  void render(Canvas c) {
    //player.render(c);

    if (state == GameState.menu) {
      Rect background =
          Rect.fromLTWH(0, 0, screenSize.width, screenSize.height);
      Paint backgroundPaint = Paint()..color = Color(0xFFFAFAFA);
      c.drawRect(background, backgroundPaint);
      startText.render(c);
      //highscoreText.render(c);
    } else if (state == GameState.playing) {
      background.render(c);
      hand.render(c);
      bench.render(c);
      activeCard.render(c);
      deck.render(c);

      /*if (card.inPlay) {
        card.render(c);
      }*/
      //enemies.forEach((Enemy enemy) => enemy.render(c));
      //scoreText.render(c);
      //healthBar.render(c);
    }
  }

  @override
  void update(double t) {
    if (state == GameState.menu) {
      //startText.update(t);
      /*highscoreText.update(t);*/
    } else if (state == GameState.playing) {
      if (hand.empty()) {
        turn.takeCards(7);
      }
      if (bench.empty()) {
        turn.addToBench1(null);
      }
      deck.update(t);
      hand.update(t);
      bench.update(t);
      activeCard.update(t);
      //card.update(t);
      /*enemySpawner.update(t);
      enemies.forEach((Enemy enemy) => enemy.update(t));
      enemies.removeWhere((Enemy enemy) => enemy.isDead);
      player.update(t);
      scoreText.update(t);
      healthBar.update(t);*/
    }
  }

  @override
  void resize(Size size) {
    screenSize = size;
    var x = screenSize.width;
    var y = screenSize.height;
    while (x != y) {
      if (x > y)
        x = x - y;
      else
        y = y - x;
    }
    tileSize = x; //screenSize.width / 10;
  }

  @override
  void onTapDown(TapDownDetails d) {
    if (state == GameState.menu) {
      state = GameState.playing;
    } else if (state == GameState.playing) {
      //deck.onTapDown();
      /*enemies.forEach((Enemy enemy) {
        if (enemy.enemyRect.contains(d.globalPosition)){
          enemy.onTapDown();
        }
      });*/
    }
  }

  void showCard(Card _card) {
    //card = Card(this, 'system/cover');
  }

  /* void spawnEnemy() {
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
  }*/
}
