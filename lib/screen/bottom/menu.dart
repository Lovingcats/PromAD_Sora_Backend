import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promad_sora/common/common.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(left: 25.w, top: 30.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 28.h,
                    ),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(
                      "Toolbox",
                      style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: "Nexa_Regular",
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
              for (int i = 0; i < 5; i++)
                Padding(
                  padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h),
                  child: Container(
                    width: double.infinity,
                    height: 300.h,
                    padding: EdgeInsets.only(
                        left: 20.w, right: 20.w, top: 30.h, bottom: 30.h),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 41, 41, 41),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: double.infinity,
                          height: 170.h,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  image: AssetImage("assets/img/tool1.png"),
                                  fit: BoxFit.fill),
                              borderRadius: BorderRadius.circular(20.r)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Video Merge",
                                  style: TextStyle(
                                      fontSize: 17.sp,
                                      color: Colors.white,
                                      fontFamily: "Nexa_Regular"),
                                ),
                                Text(
                                  "Merge your videos with prompts",
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      color: const Color.fromARGB(
                                          255, 115, 115, 115),
                                      fontFamily: "Nexa_Regular"),
                                ),
                              ],
                            ),
                            Container(
                              height: 33.h,
                              width: 33.w,
                              decoration: const BoxDecoration(
                                  color: backSubColor1, shape: BoxShape.circle),
                              child: Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 18.h,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
            ]),
          ),
        ),
      ),
    );
  }
}
