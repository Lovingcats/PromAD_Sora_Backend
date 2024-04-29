import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promad_sora/common/common.dart';
import 'package:promad_sora/routes/page_route.dart';
import 'package:promad_sora/screen/loading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:promad_sora/util/toast_message.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
          backBtn(context),
          loginButtons(context),
          welcomeText(),
        ],
      )),
    );
  }

  Padding backBtn(BuildContext context) {
    return Padding(
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

Widget loginButtons(context) {
  return Padding(
    padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 325.h),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: makeLoginButtons(context),
    ),
  );
}

List<Widget> makeLoginButtons(context) {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'openid', // 인증 코드 요청 시 필요한 스코프입니다.
    ],
  );

  void showLoadingIndicator() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: CircularProgressIndicator(),
        );
      },
    );
  }

  Future<void> googleSignIn() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final String? authCode = googleAuth.accessToken;

        if (authCode != null) {
          Navigator.push(
            context,
            CustomPageRoute(child: const Loading()),
          );
        } else {
          showToastMessage(
              "Google didn't provide a verification code. Please retry");
        }
      } else {
        showToastMessage("Please try again.");
      }
    } catch (error) {
      showToastMessage("A minor error occurred. Please try again later.");
    }
  }

  List<String> buttonsUrl = [
    "assets/img/google.png",
    "assets/img/facebook.png",
    "assets/img/twitter.png"
  ];
  List<Widget> results = [];

  for (int i = 0; i < 3; i++) {
    results.add(Padding(
      padding: EdgeInsets.only(bottom: i == 1 ? 20.h : 15.h),
      child: GestureDetector(
        onTap: () async {
          await googleSignIn();
        },
        child: Image.asset(
          buttonsUrl[i],
        ),
      ),
    ));
  }
  return results;
}
