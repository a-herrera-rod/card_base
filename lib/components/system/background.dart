import 'dart:ui';
import 'package:flame/sprite.dart';
import '../../game_controller.dart';

class Background {
  final GameController gameController;
  Sprite tableSprite;
  Sprite matSprite;

  Rect tableRect;
  Rect matRect;

  Background(this.gameController) {
    tableSprite = Sprite('system/table.png');
    matSprite = Sprite('system/mat.png');

    tableRect = Rect.fromLTWH(
        0,
        gameController.screenSize.height - (gameController.tileSize * 16),
        gameController.tileSize * 9,
        gameController.tileSize * 16);
    matRect = Rect.fromLTWH(
        gameController.tileSize / 4,
        gameController.screenSize.height - (gameController.tileSize * 14.25),
        gameController.tileSize * 8.5,
        gameController.tileSize * 12.5);
  }

  void render(Canvas c) {
    tableSprite.renderRect(c, tableRect);
    matSprite.renderRect(c, matRect);
  }

  void update(double t) {}
}
