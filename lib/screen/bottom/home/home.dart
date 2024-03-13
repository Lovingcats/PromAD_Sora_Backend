
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promad_sora/common/common.dart';
import 'package:promad_sora/routes/page_route.dart';
import 'package:promad_sora/screen/bottom/home/see_all_style.dart';
import 'package:promad_sora/screen/login.dart';
import 'package:promad_sora/widgets/selectsize_slider.dart';
import 'package:promad_sora/widgets/selectstyle_slider.dart';
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
  Color _borderColor = backSubColor1;
  var promtHeight = 150.h;
  int _lastLineBreakCount = 0;
  int lineBreakCount = 0;

  @override
  void initState() {
    super.initState();
    _promptController = TextEditingController();
    _promptController.addListener(_onTextChanged);
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
          _borderColor = backSubColor1;
        });
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    _promptController.dispose();
    _promptController.removeListener(_onTextChanged);
    super.dispose();
  }

  void _onTextChanged() {
    final currentText = _promptController.text;
    final currentLineBreakCount = '\n'.allMatches(currentText).length;

    if (currentLineBreakCount > _lastLineBreakCount) {
      // 줄바꿈이 추가됨
      setState(() {
        lineBreakCount++;
        if(lineBreakCount > 2){
          promtHeight += 25.h;
        }
      });
      
    } else if (currentLineBreakCount < _lastLineBreakCount) {
      // 줄바꿈이 삭제됨
      setState(() {
        lineBreakCount--;
        if(lineBreakCount > 1){
          promtHeight -= 25.h;
        }
      });
    }

    _lastLineBreakCount = currentLineBreakCount;
  }
  

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GradientText(
                      'PromAD',
                      style: TextStyle(
                          fontSize: 20.sp, fontFamily: "Nexa_Regular"),
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
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontFamily: 'Nexa_Regular'),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 15.h),
                child: Container(
                  padding:
                      EdgeInsets.only(left: 12.w, right: 12.w, bottom: 12.h),
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
                              color: backSubColor1,
                              fontSize: 16.sp,
                              fontFamily: 'Nexa_Regular'),
                        ),
                        maxLines: null,
                        textInputAction: TextInputAction.newline,
                        onChanged: (text) {
                          
                        },
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "(${_promptController.text.length}/1000)",
                            style: TextStyle(
                                fontSize: 12.sp,
                                color: backSubColor1,
                                fontFamily: "Rexa_Light"),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _promptController.clear();
                                _focusNode.unfocus();
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(left: 9.w),
                              height: 30.h,
                              width: 23.w,
                              decoration: const BoxDecoration(
                                  color: backSubColor2, shape: BoxShape.circle),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.xmark,
                                    color: backSubColor1,
                                    size: 17.h,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 30.h, left: 25.w, right: 25.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select Style",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontFamily: "Nexa_Regular"),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          CustomPageRoute(child: const SeeAllStyle()),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "See All",
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: backSubColor1,
                                fontFamily: "Nexa_Regular"),
                          ),
                          SizedBox(
                            width: 3.w,
                          ),
                          FaIcon(
                            FontAwesomeIcons.anglesRight,
                            color: backSubColor1,
                            size: 18.h,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(top: 20.h),
                  child: const SelectVideoStyleSlider()),
              Padding(
                padding: EdgeInsets.only(top: 30.h, left: 25.w, right: 25.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Video Size",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: Colors.white,
                          fontFamily: "Nexa_Regular"),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: EdgeInsets.only(
                      left: 25.w, right: 25.w, top: 20.h, bottom: 30.h),
                  child: const SelectVideoSizeSlider()),
              Padding(
                padding: EdgeInsets.only(left: 25.w, right: 25.w),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      CustomPageRoute(child: const Login()),
                    );
                  },
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
                      "Create",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: const Color(0xff555555),
                        fontFamily: 'Nexa_Regular',
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
