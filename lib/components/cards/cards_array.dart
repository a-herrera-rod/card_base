import 'dart:ui';
import 'package:flame/components/component.dart';
import 'package:flame/components/composed_component.dart';
import 'package:flame/components/mixins/has_game_ref.dart';
import 'package:flame/components/mixins/tapable.dart';
import 'package:flame/game.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/src/gestures/tap.dart';

import '../../game_controller.dart';
import 'card.dart';

abstract class CardsArray extends PositionComponent
    with HasGameRef, Tapable, ComposedComponent {
  final GameController gameController;
  double spacing;
  List<Card> cards;

  CardsArray(this.gameController, double x, double y, this.spacing) : super() {
    this.x = x;
    this.y = y;
    cards = List();
  }

  void addCard(Card card) {
    card.setPosition(
        this.x + (gameController.tileSize + spacing) * cards.length, this.y);
    cards.add(card);
    components.add(card);
  }

  Card takeCard(int index) {
    var card = cards[index];
    cards.removeAt(index);
    return card;
  }

  bool empty() {
    return cards.length == 0;
  }

  //@override
  //void render(Canvas c) {}

  //@override
  //void update(double t) {}

  @override
  Game gameRef;

  @override
  bool checkTapOverlap(Offset o) {
    // TODO: implement checkTapOverlap
    throw UnimplementedError();
  }

  @override
  void handleTapCancel() {
    // TODO: implement handleTapCancel
  }

  @override
  void handleTapDown(TapDownDetails details) {
    // TODO: implement handleTapDown
  }

  @override
  void handleTapUp(TapUpDetails details) {
    // TODO: implement handleTapUp
  }

  @override
  void onTapCancel() {
    // TODO: implement onTapCancel
  }

  @override
  void onTapDown(TapDownDetails details) {
    // TODO: implement onTapDown
  }

  @override
  void onTapUp(TapUpDetails details) {
    // TODO: implement onTapUp
  }
}
