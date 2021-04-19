import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:jetlinks_app/commom/router/route_handlers.dart';

class Routes {
  static String root = '/';
  static String login = '/login';
  static String welcome = '/welcome';

  static void configureRoutes(FluroRouter router) {
    router.notFoundHandler = Handler(
        handlerFunc: (BuildContext context, Map<String, dynamic> params) {
      print('Route was not Found!!!');
      return;
    });

    router.define(root, handler: applicationHandler);
    router.define(login, handler: loginPageHandler);
  }
}
