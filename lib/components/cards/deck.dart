import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/painting.dart';

import 'package:stack/stack.dart';

import '../../game_controller.dart';
import 'card.dart';
import 'lists/base_set.dart';

class Deck extends SpriteComponent {
  final GameController gameController;
  Stack<Card> cards;

  //TextPainter painter;
  Offset position;

  Deck(this.gameController)
      : super.fromSprite(gameController.tileSize, gameController.tileSize * 1.7,
            new Sprite('cards/cover.png')) {
    final size = gameController.tileSize;
    this.x = gameController.screenSize.width - size * 1.5;
    this.y = gameController.screenSize.height / 2 + size * 1;
    cards = Stack();
    getAllCards();
  }

  /*void render(Canvas c){
    Paint color = Paint()..color = Color(0xFF0200FF);
    c.drawRect(deckRect, color);
    painter.paint(c, position);
  }*/

  /*
  void update(double t){
    if (cards.isNotEmpty){
      if ((painter.text ?? '') != "D"){
        painter.text = TextSpan(text: "D",
            style: TextStyle(
              color: Color(0xFFFFFFFF),
              fontSize: 70.0,
            )
        );
        painter.layout();

        final size = gameController.tileSize * 1.5;
        position = Offset(
            (gameController.screenSize.width / 4 - size / 2),
            (gameController.screenSize.height / 4 - size / 2)
        );
      }
      //gameController.initialize();
    }
  }*/

  void getAllCards() {
    for (var name in BaseSet) {
      cards.push(Card(gameController, name));
    }
  }

  Card take() {
    if (cards.isNotEmpty) {
      var card = cards.pop();
      card.inPlay = true;
      return card;
    }
    return null;
  }

  /*void onTapDown() {
    if (cards.isNotEmpty) {
      var card = cards.pop();
      card.inPlay = true;
      gameController.showCard(card);
    } else {
      gameController.showCard(Card(gameController, 'system/cover.png'));
      getAllCards();
    }
  }*/
}
