import 'dart:ui';

import 'package:flutter/material.dart';

import '../game_controller.dart';
import 'package:flutter/painting.dart';

class Card {
  final GameController gameController;
  TextPainter painter;
  Offset position;

  int value;
  bool inPlay = false;
  Rect cardRect;

  Card(this.gameController, int _value){
    value = _value;
    final size = gameController.tileSize * 1.5;
    cardRect = Rect.fromLTWH(
        gameController.screenSize.width / 2 - size / 2,
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
    Paint color = Paint()..color = Color(0xFFFF5733);
    c.drawRect(cardRect, color);
    painter.paint(c, position);
  }

  void update(double t){
    if (inPlay){
     if ((painter.text ?? '') != gameController.card.value.toString()){
        painter.text = TextSpan(text: gameController.card.value.toString(),
            style: TextStyle(
              color: Colors.black,
              fontSize: 70.0,
            )
        );
        painter.layout();

        final size = gameController.tileSize * 1.5;
        position = Offset(
            (gameController.screenSize.width / 2 - size / 2),
            (gameController.screenSize.height / 4 - size / 2)
        );
      }
    }
  }
}