import 'package:card_base/enums/card_display.dart';

import '../../game_controller.dart';
import 'cards_array.dart';

class Hand extends CardsArray {
  Hand(GameController gameController, double x, double y)
      : super(gameController, x, y, 5, ArrayDisplay.row);
}
