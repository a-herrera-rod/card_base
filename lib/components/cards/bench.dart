import 'package:card_base/enums/card_display.dart';

import '../../game_controller.dart';
import 'cards_array.dart';

class Bench extends CardsArray {
  Bench(GameController gameController, double x, double y)
      : super(gameController, x, y, 3, ArrayDisplay.row);

  static int maxCards = 5;
}
