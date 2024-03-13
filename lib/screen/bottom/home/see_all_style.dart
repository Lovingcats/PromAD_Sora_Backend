import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promad_sora/common/common.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SeeAllStyle extends StatefulWidget {
  const SeeAllStyle({super.key});

  @override
  State<SeeAllStyle> createState() => _SeeAllStyleState();
}

class _SeeAllStyleState extends State<SeeAllStyle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                seeAllStyleAppbar(context),
                Wrap(
                  spacing: 30.w,
                  runSpacing: 10.w,
                  children: [
                    for (int i = 0; i < 10; i++)
                      Container(
                        width: 100.w,
                        height: 150.w,
                        color: Colors.white,
                      )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Padding seeAllStyleAppbar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 25.w, right: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.white,
                  fontFamily: "Nexa_Regular"),
            ),
          ),
          Text(
            "Set Theme",
            style: TextStyle(
                fontSize: 17.sp, color: Colors.white, fontFamily: "Nexa_Bold"),
          ),
          GradientText(
            'Done',
            style: TextStyle(fontSize: 17.sp, fontFamily: "Nexa_Regular"),
            colors: const [
              Color.fromARGB(255, 186, 255, 217),
              Color.fromARGB(255, 150, 255, 255),
              Color(0xFF00FFFF),
            ],
          ),
        ],
      ),
    );
  }
}
