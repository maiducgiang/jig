import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:jig/ui/theme/constant.dart';
import 'package:jig/ui/theme/text_style.dart';

class BaseScreen extends StatelessWidget {
  const BaseScreen(
      {Key? key,
      this.title,
      this.leading,
      this.trailing,
      required this.child,
      this.elevation = 0.5,
      this.onPress,
      this.titleWidget,
      this.floatingActionButton,
      this.backgroundColor,
      this.titleColor = primaryColor})
      : super(key: key);

  final String? title;
  final List<Widget>? trailing;
  final Widget? leading;
  final Widget child;
  final double? elevation;
  final Function()? onPress;
  final Widget? titleWidget;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final Color? titleColor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      resizeToAvoidBottomInset: true,
      appBar: title != null
          ? AppBar(
              backgroundColor: backgroundColor ?? Colors.white,
              actions: trailing,
              leading: leading,
              automaticallyImplyLeading: leading != null ? true : false,
              elevation: elevation,
              centerTitle: true,
              title: Text(title!,
                  style: primaryTitleStyle.copyWith(
                      color: titleColor, fontSize: 18.sp)))
          : null,
      floatingActionButton: floatingActionButton,
      body: SafeArea(
        child: GestureDetector(
          child: child,
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
        ),
      ),
    );
  }
}

class BaseScreenSecond extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const BaseScreenSecond(
      {required this.title,
      this.leading,
      this.trailing,
      required this.child,
      this.elevation = 0.5,
      this.onPress,
      this.titleWidget,
      this.floatingActionButton,
      this.backgroundColor,
      this.titleColor = primaryColor,
      this.action})
      : super();

  final String title;
  final List<Widget>? trailing;
  final Widget? leading;
  final Widget child;
  final double? elevation;
  final Function()? onPress;
  final Widget? titleWidget;
  final Widget? floatingActionButton;
  final Color? backgroundColor;
  final Color? titleColor;
  final Widget? action;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(title,
            style: primaryTitleStyle.copyWith(
                color: secondaryColor, /*titleColor,*/ fontSize: 18.sp)),
        elevation: 0,
        actions: [SizedBox(width: 50.w, child: action)],
        leading: IconButton(
          icon: Icon(
            Ionicons.chevron_back_outline,
            size: 23.sp,
            color: secondaryColor, //primaryColor,
          ),
          onPressed: () {
            context.router.pop();
          },
        ),
      ),
      //backgroundColor: Colors.white,
      floatingActionButton: floatingActionButton,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.zero,
        child: GestureDetector(
          child: child,
          onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
              currentFocus.unfocus();
            }
          },
        ),
      ),
    );
  }
}
