import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/components/composed_component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/components/mixins/tapable.dart';

import '../../game_controller.dart';
import 'package:flutter/painting.dart';
import 'card.dart';

class Active extends PositionComponent
    with HasGameRef, Tapable, ComposedComponent {
  final GameController gameController;
  Offset position;

  Card card;

  Active(this.gameController, x, y) : super();

  void setCard(Card _card) {
    _card.setPosition(this.x + (gameController.tileSize * 0.5), this.y);
    this.card = _card;
    components.add(this.card);
  }
}
