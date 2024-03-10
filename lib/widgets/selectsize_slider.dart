import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promad_sora/common/common.dart';
import 'package:promad_sora/model/videosize_model.dart';

class SelectVideoSizeSlider extends StatefulWidget {
  const SelectVideoSizeSlider({super.key});

  @override
  State<SelectVideoSizeSlider> createState() => _SelectVideoSizeSliderState();
}

class _SelectVideoSizeSliderState extends State<SelectVideoSizeSlider> {
  List<SelectVideoSizeModel> selectVideoSizeModel = <SelectVideoSizeModel>[];

  List<Map> videosize = [
    {1.0: 0.5625},
    {1.0: 1.0},
    {0.5625: 1.0},
  ];
  @override
  void initState() {
    List<String> sizeName = [
      "16:9",
      "1:1",
      "9:16",
    ];

    for (int i = 0; i < sizeName.length; i++) {
      selectVideoSizeModel
          .add(SelectVideoSizeModel(sizeName[i], i == 0 ? true : false));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: makeVideoSizeWidget(),
    );
  }

  List<Widget> makeVideoSizeWidget() {
    List<Widget> results = [];

    for (var i = 0; i < selectVideoSizeModel.length; i++) {
      bool isSelected = selectVideoSizeModel[i].isSelected;

      results.add(GestureDetector(
          onTap: () {
            for (int j = 0; j < selectVideoSizeModel.length; j++) {
              if (i == j) {
                setState(() {
                  selectVideoSizeModel[j].isSelected = true;
                });
              } else {
                setState(() {
                  selectVideoSizeModel[j].isSelected = false;
                });
              }
            }
          },
          child: Container(
            width: 95.w,
            height: 45.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.r),
                color: backSubColor2,
                border: Border.all(
                    color: isSelected ? mainColor : Colors.transparent)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..scale(videosize[i].keys.first, videosize[i].values.first),
                  child: Icon(CupertinoIcons.square,
                      size: 19.h,
                      color: isSelected ? Colors.white : backSubColor1),
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  selectVideoSizeModel[i].size,
                  style: TextStyle(
                      fontSize: 16.sp,
                      color: isSelected ? Colors.white : backSubColor1,
                      fontFamily: "Nexa_Regular"),
                )
              ],
            ),
          )));
    }
    return results;
  }
}
