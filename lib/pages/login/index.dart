import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:jetlinks_app/commom/api/user.dart';
import 'package:jetlinks_app/commom/router/application.dart';
import 'package:jetlinks_app/commom/values/colors.dart';
import 'package:jetlinks_app/commom/widgets/app.dart';
import 'package:jetlinks_app/commom/widgets/button.dart';
import 'package:jetlinks_app/commom/widgets/input.dart';
import 'package:jetlinks_app/global.dart';
import 'package:jetlinks_app/utils/screen.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  FocusNode focusInputUsernameNode;
  FocusNode focusInputPasswordNode;

  @override
  void setState(fn) {
    super.setState(fn);
    print('login page');
    focusInputUsernameNode = FocusNode();
    focusInputPasswordNode = FocusNode();
    print(focusInputPasswordNode);
  }

  @override
  void dispose() {
    focusInputUsernameNode.dispose();
    focusInputPasswordNode.dispose();
    super.dispose();
  }

  _handleSignIn() async {
    if (_usernameController.value.text == '') {
      SmartDialog.showToast('用户名不能为空');
      return;
    }
    if (_passwordController.value.text == '') {
      SmartDialog.showToast('密码不能为空');
      return;
    }

    Map<String, dynamic> data = {
      'username': _usernameController.value.text,
      'password': _passwordController.value.text,
      't': DateTime.now().microsecondsSinceEpoch,
      'tokenType': 'default'
    };
    SmartDialog.showLoading();
    dynamic _res = await UserAPI.login(context: context, params: data);
    SmartDialog.dismiss();
    print(_res);
    var responseData = _res.data;
    if (responseData['code'] != 200) {
      focusInputUsernameNode.unfocus();
      focusInputPasswordNode.unfocus();
      print(responseData['message']);
      SmartDialog.showToast(responseData['message']);
    } else {
      //登录成功
      print(responseData);
    }
  }

  Widget _buildAppBar() {
    return blueAppBar(
        context: context,
        title: Text(
          '登录',
          style: TextStyle(
              color: AppColors.white,
              fontFamily: 'Montserrat',
              fontSize: duSetFontSize(18),
              fontWeight: FontWeight.w600),
        ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_rounded),
            color: AppColors.white,
            iconSize: duSetFontSize(30),
            onPressed: () {
              if (Global.isOfflineLogin == false) {
                SmartDialog.showToast("您还没有登录");
                Application.router.navigateTo(context, '/');
              } else {
                Navigator.pop(context);
              }
            }));
  }

  Widget _buildLogo() {
    return Container(
      width: duSetWidth(110),
      margin: EdgeInsets.only(top: duSetHeight(40 + 44.0)), //顶部系统栏44px
      child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Container(
          height: duSetWidth(76),
          width: duSetWidth(76),
          margin: EdgeInsets.symmetric(horizontal: duSetWidth(15)),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                left: 0,
                top: 0,
                right: 0,
                child: Container(
                  height: duSetWidth(76),
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.all(Radius.circular(duSetWidth(76 * 0.5))),
                  ),
                  child: Container(),
                ),
              ),
              Positioned(
                  child: Image.asset(
                'assets/images/logo.png',
                width: duSetWidth(90),
                height: duSetHeight(90),
                fit: BoxFit.cover,
              ))
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: duSetHeight(15)),
          child: Text(
            'Jetlinks',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: AppColors.fontBlack,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w600,
                fontSize: duSetFontSize(24),
                height: 1),
          ),
        )
      ]),
    );
  }

  // 登录表单
  Widget _buildInputForm() {
    return Container(
      margin: EdgeInsets.only(top: duSetHeight(49)),
      child: Column(
        children: [
          // 用户名
          inputTextEdit(
              controller: _usernameController,
              keyboardType: TextInputType.text,
              hintText: '用户名',
              marginTop: 0,
              focusNode: focusInputUsernameNode),
          inputTextEdit(
              controller: _passwordController,
              keyboardType: TextInputType.visiblePassword,
              hintText: '密码',
              isPassword: true,
              focusNode: focusInputPasswordNode),
          Padding(
              padding: EdgeInsets.only(top: duSetHeight(20)),
              child: btnFlatButtonWidget(
                  onPressed: () => _handleSignIn(),
                  gbColor: AppColors.bgBlue,
                  fontColor: AppColors.white,
                  title: '登 录'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: Center(
        child: Container(
          padding: EdgeInsets.only(left: duSetWidth(40), right: duSetWidth(40)),
          child: Column(
            children: <Widget>[_buildLogo(), _buildInputForm()],
          ),
        ),
      ),
    );
  }
}
