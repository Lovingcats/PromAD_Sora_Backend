import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promad_sora/common/common.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late FocusNode _focusNode;
  TextEditingController _promptController = TextEditingController();
  Color _borderColor = const Color.fromARGB(255, 92, 91, 91);
  var promtHeight = 150.h;

  @override
  void initState() {
    super.initState();
    _promptController = TextEditingController();
    _focusNode = FocusNode();
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        // TextField가 포커스를 받으면 테두리 색상을 변경
        setState(() {
          _borderColor = const Color(0xff00FFFF);
        });
      } else {
        // 포커스를 잃으면 초기 색상으로 복원
        setState(() {
          _borderColor = const Color.fromARGB(255, 92, 91, 91);
        });
      }
    });
  }

  void _updateHeight(String text) {
    // 텍스트의 줄 수를 기반으로 높이를 계산합니다.
    final lines = '\n'.allMatches(text).length + 1;
    final newHeight = 150.h + (lines * 20.h); // 기본 높이 + 추가 높이
    setState(() {
      promtHeight = newHeight;
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Center(
          child: Column(children: [
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GradientText(
                    'PromAD',
                    style: TextStyle(
                      fontSize: 20.sp,
                    ),
                    colors: const [
                      Color.fromARGB(255, 186, 255, 217),
                      Color.fromARGB(255, 150, 255, 255),
                      Color(0xFF00FFFF),
                    ],
                  ),
                  Icon(
                    CupertinoIcons.money_dollar_circle,
                    size: 30.h,
                    color: Colors.white,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w, top: 30.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  FaIcon(
                    FontAwesomeIcons.penNib,
                    color: Colors.white,
                    size: 20.h,
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(
                    "Enter a description.",
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.white,
                        fontFamily: 'Nexa_Regular'),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 15.h),
              child: Container(
                padding: EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),
                width: double.infinity,
                height: promtHeight,
                decoration: BoxDecoration(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(25.r),
                    border: Border.all(color: _borderColor, width: 1.5.w)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextField(
                      focusNode: _focusNode,
                      controller: _promptController,
                      cursorColor: const Color.fromARGB(194, 96, 194, 130),
                      style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontFamily: 'Nexa_Regular'),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "What do you want to create ?",
                        hintStyle: TextStyle(
                            color: const Color.fromARGB(255, 92, 91, 91),
                            fontSize: 16.sp,
                            fontFamily: 'Nexa_Regular'),
                      ),
                      maxLines: null,
                      onChanged: (text) {
                        _updateHeight(text);
                      },
                    )
                  ],
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
