import 'dart:ui';
import 'package:flutter/painting.dart';

import 'package:stack/stack.dart';
import 'package:card_base/components/card.dart';

import '../game_controller.dart';



class Deck {
  final GameController gameController;
  Stack<Card> cards;

  Rect deckRect;
  TextPainter painter;
  Offset position;

  Deck(this.gameController){
    cards = Stack();
    getAllCards();
    final size = gameController.tileSize * 1.5;
    deckRect = Rect.fromLTWH(
        gameController.screenSize.width / 4 - size / 2,
        gameController.screenSize.height / 4 - size / 2,
        size,
        size);
    painter = TextPainter(
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr
    );
    position = Offset.zero;
  }

  void render(Canvas c){
    Paint color = Paint()..color = Color(0xFF0200FF);
    c.drawRect(deckRect, color);
    painter.paint(c, position);
  }

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
  }

  void getAllCards(){
    for (var i = 1; i <= 13; i++){
      cards.push(Card(gameController, i));
    }
  }

  void onTapDown() {
    if (cards.isNotEmpty){
      var card = cards.pop();
      card.inPlay = true;
      gameController.showCard(card);
    }
    else {
      gameController.showCard(Card(gameController,0));
      getAllCards();
    }
  }
}