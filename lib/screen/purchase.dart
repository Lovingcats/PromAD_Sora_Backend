import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:promad_sora/common/common.dart';

class PurChase extends StatefulWidget {
  const PurChase({super.key});

  @override
  State<PurChase> createState() => _PurChaseState();
}

class _PurChaseState extends State<PurChase> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 25.w, right: 25.w, top: 15.h),
          child: Center(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 22.h,
                      ),
                    ),
                    SizedBox(
                      width: 90.w,
                    ),
                    Text(
                      "Purchase", style: TextStyle(
                        fontSize: 21.sp, color: Colors.white, fontFamily: "Nexa_Bold"
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 30.h, bottom: 10.h
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Buy 20 Credits", style: TextStyle(
                            fontSize: 21.sp, color: Colors.white, fontFamily: "Nexa_Bold"
                          ),),
                          SizedBox(
                            height: 5.h,
                          ),
                          Text("Pay for Credit and enjoy more content!", style: TextStyle(
                            fontSize: 15.sp, color: Colors.white, fontFamily: "Nexa_Light"
                          ),)
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}