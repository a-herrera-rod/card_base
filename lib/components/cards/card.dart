import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/mixins/resizable.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/material.dart';

import '../../game_controller.dart';
import 'package:flutter/painting.dart';

class Card extends PositionComponent with Resizable {
  final GameController gameController;
  Offset position;

  final String value;
  bool cover;
  CardCover cardCover;
  CardFace cardFace;

  Card(this.gameController, this.value, this.cover)
      : cardCover =
            CardCover(gameController.tileSize, gameController.tileSize * 1.7),
        cardFace = CardFace(
            gameController.tileSize, gameController.tileSize * 1.7, value),
        super();

  void setPosition(double _x, double _y) {
    this.x = _x;
    this.y = _y;
  }

  void changePosition(double _x, double _y) {
    this.x += _x;
    this.y += _y;
  }

  PositionComponent get card {
    return cover ? cardCover : cardFace;
  }

  void flip() {
    cover = !cover;
  }

  @override
  void render(Canvas c) {
    card.render(c);
  }

  @override
  void update(double t) {
    card.x = x;
    card.y = y;
    card.update(t);
  }

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

class CardCover extends SpriteComponent {
  CardCover(double width, double height)
      : super.fromSprite(width, height, new Sprite('cards/cover.png'));
}

class CardFace extends SpriteComponent {
  CardFace(double width, double height, String image)
      : super.fromSprite(width, height, new Sprite('cards/' + image + '.png'));
}
