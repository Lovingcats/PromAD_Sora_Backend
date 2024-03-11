import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promad_sora/common/common.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: null,
      body: SafeArea(
          child: Stack(
        children: [
          backgroundImage(),
          blackBackground(),
          Padding(
            padding: EdgeInsets.only(left: 25.w, top: 30.h),
            child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
              ),
            ),
          ),
          loginButtons(),
          welcomeText(),
        ],
      )),
    );
  }

  Row welcomeText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Welcome to SoraAD!",
              style: TextStyle(
                  fontSize: 30.sp,
                  color: Colors.white,
                  fontFamily: "Nexa_Bold"),
            ),
            Text(
              "Create your own AI advertisement!",
              style: TextStyle(
                  fontSize: 15.sp,
                  color: const Color.fromARGB(255, 143, 143, 143),
                  fontFamily: "Nexa_Regular"),
            ),
          ],
        )
      ],
    );
  }

  SizedBox backgroundImage() {
    return SizedBox(
        width: 360.w,
        child: Image.asset(
          "assets/img/loginbackground.jpeg",
          fit: BoxFit.contain,
        ));
  }

  Container blackBackground() {
    return Container(
      height: 800.h,
      width: 360.w,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment(0.0, 0.15),
              colors: [Colors.transparent, backgroundColor])),
    );
  }
}

Widget loginButtons() {
  return Padding(
    padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 325.h),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: makeLoginButtons(),
    ),
  );
}

List<Widget> makeLoginButtons() {
  List<String> buttonsUrl = [
    "assets/img/google.png",
    "assets/img/facebook.png",
    "assets/img/twitter.png"
  ];
  List<Widget> results = [];

  for (int i = 0; i < 3; i++) {
    results.add(Padding(
      padding: EdgeInsets.only(bottom: i == 1 ? 20.h : 15.h),
      child: Image.asset(
        buttonsUrl[i],
      ),
    ));
  }
  return results;
}
