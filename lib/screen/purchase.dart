import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:promad_sora/common/common.dart';
import 'package:promad_sora/common/secretkey.dart';
import 'package:promad_sora/routes/page_route.dart';
import 'package:http/http.dart' as http;

class PurChase extends StatefulWidget {
  const PurChase({super.key});

  @override
  State<PurChase> createState() => _PurChaseState();
}

class _PurChaseState extends State<PurChase> {
  final List<String> payItems = ['5', '10', '30', '50', '100', '300'];

  final List<String> prices = ['0.00', '5', '11', '33', '570', '1170', '350'];

  String? selectedValue;

  int selectIndex = 0;

  //amount는 돈의 양, currency는 화폐종류 ex) USD, KRW
  dynamic createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': amount,
        'currency': currency,
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer $stripeSecretKey',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      return jsonDecode(response.body);
    } catch (err) {
      if (kDebugMode) {
        print("1 : 에러가 발생했습니다!");
        print(err);
      }
    }
  }

  //client_secret을 불러오고 화면에 stripe결제 실행
  Future<void> makePayment(BuildContext context, String amount) async {
    try {
      var paymentIntentData = await createPaymentIntent(amount, "USD");

      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntentData['client_secret'],
                  style: ThemeMode.light,
                  customFlow: false,
                  merchantDisplayName: 'test App'))
          .then((value) => displayPaymentSheet(context));
    } catch (err) {
      if (kDebugMode) {
        print("2 : 에러가 발생했습니다!");
        print(err);
      }
    }
  }

  //결제 성공시 snackbar 실행
  void displayPaymentSheet(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("결제가 성공적으로 진행되셨습니다!")));
      }).onError((error, stackTrace) {
        throw Exception(error);
      });
    } on StripeException catch (e) {
      if (kDebugMode) {
        print('결제 오류 : $e');
      }
    }
  }

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
                      onTap: () {
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
                      "Purchase",
                      style: TextStyle(
                          fontSize: 21.sp,
                          color: Colors.white,
                          fontFamily: "Nexa_Bold"),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.h, bottom: 10.h),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedValue == null
                                ? "Buy Your Credits!"
                                : "Buy $selectedValue Credits",
                            style: TextStyle(
                                fontSize: 21.sp,
                                color: Colors.white,
                                fontFamily: "Nexa_Bold"),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5.h, bottom: 20.h),
                            child: Text(
                              "Pay for Credit and enjoy more content!",
                              style: TextStyle(
                                  fontSize: 15.sp,
                                  color: Colors.white,
                                  fontFamily: "Nexa_Light"),
                            ),
                          ),
                          Text(
                            "Select number of clicks",
                            style: TextStyle(
                                fontSize: 17.sp,
                                color: Colors.white,
                                fontFamily: "Nexa_Regular"),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  width: double.infinity.w,
                  margin: EdgeInsets.only(top: 5.h, bottom: 25.h),
                  child: DropdownButtonFormField2<String>(
                    style: TextStyle(fontSize: 20.sp),
                    isExpanded: true,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                    ),
                    hint: Text(
                      'Select Credits',
                      style: TextStyle(fontSize: 15.sp, color: backSubColor1),
                    ),
                    items: payItems
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                "$item credits",
                                style: TextStyle(
                                    fontSize: 14.sp,
                                    color: selectedValue == item
                                        ? const Color.fromARGB(
                                            255, 192, 185, 185)
                                        : Colors.black),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please select gender.';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value;
                        selectIndex = payItems.indexOf("$selectedValue") + 1;
                      });
                    },
                    onSaved: (value) {
                      selectedValue = value.toString();
                    },
                    buttonStyleData: ButtonStyleData(
                      padding: EdgeInsets.only(right: 8.w),
                    ),
                    iconStyleData: IconStyleData(
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: backSubColor1,
                      ),
                      iconSize: 24.h,
                    ),
                    dropdownStyleData: DropdownStyleData(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 143, 133, 133),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                    ),
                    menuItemStyleData: const MenuItemStyleData(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Price: \$${prices[selectIndex]}",
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.h),
                  child: GestureDetector(
                    onTap: () {
                      makePayment(context, prices[selectIndex]);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45.h,
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
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        "Pay \$${prices[selectIndex]}.00",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: const Color.fromARGB(255, 70, 70, 70),
                            fontWeight: FontWeight.w500),
                      ),
                    ),
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
