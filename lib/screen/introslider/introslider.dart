import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:promad_sora/common/common.dart';
import 'package:promad_sora/screen/bottom/bottom.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  IntroScreenState createState() => IntroScreenState();
}

// ------------------ Custom config ------------------
class IntroScreenState extends State<IntroScreen> {
  List<ContentConfig> listContentConfig = [];
  double sizeIndicator = 6.w;

  @override
  void initState() {
    super.initState();

    listContentConfig.add(
      ContentConfig(
        title: "Maplestory Mang Game",
        styleTitle: TextStyle(
            color: Colors.white,
            fontSize: 25.sp,
            fontWeight: FontWeight.bold,
            fontFamily: 'Nexa_Bold'),
        marginTitle: EdgeInsets.only(top: 480.h),
        description: "SSIBAL JEOT MANG GAME FUCK YOU",
        styleDescription: TextStyle(
            color: Colors.white, fontSize: 13.sp, fontFamily: 'Nexa_Regular'),
        marginDescription: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 5.h,
          bottom: 10.h,
        ),
        backgroundColor: backgroundColor,
        onCenterItemPress: () {},
      ),
    );
    listContentConfig.add(
      ContentConfig(
        title: "Flutter best Flutter good",
        styleTitle: TextStyle(
          color: const Color(0xff7FFFD4),
          fontSize: 25.sp,
          fontFamily: 'Nexa_Bold',
        ),
        marginTitle: EdgeInsets.only(top: 480.h),
        description: "wow! crossplatform framework. amazing",
        styleDescription: TextStyle(
          color: const Color(0xff7FFFD4),
          fontSize: 13.sp,
          fontFamily: 'Nexa_Regular',
        ),
        marginDescription: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 5.h,
          bottom: 10.h,
        ),
        colorBegin: const Color(0xff89D4CF),
        colorEnd: const Color(0xff734AE8),
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    listContentConfig.add(
      ContentConfig(
        title: "Debi Marlene",
        styleTitle: TextStyle(
          color: const Color(0xffFFDAB9),
          fontSize: 25.sp,
          fontFamily: 'Nexa_Bold',
        ),
        marginTitle: EdgeInsets.only(top: 480.h),
        description: "Black survival is very good game..!",
        styleDescription: TextStyle(
          color: const Color(0xffFFDAB9),
          fontSize: 13.sp,
          fontFamily: 'Nexa_Regular',
        ),
        marginDescription: EdgeInsets.only(
          left: 20.w,
          right: 20.w,
          top: 5.h,
          bottom: 10.h,
        ),
        maxLineTextDescription: 3,
      ),
    );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.keyboard_arrow_right,
      color: Colors.white,
      size: 25.h,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.white,
      size: 25.h,
    );
  }

  Widget renderSkipBtn() {
    return Padding(
      padding: EdgeInsets.only(bottom: 5.h),
      child: Text(
        "Skip",
        style: TextStyle(
            fontSize: 15.sp, color: Colors.white, fontWeight: FontWeight.w400),
      ),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(const StadiumBorder()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      key: UniqueKey(),
      // Content config
      listContentConfig: listContentConfig,
      backgroundColorAllTabs: Colors.grey,

      renderSkipBtn: renderSkipBtn(),
      onSkipPress: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Bottom()))
      },

      renderNextBtn: renderNextBtn(),

      renderDoneBtn: renderDoneBtn(),
      onDonePress: () => {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Bottom()))
      },

      indicatorConfig: IndicatorConfig(
        sizeIndicator: sizeIndicator,
        indicatorWidget: Container(
          width: sizeIndicator,
          height: sizeIndicator,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Colors.white, width: 0.5.w),
          ),
        ),
        activeIndicatorWidget: Container(
          width: sizeIndicator,
          height: sizeIndicator,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
        ),
        spaceBetweenIndicator: 8.w,
        typeIndicatorAnimation: TypeIndicatorAnimation.sliding,
      ),

      // Navigation bar
      navigationBarConfig: NavigationBarConfig(
        navPosition: NavPosition.bottom,
        padding: EdgeInsets.only(
          top: MediaQuery.of(context).viewPadding.top > 0 ? 20 : 10,
          bottom: MediaQuery.of(context).viewPadding.bottom > 0 ? 20 : 10,
        ),
        backgroundColor: Colors.transparent,
      ),

      curveScroll: Curves.bounceIn,
    );
  }
}
