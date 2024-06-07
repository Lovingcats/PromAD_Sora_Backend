import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:promad_sora/common/common.dart';
import 'package:promad_sora/common/secretkey.dart';
import 'package:promad_sora/provider/style_provider.dart';
import 'package:promad_sora/provider/user_provider.dart';
import 'package:promad_sora/screen/introslider/introslider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  Stripe.publishableKey = stripePublishKey;
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
        ChangeNotifierProvider.value(value: StyleProvider()),
      ],
      child: ScreenUtilInit(
        designSize: const Size(360, 800),
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
