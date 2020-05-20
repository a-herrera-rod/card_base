import '../../game_controller.dart';
import 'cards_array.dart';

class Hand extends CardsArray {
  Hand(GameController gameController, double x, double y, double spacing)
      : super(gameController, x, y, spacing);
}
