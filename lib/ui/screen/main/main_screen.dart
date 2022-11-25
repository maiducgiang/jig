import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/ui/screen/main/feed/feed_screen.dart';
import 'package:jig/ui/screen/main/home/home_screen.dart';
import 'package:jig/ui/screen/main/notifications/notification_screen.dart';
import 'package:jig/ui/screen/main/profile/profile_screen.dart';
import 'package:jig/ui/screen/main/system/system_screen.dart';
import 'package:jig/ui/theme/constant.dart';

import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  var tabIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  final _screenList = [
    HomeScreen(),
    SystemScreen(),
    FeedScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];

  void changeTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  getScreen() => _screenList[tabIndex];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: getScreen(),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 3,
                offset: const Offset(0, 4), // changes position of shadow
              ),
            ],
          ),
          child: BottomNavigationBar(
            selectedFontSize: 12.sp,
            unselectedFontSize: 12.sp,
            backgroundColor: Colors.white,
            // selectedLabelStyle: TextStyle(fontSize: ),
            onTap: changeTabIndex,
            currentIndex: tabIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: primaryColor,
            unselectedItemColor: const Color(0xFF102536),
            elevation: 0,
            items: [
              BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                    width: 30.w,
                    height: 30.w,
                    child: SvgPicture.asset(
                      "assets/images/icon/icons_bottombar/home.svg",
                      //color: primaryColor,
                    ),
                  ),
                  activeIcon: Container(
                    padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                    width: 30.w,
                    height: 30.w,
                    child: SvgPicture.asset(
                      "assets/images/icon/icons_bottombar/home.svg",
                      color: primaryColor,
                    ),
                  ),
                  label: 'Trang chủ'),
              BottomNavigationBarItem(
                  icon: Container(
                    padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                    width: 30.w,
                    height: 30.w,
                    child: SvgPicture.asset(
                      "assets/images/icon/icons_bottombar/system.svg",
                      //color: primaryColor,
                    ),
                  ),
                  activeIcon: Container(
                    padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                    width: 30.w,
                    height: 30.w,
                    child: SvgPicture.asset(
                      "assets/images/icon/icons_bottombar/system.svg",
                      color: primaryColor,
                    ),
                  ),
                  label: 'Hệ thống'),
              BottomNavigationBarItem(
                  icon: Container(
                    width: 30.w,
                    height: 30.w,
                    padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                    child: SvgPicture.asset(
                      "assets/images/icon/icons_bottombar/new.svg",
                      //color: primaryColor,
                    ),
                  ),
                  activeIcon: Container(
                    width: 30.w,
                    height: 30.w,
                    padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                    child: SvgPicture.asset(
                      "assets/images/icon/icons_bottombar/new.svg",
                      color: primaryColor,
                    ),
                  ),
                  label: 'Bảng tin'),
              BottomNavigationBarItem(
                  icon: Container(
                      padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                      width: 30.w,
                      height: 30.w,
                      child: SvgPicture.asset(
                        "assets/images/icon/icons_bottombar/notification.svg",
                        //color: primaryColor,
                      )),
                  activeIcon: Container(
                      padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                      width: 30.w,
                      height: 30.w,
                      child: SvgPicture.asset(
                        "assets/images/icon/icons_bottombar/notification.svg",
                        color: primaryColor,
                      )),
                  label: 'Thông báo'),
              BottomNavigationBarItem(
                  icon: Container(
                      padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                      width: 30.w,
                      height: 30.w,
                      child: SvgPicture.asset(
                        "assets/images/icon/icons_bottombar/account.svg",
                        //color: primaryColor,
                      )),
                  activeIcon: Container(
                      padding: EdgeInsets.only(bottom: 6.h, top: 6.h),
                      width: 30.w,
                      height: 30.w,
                      child: SvgPicture.asset(
                        "assets/images/icon/icons_bottombar/account.svg",
                        color: primaryColor,
                      )),
                  label: 'Tài khoản')
            ],
          ),
        ),
      ),
    );
  }
}
