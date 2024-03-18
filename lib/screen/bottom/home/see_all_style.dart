import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promad_sora/common/common.dart';
import 'package:promad_sora/widgets/see_all_wrap.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SeeAllStyle extends StatefulWidget {
  const SeeAllStyle({super.key});

  @override
  State<SeeAllStyle> createState() => _SeeAllStyleState();
}

class _SeeAllStyleState extends State<SeeAllStyle> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  seeAllStyleAppbar(context),
                  seeAllStyleTextfield(context),
                  const SeeAllStyleWrap()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding seeAllStyleTextfield(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 12.h),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30.r)),
            color: backSubColor2),
        child: TextField(
          cursorColor: const Color.fromARGB(194, 96, 194, 130),
          controller: _searchController,
          textAlign: TextAlign.start,
          style: TextStyle(
              fontFamily: "Nexa_Regular",
              color: const Color.fromARGB(255, 153, 153, 153),
              fontSize: 14.sp),
          textAlignVertical: TextAlignVertical.center,
          decoration: InputDecoration(
            hintText: 'Search',
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: backSubColor1,
            ),
            border: InputBorder.none,
            contentPadding:
                EdgeInsets.only(left: 15.w, right: 0, top: 0, bottom: 2.h),
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {
                setState(() {
                  _searchController.clear();
                  FocusScope.of(context).unfocus();
                });
              },
              icon: Icon(
                Icons.search,
                size: 22.h,
                color: backSubColor1,
              ),
            ),
          ),
          onChanged: (value) {
            setState(() {});
          },
        ),
      ),
    );
  }

  Padding seeAllStyleAppbar(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.h, left: 25.w, right: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Text(
              "Cancel",
              style: TextStyle(
                  fontSize: 17.sp,
                  color: Colors.white,
                  fontFamily: "Nexa_Regular"),
            ),
          ),
          Text(
            "Set Theme",
            style: TextStyle(
                fontSize: 17.sp, color: Colors.white, fontFamily: "Nexa_Bold"),
          ),
          GradientText(
            'Done',
            style: TextStyle(fontSize: 17.sp, fontFamily: "Nexa_Regular"),
            colors: const [
              Color.fromARGB(255, 186, 255, 217),
              Color.fromARGB(255, 150, 255, 255),
              Color(0xFF00FFFF),
            ],
          ),
        ],
      ),
    );
  }
}
