import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promad_sora/common/common.dart';
import 'package:promad_sora/screen/bottom/home.dart';
import 'package:promad_sora/screen/bottom/menu.dart';
import 'package:promad_sora/screen/bottom/profile.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class Bottom extends StatefulWidget {
  const Bottom({super.key});

  @override
  State<Bottom> createState() => _HomePageState();
}

class _HomePageState extends State<Bottom> {
  final TextEditingController _searchController = TextEditingController();
  dynamic selected = 0;
  var heart = false;
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        DefaultTabController(
            length: 3,
            child: Scaffold(
              backgroundColor: backgroundColor,
              appBar: null,
              extendBody: true,
              bottomNavigationBar: bottombar(),
              body: SafeArea(
                child: Stack(
                  children: [
                    PageView(
                      controller: controller,
                      physics: const NeverScrollableScrollPhysics(),
                      onPageChanged: ((value) {
                        if (value == 0) {
                          setState(() {
                            selected = 0;
                          });
                        } else if (value == 1) {
                          setState(() {
                            selected = 1;
                          });
                        } else if (value == 2) {
                          setState(() {
                            selected = 2;
                          });
                        } else {
                          setState(() {
                            selected = 3;
                          });
                        }
                      }),
                      children: [
                        AnimatedOpacity(
                            duration: const Duration(milliseconds: 10000),
                            opacity: selected == 0 ? 1 : 0,
                            child: Home()),
                        AnimatedOpacity(
                            duration: const Duration(milliseconds: 10000),
                            opacity: selected == 1 ? 1 : 0,
                            child: Menu()),
                        AnimatedOpacity(
                            duration: const Duration(milliseconds: 10000),
                            opacity: selected == 2 ? 1 : 0,
                            child: Profile()),
                      ],
                    ),
                  ],
                ),
              ),
            )),
      ],
    );
  }

  Theme bottombar() {
    return Theme(
      data: ThemeData(),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
                width: 0.2.w,
                color: const Color.fromARGB(255, 79, 79, 79)), // 흰색 테두리 추가
          ),
        ),
        child: StylishBottomBar(
          backgroundColor: backgroundColor,
          items: [
            BottomBarItem(
                selectedColor: Colors.black,
                backgroundColor: Colors.white,
                icon: Text(
                  String.fromCharCode(CupertinoIcons.house_fill.codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: const Color.fromARGB(255, 92, 91, 91),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w100,
                    fontFamily:
                        CupertinoIcons.exclamationmark_circle.fontFamily,
                    package: CupertinoIcons.exclamationmark_circle.fontPackage,
                  ),
                ),
                selectedIcon: Text(
                  String.fromCharCode(CupertinoIcons.house_fill.codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w100,
                    fontFamily:
                        CupertinoIcons.exclamationmark_circle.fontFamily,
                    package: CupertinoIcons.exclamationmark_circle.fontPackage,
                  ),
                ),
                title: Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Nexa_Regular',
                    color: selected == 0
                        ? Colors.white
                        : const Color.fromARGB(255, 92, 91, 91),
                  ),
                )),
            BottomBarItem(
                selectedColor: Colors.black,
                backgroundColor: Colors.white,
                icon: Text(
                  String.fromCharCode(
                      CupertinoIcons.square_list_fill.codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: const Color.fromARGB(255, 92, 91, 91),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w100,
                    fontFamily:
                        CupertinoIcons.exclamationmark_circle.fontFamily,
                    package: CupertinoIcons.exclamationmark_circle.fontPackage,
                  ),
                ),
                selectedIcon: Text(
                  String.fromCharCode(
                      CupertinoIcons.square_list_fill.codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w100,
                    fontFamily:
                        CupertinoIcons.exclamationmark_circle.fontFamily,
                    package: CupertinoIcons.exclamationmark_circle.fontPackage,
                  ),
                ),
                title: Text(
                  'Tools',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Nexa_Regular',
                    color: selected == 1
                        ? Colors.white
                        : const Color.fromARGB(255, 92, 91, 91),
                  ),
                )),
            BottomBarItem(
                selectedColor: Colors.black,
                backgroundColor: Colors.white,
                icon: Text(
                  String.fromCharCode(CupertinoIcons.profile_circled.codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: const Color.fromARGB(255, 92, 91, 91),
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w100,
                    fontFamily:
                        CupertinoIcons.exclamationmark_circle.fontFamily,
                    package: CupertinoIcons.exclamationmark_circle.fontPackage,
                  ),
                ),
                selectedIcon: Text(
                  String.fromCharCode(CupertinoIcons.profile_circled.codePoint),
                  style: TextStyle(
                    inherit: false,
                    color: Colors.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.w100,
                    fontFamily:
                        CupertinoIcons.exclamationmark_circle.fontFamily,
                    package: CupertinoIcons.exclamationmark_circle.fontPackage,
                  ),
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: 'Nexa_Regular',
                    color: selected == 2
                        ? Colors.white
                        : const Color.fromARGB(255, 92, 91, 91),
                  ),
                )),
          ],
          option: AnimatedBarOptions(
            iconSize: 23.h,
            barAnimation: BarAnimation.fade,
            iconStyle: IconStyle.Default,
            opacity: 0.3,
          ),
          currentIndex: selected ?? 0,
          hasNotch: true,
          onTap: (index) {
            controller.jumpToPage(index);
            setState(() {
              selected = index;
            });
          },
        ),
      ),
    );
  }
}
