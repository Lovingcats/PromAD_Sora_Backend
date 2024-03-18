import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promad_sora/common/common.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Center(
          child: Column(children: [
            profileImage(),
            userName(),
            userEmail(),
            logoutButton(),
            creditText(),
            hasCreditText(),
            buyMoreButton(),
            getFreeButton(),
          ]),
        ),
      ),
    );
  }

  Padding getFreeButton() {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: backSubColor2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              minimumSize: Size(double.infinity, 45.h)),
          child: Text(
            "Get free",
            style: TextStyle(
                fontSize: 15.sp, color: Colors.white, fontFamily: "Nexa_Bold"),
          )),
    );
  }

  Padding buyMoreButton() {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 20.h),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              minimumSize: Size(double.infinity, 45.h)),
          child: Text(
            "Buy more",
            style: TextStyle(
                fontSize: 15.sp, color: Colors.black, fontFamily: "Nexa_Bold"),
          )),
    );
  }

  Padding creditText() {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, top: 28.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            "Credits",
            style: TextStyle(
                fontSize: 18.sp, color: Colors.white, fontFamily: "Nexa_Bold"),
          )
        ],
      ),
    );
  }

  Padding hasCreditText() {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 23.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: backSubColor2),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 25.h,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Text(
            "You have 20 credits left",
            style: TextStyle(
                fontSize: 16.sp,
                color: const Color.fromARGB(255, 218, 218, 218),
                fontFamily: "Nexa_Regular"),
          )
        ],
      ),
    );
  }

  Padding logoutButton() {
    return Padding(
      padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 15.h),
      child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
              backgroundColor: backSubColor2,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r)),
              minimumSize: Size(double.infinity, 45.h)),
          child: Text(
            "Log out",
            style: TextStyle(
                fontSize: 15.sp, color: Colors.white, fontFamily: "Nexa_Bold"),
          )),
    );
  }

  Text userEmail() {
    return Text(
      "whehdrms68101@gmail.com",
      style: TextStyle(
        fontSize: 13.sp,
        color: const Color.fromARGB(255, 125, 124, 124),
      ),
    );
  }

  Padding userName() {
    return Padding(
      padding: EdgeInsets.only(top: 10.h, bottom: 5.h),
      child: Text(
        "Lovingcats",
        style: TextStyle(
            fontSize: 18.sp, color: Colors.white, fontFamily: "Nexa_Bold"),
      ),
    );
  }

  Padding profileImage() {
    return Padding(
      padding: EdgeInsets.only(top: 40.h),
      child: SizedBox(
        height: 125.h,
        width: 125.w,
        child: CircleAvatar(
          radius: 48.r,
          backgroundImage: const AssetImage("assets/img/cat2.jpeg"),
        ),
      ),
    );
  }
}
