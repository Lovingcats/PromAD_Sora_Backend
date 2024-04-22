import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promad_sora/common/common.dart';
import 'package:promad_sora/model/videostyle_model.dart';
import 'package:promad_sora/provider/style_provider.dart';
import 'package:provider/provider.dart';

class SelectVideoStyleSlider extends StatefulWidget {
  const SelectVideoStyleSlider({super.key});

  @override
  State<SelectVideoStyleSlider> createState() => _SelectVideoStyleSliderState();
}

class _SelectVideoStyleSliderState extends State<SelectVideoStyleSlider> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      List<String> styleName = [
        "3d Anime",
        "2d Anime",
        "Beautiful",
        "Comic Book",
        "Cute",
        "Fantasy",
        "Fashion",
        "illustration",
        "Makoto Shinkai",
        "Minecraft",
        "Neon",
        "Painting",
        "Pixel Art",
        "Pretty",
        "Sketch",
      ];

      List<String> imageName = [
        "2dAnime",
        "3dAnime",
        "beautiful",
        "comicbook",
        "cute",
        "fantasy",
        "fashion",
        "illustration",
        "makotoShinkai",
        "mincraft",
        "neon",
        "painting",
        "pixcelArt",
        "pretty"
        "sketch",
      ];
      var styleProvider = Provider.of<StyleProvider>(context, listen: false);
      for (int i = 0; i < 8; i++) {
        styleProvider.addList(
            styleName[i], "assets/img/${imageName[i]}.png", i == 0 ? true : false);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var styleProvider = Provider.of<StyleProvider>(context);
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: makeStyleWidget(styleProvider),
      ),
    );
  }

  List<Widget> makeStyleWidget(StyleProvider styleProvider) {
    var selectVideoStyleModel = styleProvider.selectVideoStyleModel;
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
