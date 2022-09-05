import 'dart:io' show Platform;

import 'package:example/main.dart';
import 'package:flutter/material.dart';
import 'package:maestro_test/maestro_test.dart';

import 'config.dart';

late String mapsId;
late String myAppId;

Future<void> main() async {
  if (Platform.isIOS) {
    mapsId = 'com.apple.Maps';
    myAppId = 'pl.leancode.maestro.Example';
  } else if (Platform.isAndroid) {
    mapsId = 'com.google.android.apps.maps';
    myAppId = 'pl.leancode.maestro.example';
  }

  final maestro = Maestro.forTest();

  maestroTest(
    'counter state is the same after going to Home and switching apps',
    ($) async {
      await $.pumpWidgetAndSettle(const ExampleApp());

      await $(FloatingActionButton).tap();
      await $(FloatingActionButton).tap();

      await maestro.pressHome();
      await Future<void>.delayed(const Duration(seconds: 3));

      $.log("I went to home! Now I'm gonna open the mail app");

      await maestro.openApp(id: mapsId);
      await Future<void>.delayed(const Duration(seconds: 3));
      $.log("Opened mail app! Now I'm gonna go to home");

      await maestro.pressHome();
      await Future<void>.delayed(const Duration(seconds: 3));

      await maestro.openApp(id: myAppId);
      await Future<void>.delayed(const Duration(seconds: 1));
      $.log('Opening the app under test again...');

      expect($(#counterText).text, '2');

      $.log("More functionality is not implemented, so I'm gonna head out now");
    },
    config: maestroConfig,
  );
}
