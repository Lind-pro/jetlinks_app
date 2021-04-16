import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jetlinks_app/commom/values/config.dart';
import 'package:jetlinks_app/utils/authentication.dart';
import 'package:jetlinks_app/utils/http.dart';
import 'package:jetlinks_app/utils/storage.dart';
import 'package:package_info/package_info.dart';

import 'commom/provider/app.dart';

class Global {
  //用户信息
  static Map profile = {
    'sign-time': 0,
    'set_indentity': null,
    'kbs-info': null,
    'kbs-key': null
  };

  // 发布渠道
  static String channel = "xiaomi";
  // 是否IOS
  static bool isIos = Platform.isIOS;
  // android设备信息
  static AndroidDeviceInfo androidDeviceInfo;
  // ios设备信息
  static IosDeviceInfo iosDeviceInfo;

  // 包信息
  static PackageInfo packageInfo;

  //是否第一次登录
  static bool isFirstOpen = true;
  // 是否离线登录
  static bool isOfflineLogin = false;
  // 应用状态
  static AppState appState = AppState();

  // 是否release 环境
  static bool get isRelease => bool.fromEnvironment('dart.vm.product');

  static Future init() async {
    // 延迟加载一会
    WidgetsFlutterBinding.ensureInitialized();
    // 工具初始化
    await StorageUtil.init();
    HttpUtil();
    // 读取设备第一次打开
    isFirstOpen = !StorageUtil().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    if (isFirstOpen) {
      StorageUtil().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }
    // 读取离线用户信息
    var _profileJSON = StorageUtil().getJSON(STORAGE_USER_PROFILE_KEY);
    if (_profileJSON != null) {
      profile = _profileJSON;
      isOfflineLogin = true;
    } else {
      deleteAuthentication();
    }
    // android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle =
          SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    // 读取设备信息
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if (Global.isIos) {
      Global.iosDeviceInfo = await deviceInfoPlugin.iosInfo;
    } else {
      Global.androidDeviceInfo = await deviceInfoPlugin.androidInfo;
    }

    // 包信息
    Global.packageInfo = await PackageInfo.fromPlatform();
  }

  // 持久化用户信息
  static Future<bool> saveProfile(userRes) {
    profile = userRes;
    Global.isOfflineLogin = true;
    return StorageUtil().setJSON(STORAGE_USER_PROFILE_KEY, userRes);
  }
}
