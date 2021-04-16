import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:jetlinks_app/pages/application/index.dart';

Handler applicationHandler =
    Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return ApplicationPage();
});
