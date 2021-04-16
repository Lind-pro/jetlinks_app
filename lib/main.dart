import 'package:flutter/material.dart';
import 'package:jetlinks_app/commom/provider/app.dart';
import 'package:jetlinks_app/global.dart';
import 'package:jetlinks_app/pages/index/index.dart';
import 'package:provider/provider.dart';

void main() => Global.init().then((value) => runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider<AppState>.value(value: Global.appState)
      ],
      child: Consumer<AppState>(
        builder: (context, appState, _) {
          if (appState.isGrayFilter) {
            return ColorFiltered(
                colorFilter: ColorFilter.mode(Colors.white, BlendMode.color),
                child: JetlinksApp());
          } else {
            return JetlinksApp();
          }
        },
      ),
    )));

class JetlinksApp extends StatelessWidget {
  const JetlinksApp({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IndexPage();
  }
}
