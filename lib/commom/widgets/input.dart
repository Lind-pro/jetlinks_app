import 'package:flutter/material.dart';
import 'package:jetlinks_app/commom/values/colors.dart';
import 'package:jetlinks_app/commom/widgets/radii.dart';
import 'package:jetlinks_app/utils/screen.dart';

// 输入框
Widget inputTextEdit(
    {@required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
    String hintText,
    bool isPassword = false,
    double marginTop = 15,
    Function submit,
    FocusNode focusNode}) {
  return Container(
    height: duSetHeight(44),
    margin: EdgeInsets.only(top: duSetHeight(marginTop)),
    decoration:
        BoxDecoration(color: AppColors.bgGrey, borderRadius: Radii.k6pxRadius),
    child: TextField(
      focusNode: focusNode,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
          border: InputBorder.none),
      style: TextStyle(
          color: AppColors.fontBlack,
          fontFamily: 'Avenir',
          fontWeight: FontWeight.w400,
          fontSize: duSetFontSize(18)),
      maxLines: 1,
      autocorrect: false,
      obscureText: isPassword,
      onSubmitted: (value) => submit(value),
    ),
  );
}

Widget inputEmailEdit({
  @required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  String hintText,
  bool isPassword = false,
  double marginTop = 15,
  bool autofocus = false,
}) {
  return Container(
    height: duSetHeight(44),
    margin: EdgeInsets.only(top: duSetHeight(marginTop)),
    decoration: BoxDecoration(
      color: AppColors.white,
      borderRadius: Radii.k6pxRadius,
      boxShadow: [
        BoxShadow(
          color: Color.fromARGB(41, 0, 0, 0),
          offset: Offset(0, 1),
          blurRadius: 0,
        ),
      ],
    ),
    child: TextField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: InputBorder.none,
        hintStyle: TextStyle(color: AppColors.fontBlack),
      ),
      style: TextStyle(
        color: AppColors.fontBlack,
        fontFamily: "Avenir",
        fontWeight: FontWeight.w400,
        fontSize: duSetFontSize(18),
      ),
      maxLines: 1,
      autocorrect: false, // 自动纠正
      obscureText: isPassword, // 隐藏输入内容, 密码框
    ),
  );
}
