import 'package:flame/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'game_controller.dart';
import 'package:flame/flame.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Util flameUtil = Util();
  await flameUtil.fullScreen();
  await flameUtil.setOrientation(DeviceOrientation.portraitUp);

  Flame.images.loadAll(
      <String>['cards/cover.png', 'system/mat.png', 'system/table.png']);

  SharedPreferences storage = await SharedPreferences.getInstance();
  GameController gameController = GameController(storage);
  runApp(gameController.widget);

  TapGestureRecognizer tapper = TapGestureRecognizer();
  //PanGestureRecognizer dragger = PanGestureRecognizer();
  tapper.onTapDown = gameController.onTapDown;
  //dragger.onStart = gameController.onDragStart;
  //dragger.onEnd = gameController.onDragEnd;
  flameUtil.addGestureRecognizer(tapper);
  //flameUtil.addGestureRecognizer(dragger);
}
