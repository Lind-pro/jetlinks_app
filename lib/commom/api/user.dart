import 'package:flutter/material.dart';
import 'package:jetlinks_app/utils/http.dart';

class UserAPI {
  static Future<dynamic> login({
    @required BuildContext context,
    Map<String, dynamic> params,
  }) async {
    var res = await HttpUtil()
        .post('/jetlinks/authorize/login', context: context, params: params);
    return res;
  }
}
