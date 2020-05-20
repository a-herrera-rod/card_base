import 'package:card_base/components/cards/card.dart';

import '../game_controller.dart';

class TurnSequence {
  final GameController gameController;

  TurnSequence(this.gameController);

  void takeCards(int num) {
    for (var i = 0; i < num; i++) {
      var card = gameController.deck.take();
      gameController.hand.addCard(card);
    }
  }

  void addToBench1(Card card) {
    for (var i = 0; i < 5; i++) {
      var card = gameController.deck.take();
      gameController.bench.addCard(card);
    }
  }

  void addToBench(Card card) {
    gameController.bench.addCard(card);
  }

  void endTurn() {}
}
