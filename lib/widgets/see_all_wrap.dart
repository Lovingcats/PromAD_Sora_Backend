import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promad_sora/common/common.dart';
import 'package:promad_sora/provider/style_provider.dart';
import 'package:provider/provider.dart';

class SeeAllStyleWrap extends StatefulWidget {
  const SeeAllStyleWrap({super.key});

  @override
  State<SeeAllStyleWrap> createState() => _SeeAllStyleWrapState();
}

class _SeeAllStyleWrapState extends State<SeeAllStyleWrap> {
  @override
  Widget build(BuildContext context) {
    var styleProvider = Provider.of<StyleProvider>(context);
    return Padding(
        padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 20.h),
        child: Wrap(
          spacing: 12.w,
          runSpacing: 13.w,
          children: makeStyleWidget(styleProvider),
        ));
  }

  List<Widget> makeStyleWidget(StyleProvider styleProvider) {
    var selectVideoStyleModel = styleProvider.selectVideoStyleModel;
    List<Widget> results = [];

    for (var i = 0; i < selectVideoStyleModel.length; i++) {
      bool isSelected = selectVideoStyleModel[i].isSelected;

      results.add(GestureDetector(
        onTap: () {
          for (int j = 0; j < selectVideoStyleModel.length; j++) {
            if (i == j) {
              setState(() {
                selectVideoStyleModel[j].isSelected = true;
              });
            } else {
              setState(() {
                selectVideoStyleModel[j].isSelected = false;
              });
            }
          }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 130.h,
              width: 100.w,
              margin: EdgeInsets.only(bottom: 5.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                border: Border.all(
                  color: isSelected ? mainColor : Colors.transparent,
                  width: 1.5.w,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.r),
                child: Image.asset(
                  selectVideoStyleModel[i].image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              selectVideoStyleModel[i].styleName,
              style: TextStyle(
                fontSize: 14.sp,
                color: isSelected ? Colors.white : backSubColor1,
                fontFamily: "Nexa_Regular",
              ),
            )
          ],
        ),
      ));
    }
    return results;
  }
}
