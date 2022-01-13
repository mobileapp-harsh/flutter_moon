import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_moon/common_constants/Color_CommonConstants.dart';
import 'package:flutter_moon/config/app_routes.dart';
import 'package:flutter_moon/modules/home_screen/widget/Result_Dialogue.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late RxBool isMale = false.obs;
  late RxInt weight = 0.obs;
  late RxInt age = 18.obs;
  late RxDouble height = 170.0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: const Text(
            "Flutter Moon BMI APP",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: ColorCommonConstants.DARKBLUEGREYCOLOR,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Row(
                  children: [
                    MaleFemaleWidget('Male'),
                    const SizedBox(
                      width: 8.0,
                    ),
                    MaleFemaleWidget('Female'),
                  ],
                ),
              ),
              Expanded(
                child: Card(
                  color: ColorCommonConstants.BLUEGREYCOLOR,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Height",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                        Obx(
                          () => RichText(
                            text: TextSpan(
                              text: "${height.toStringAsFixed(1)}",
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 36.0,
                                  fontWeight: FontWeight.bold),
                              children: const [
                                TextSpan(
                                  text: "CM",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Obx(
                          () => Slider(
                            activeColor: Colors.white,
                            inactiveColor:
                                ColorCommonConstants.LIGHTBLUEGREYCOLOR,
                            min: 90,
                            max: 220,
                            value: height.value,
                            onChanged: (value) {
                              height.value = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    HeightWeightWidget('Weight'),
                    const SizedBox(
                      width: 8.0,
                    ),
                    HeightWeightWidget('Age'),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  var result = weight.value / pow(height.value / 100, 2);
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return ResultDialogue(
                        age: age.value,
                        isMale: isMale.value,
                        result: result,
                      );
                    },
                  );
                },
                child: const Text(
                  "Calculate",
                  style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.5),
                ),
                style: ElevatedButton.styleFrom(
                    primary: ColorCommonConstants.LIGHTBLUEGREYCOLOR),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget MaleFemaleWidget(String type) {
    return Expanded(
        child: Obx(
      () => Card(
          color: (isMale.value && type == "Male") ||
                  (!isMale.value && type == "Female")
              ? ColorCommonConstants.BLUEGREYCOLOR
              : ColorCommonConstants.LIGHTBLUEGREYCOLOR,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
          child: GestureDetector(
            onTap: () {
              isMale.value = (type == 'Male') ? true : false;
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    type == 'Male' ? Icons.male : Icons.female,
                    size: 75.0,
                    color: Colors.white,
                  ),
                  const SizedBox(
                    height: 15.0,
                  ),
                  Text(
                    type == "Male" ? "Male" : "Female",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          )),
    ));
  }

  Widget HeightWeightWidget(String type) {
    return Expanded(
      child: Card(
        color: ColorCommonConstants.LIGHTBLUEGREYCOLOR,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6.0)),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                type == "Weight" ? "Weight" : "Age",
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Obx(
                () => Text(
                  type == "Weight" ? "$weight" : "$age",
                  style: const TextStyle(
                      letterSpacing: 3,
                      color: Colors.white,
                      fontSize: 45.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 4.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      type == "Weight"
                          ? weight.value == 0
                              ? weight.value
                              : weight.value--
                          : age.value == 18
                              ? age.value
                              : age.value--;
                    },
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      color: ColorCommonConstants.BLUEGREYCOLOR,
                      child: Container(
                        height: 35.0,
                        width: 35.0,
                        alignment: Alignment.center,
                        child: const Icon(
                          Icons.remove,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  InkWell(
                    onTap: () {
                      type == "Weight" ? weight.value++ : age.value++;
                    },
                    child: Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0)),
                      color: ColorCommonConstants.BLUEGREYCOLOR,
                      child: Container(
                        height: 35.0,
                        width: 35.0,
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
