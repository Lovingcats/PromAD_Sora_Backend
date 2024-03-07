import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:promad_sora/common/common.dart';
import 'package:promad_sora/provider/user_provider.dart';
import 'package:promad_sora/screen/introslider/introslider.dart';
import 'package:provider/provider.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: backgroundColor,
      systemNavigationBarColor: backgroundColor));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp, // 세로 정방향만 사용할 수 있다.
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider()),
      ],
      child: ScreenUtilInit(
        //screenutil 라이브러리 (뒤에 .h, .w00, .r, .sp등등 크기를 반응형으로 만들어줌)
        designSize: const Size(360, 800), // 어떤 사이즈를 기준으로 만들것인가
        builder: (BuildContext context, Widget? child) => const MaterialApp(
            title: 'PromAD_sora',
            debugShowCheckedModeBanner: false,
            home: IntroduceSlider()),
      ),
    );
  }
}

class IntroduceSlider extends StatefulWidget {
  const IntroduceSlider({super.key});

  @override
  State<IntroduceSlider> createState() => _IntroduceSliderState();
}

class _IntroduceSliderState extends State<IntroduceSlider> {
  @override
  Widget build(BuildContext context) {
    return const IntroScreen();
  }
}
