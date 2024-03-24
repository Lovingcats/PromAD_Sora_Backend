import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promad_sora/common/common.dart';

class VideoSuccess extends StatelessWidget {
  const VideoSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 150.h),
              child: Container(
                width: double.infinity,
                height: 270.h,
                decoration: BoxDecoration(
                    border: Border.all(color: backSubColor1),
                    borderRadius: BorderRadius.circular(20.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "대충 동영상 들어감",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: backSubColor1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 40.h),
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 186, 255, 217),
                        Color.fromARGB(255, 150, 255, 255),
                        Color(0xFF00FFFF),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "download",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: const Color(0xff555555),
                      fontFamily: 'Nexa_Regular',
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 15.h),
              child: GestureDetector(
                onTap: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child: Container(
                  width: double.infinity,
                  height: 50.h,
                  decoration: BoxDecoration(
                    color: backSubColor2,
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "back",
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: const Color.fromARGB(255, 152, 149, 149),
                      fontFamily: 'Nexa_Regular',
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
