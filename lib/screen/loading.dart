import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:promad_sora/common/common.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promad_sora/routes/page_route.dart';
import 'package:promad_sora/screen/videesuccess.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8), // 5초 동안 애니메이션 진행
    );

    _animation = Tween<double>(
      begin: 0,
      end: 100,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut, // 부드러운 애니메이션을 위해 곡선 사용
      ),
    );

    _controller.forward().whenComplete(() {
      // 애니메이션이 완료되면 다른 페이지로 이동
      Navigator.push(
        context,
        CustomPageRoute(child: const VideoSuccess()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
            child: Center(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 180.h),
                  width: double.infinity,
                  height: 300.h,
                  child: Lottie.asset('assets/lottie/loading3.json',
                      fit: BoxFit.contain)),
              Padding(
                padding: EdgeInsets.only(top: 190.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (context, child) {
                        return Text(
                          "${_animation.value.toStringAsFixed(0)}",
                          style: TextStyle(
                            fontSize: 20.sp,
                            color: Colors.white,
                            fontFamily: "Nexa_Bold",
                          ),
                        );
                      },
                    ),
                    Text(
                      " %",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const LoadingAnimation()
            ],
          ),
        )),
      ),
    );
  }
}

class LoadingAnimation extends StatefulWidget {
  const LoadingAnimation({super.key});

  @override
  _LoadingAnimationState createState() => _LoadingAnimationState();
}

class _LoadingAnimationState extends State<LoadingAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  String _loadingText = ".";
  late Timer _timer;

  @override
  void dispose() {
    _timer.cancel();
    _animationController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400))
      ..repeat();
    _timer = Timer.periodic(const Duration(milliseconds: 400), (Timer timer) {
      setState(() {
        if (_loadingText.endsWith("...")) {
          _loadingText = ".";
        } else {
          _loadingText += ".";
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animationController!,
      builder: (context, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 85.w,
            child: Text("Loading",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: backSubColor1,
                    fontFamily: "Nexa_Regular")),
          ),
          Text(_loadingText,
              style: TextStyle(fontSize: 21.sp, color: backSubColor1)),
        ],
      ),
    );
  }
}
