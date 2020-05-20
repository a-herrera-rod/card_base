import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

import '../../game_controller.dart';
import 'package:flutter/painting.dart';

class Card extends SpriteComponent {
  final GameController gameController;
  Offset position;

  final String value;
  bool inPlay = true;
  Rect cardRect;

  Card(this.gameController, this.value)
      : super.fromSprite(gameController.tileSize, gameController.tileSize * 1.7,
            new Sprite('cards/' + value + '.png'));

  void setPosition(double _x, double _y) {
    this.x = _x;
    this.y = _y;
  }

  void changePosition(double _x, double _y) {
    this.x += _x;
    this.y += _y;
  }

  /*@override
  void render(Canvas c) {
    //Sprite cardImg = Sprite('cards/' + gameController.card.value.toString() + '.png');
    //super.sprite = new Sprite('system/cover.png', width: 100, height: 200);
    if (this.inPlay) {
      super.render(c);
    }
    //cardImg.renderRect(c, this.toRect());
  }*/

  /*void update(double t){
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
  }*/
}
