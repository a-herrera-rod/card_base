import 'package:card_base/enums/card_display.dart';

import '../../game_controller.dart';
import 'cards_array.dart';

class Prizes extends CardsArray {
  Prizes(GameController gameController, double x, double y)
      : super(gameController, x, y, gameController.tileSize * -0.7,
            ArrayDisplay.prizes);
  int maxCards = 6;
}
