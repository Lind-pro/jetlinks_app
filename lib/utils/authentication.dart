import 'package:flutter/material.dart';
import 'package:jetlinks_app/commom/router/application.dart';
import 'package:jetlinks_app/commom/values/config.dart';
import 'package:jetlinks_app/global.dart';
import 'package:jetlinks_app/utils/storage.dart';

Future<bool> isAuthenticated() async {
  var profileJson = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
  return profileJson != null;
}

Future deleteAuthentication() async {
  await StorageUtil().remove(STORAGE_USER_PROFILE_KEY);
  Global.profile = {
    'sign-time': 0,
    'set_identity': null,
    'kbs-info': null,
    'kbs-key': null
  };
  Global.isOfflineLogin = false;
}

Future goLoginPage(BuildContext context) async {
  await deleteAuthentication();
  Application.router.navigateTo(context, '/login');
}
