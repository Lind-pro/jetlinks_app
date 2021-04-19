import 'package:flutter/material.dart';
import 'package:jetlinks_app/commom/router/application.dart';
import 'package:jetlinks_app/commom/values/colors.dart';
import 'package:jetlinks_app/commom/widgets/app.dart';
import 'package:jetlinks_app/global.dart';
import 'package:jetlinks_app/pages/alarm/index.dart';
import 'package:jetlinks_app/pages/device/index.dart';
import 'package:jetlinks_app/pages/home/index.dart';
import 'package:jetlinks_app/pages/profile/index.dart';
import 'package:jetlinks_app/utils/font.dart';
import 'package:jetlinks_app/utils/screen.dart';

class ApplicationPage extends StatefulWidget {
  ApplicationPage({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ApplicationPageState();
}

class _ApplicationPageState extends State<ApplicationPage>
    with SingleTickerProviderStateMixin {
  int _page = 0;
  final List<String> _tabTitles = ["首页", "装备", "告警", "我的"];
  final List<BottomNavigationBarItem> _bottomTabs = <BottomNavigationBarItem>[
    // home
    new BottomNavigationBarItem(
        icon: Icon(Iconfont.home, color: AppColors.tabBarElement),
        activeIcon: Icon(Iconfont.home, color: AppColors.fontBlue),
        label: '首页',
        backgroundColor: AppColors.white),
    new BottomNavigationBarItem(
        icon: Icon(Iconfont.hot, color: AppColors.tabBarElement),
        activeIcon: Icon(Iconfont.hot, color: AppColors.bgBlue),
        label: '装备',
        backgroundColor: AppColors.white),
    new BottomNavigationBarItem(
        icon: Icon(Iconfont.message, color: AppColors.tabBarElement),
        activeIcon: Icon(Iconfont.message, color: AppColors.bgBlue),
        label: '告警',
        backgroundColor: AppColors.white),
    new BottomNavigationBarItem(
        icon: Icon(Iconfont.profile, color: AppColors.tabBarElement),
        activeIcon: Icon(Iconfont.profile, color: AppColors.fontBlue),
        label: '我的',
        backgroundColor: AppColors.white)
  ];

  PageController _pageController;

  Widget _buildAppBar() {
    return blueAppBar(
        context: context,
        centerTitle: true,
        title: Text(
          _tabTitles[_page],
          style: TextStyle(
              color: AppColors.white,
              fontFamily: 'Montserrat',
              fontSize: duSetFontSize(18),
              fontWeight: FontWeight.w600),
        ),
        leading: Image.asset('assets/images/logo.png'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.search),
              color: AppColors.white,
              iconSize: duSetFontSize(30),
              onPressed: () {
                Application.router.navigateTo(context, '/search');
              })
        ]);
  }

  Widget _buildBody() {
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        HomePage(),
        DevicePage(),
        AlarmPage(),
        ProfilePage(),
      ],
      controller: _pageController,
      onPageChanged: _handlePageChanged,
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
        items: _bottomTabs,
        currentIndex: _page,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: _handleNavBarTap);
  }

  void _handleNavBarTap(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }

  void _handlePageChanged(int page) {
    setState(() {
      if (page == 3 && !Global.isOfflineLogin) {
        Application.router.navigateTo(context, '/login');
        return;
      }
      this._page = page;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageController =
        new PageController(initialPage: this._page, keepPage: true);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
}
