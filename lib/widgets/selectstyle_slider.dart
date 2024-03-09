import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promad_sora/common/common.dart';
import 'package:promad_sora/model/videostyle_model.dart';

class SelectVideoStyleSlider extends StatefulWidget {
  const SelectVideoStyleSlider({super.key});

  @override
  State<SelectVideoStyleSlider> createState() => _SelectVideoStyleSliderState();
}

class _SelectVideoStyleSliderState extends State<SelectVideoStyleSlider> {
  List<SelectVideoStyleModel> selectVideoStyleModel = <SelectVideoStyleModel>[];
  @override
  void initState() {
    List<String> styleName = [
      "Cat1",
      "Cat2",
      "Cat3",
      "Cat4",
      "Cat5",
      "Cat6",
      "Cat7",
      "Cat8"
    ];

    for (int i = 0; i < 8; i++) {
      selectVideoStyleModel.add(SelectVideoStyleModel(
          styleName[i], "assets/img/cat${i + 1}.jpeg", i == 0 ? true : false));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: makeStyleWidget(),
      ),
    );
  }

  List<Widget> makeStyleWidget() {
    List<Widget> results = [];

    for (var i = 0; i < selectVideoStyleModel.length; i++) {
      bool isSelected = selectVideoStyleModel[i].isSelected;

      results.add(Padding(
        padding:
            i == 0 ? EdgeInsets.only(left: 25.w) : EdgeInsets.only(left: 15.w),
        child: GestureDetector(
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
                height: 100.h,
                width: 90.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(
                    color: isSelected ? mainColor : Colors.transparent,
                    width: 1.5.w,
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.r),
                  child: Image.asset(
                    selectVideoStyleModel[i].image,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(
                height: 10.h,
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
        ),
      ));
    }
    return results;
  }
}
