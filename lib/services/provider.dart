import 'package:get_it/get_it.dart';
import 'package:f_set/services/alert.dart';

import 'package:f_set/services/sound.dart';

GetIt locator = new GetIt();

void setupLocator() {

  locator.registerSingleton(SoundService());
  locator.registerSingleton(AlertService());
}