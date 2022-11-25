import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:jig/ui/theme/constant.dart';

import 'package:shimmer/shimmer.dart';

class BaseScreenDetail extends StatefulWidget {
  const BaseScreenDetail({Key? key, required this.url, required this.child})
      : super(key: key);
  final String url;
  final Widget child;
  @override
  State<BaseScreenDetail> createState() => _BaseScreenDetailState();
}

class _BaseScreenDetailState extends State<BaseScreenDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: EdgeInsets.zero,
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              width: double.infinity,
              height: 300.h,
              padding: EdgeInsets.zero,
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 400.h,
                    padding: EdgeInsets.zero,
                    child: CachedNetworkImage(
                      imageUrl: widget.url,
                      memCacheHeight: 800,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.4),
                        highlightColor: Colors.grey.withOpacity(0.2),
                        child: Container(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 20.w,
                      top: 50.w,
                      child: InkWell(
                        onTap: (() {
                          context.router.pop();
                        }),
                        child: Container(
                          width: 40.w,
                          height: 40.w,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              //gradient: ,
                              color: Colors.grey[200],
                              shape: BoxShape.circle),
                          child: Icon(
                            Icons.keyboard_arrow_left,
                            size: 25.r,
                            color: secondaryColor,
                          ),
                        ),
                      ))
                ],
              ),
            ),
            widget.child
            //Expanded(child: widget.child)
            //Container(width: double.infinity, height: 1000.h, child: widget.child)
            // Container(
            //     width: double.infinity,
            //     height: double.infinity,
            //     padding: EdgeInsets.zero,
            //     child: )
          ]),
        ),
      ),
    );
  }
}
