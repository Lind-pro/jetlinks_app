import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:jetlinks_app/pages/application/index.dart';
import 'package:jetlinks_app/pages/login/index.dart';

Handler applicationHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ApplicationPage();
});

Handler loginPageHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return LoginPage();
});
