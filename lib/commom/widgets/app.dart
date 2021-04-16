// 透明背景AppBar
import 'package:flutter/material.dart';
import 'package:jetlinks_app/commom/values/colors.dart';
import 'package:pk_skeleton/pk_skeleton.dart';

Widget transparentAppBar(
    {@required BuildContext context,
    Widget title,
    Widget leading,
    List<Widget> actions}) {
  return AppBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    title: title,
    leading: leading,
    actions: actions,
  );
}

Widget blueAppBar(
    {@required BuildContext context,
    Widget title,
    Widget leading,
    bool centerTitle = false,
    List<Widget> actions}) {
  return AppBar(
    backgroundColor: AppColors.bgBlue,
    centerTitle: centerTitle,
    elevation: 0,
    title: title,
    leading: leading,
    actions: actions,
  );
}

Widget cardListSkeleton() {
  return PKCardPageSkeleton(
    totalLines: 0,
  );
}

Widget cardProfileSkeleton() {
  return PKCardProfileSkeleton(
    isCircularImage: true,
    isBottomLinesActive: true,
  );
}

Widget postContentLoading() {
  return Image.asset('assets/images/loading.gif');
}
