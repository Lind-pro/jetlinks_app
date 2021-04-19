import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:jetlinks_app/commom/router/application.dart';
import 'package:jetlinks_app/commom/router/index.dart';
import 'package:jetlinks_app/pages/application/index.dart';

class IndexPage extends StatefulWidget {
  IndexPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  @override
  void initState() {
    super.initState();
    print('index init');
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final router = FluroRouter();
    Routes.configureRoutes(router);
    Application.router = router;

    return ScreenUtilInit(
        designSize: Size(375, 734),
        allowFontScaling: false,
        builder: () => MaterialApp(
              builder: (context, child) => FlutterSmartDialog(child: child),
              title: 'Jetlinks',
              home: Scaffold(body: ApplicationPage()),
              onGenerateRoute: Application.router.generator,
              debugShowCheckedModeBanner: false,
            ));
  }
}
