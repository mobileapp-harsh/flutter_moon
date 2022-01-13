import 'package:flutter/material.dart';
import 'package:flutter_moon/common_constants/Color_CommonConstants.dart';
import 'package:get/get.dart';

class ResultDialogue extends StatefulWidget {
  final double result;
  final bool isMale;
  final int age;

  const ResultDialogue(
      {Key? key, required this.result, required this.isMale, required this.age})
      : super(key: key);

  @override
  ResultDialogueState createState() => ResultDialogueState();
}

class ResultDialogueState extends State<ResultDialogue> {
  String get resultPharse {
    String resultText = "";
    if (widget.result >= 30) {
      resultText = "Obese";
    } else if (widget.result > 25 && widget.result < 30) {
      resultText = "Overweight";
    } else if (widget.result >= 18.0 && widget.result <= 24.9) {
      resultText = "Normal";
    } else {
      resultText = "Thin";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              color: ColorCommonConstants.LIGHTBLUEGREYCOLOR,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: const Text(
                "Result",
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0),
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Gender",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: ColorCommonConstants.DARKBLUEGREYCOLOR),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          "Result",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: ColorCommonConstants.DARKBLUEGREYCOLOR),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          "Helthiness",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: ColorCommonConstants.DARKBLUEGREYCOLOR),
                        ),
                        SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          "Age",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: ColorCommonConstants.DARKBLUEGREYCOLOR),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ":\t\t\t ${widget.isMale ? "Male" : "Female"}",
                          style: const TextStyle(
                              fontSize: 18.0,
                              color: ColorCommonConstants.DARKBLUEGREYCOLOR),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          ":\t\t\t ${widget.result.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 18.0,
                              color: ColorCommonConstants.DARKBLUEGREYCOLOR),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          ":\t\t\t $resultPharse",
                          style: const TextStyle(
                              fontSize: 18.0,
                              color: ColorCommonConstants.DARKBLUEGREYCOLOR),
                        ),
                        const SizedBox(
                          height: 6.0,
                        ),
                        Text(
                          ":\t\t\t ${widget.age}",
                          style: const TextStyle(
                              fontSize: 18.0,
                              color: ColorCommonConstants.DARKBLUEGREYCOLOR),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ElevatedButton.styleFrom(
                  primary: ColorCommonConstants.LIGHTBLUEGREYCOLOR
                ),
                child: const Text("Back",style: TextStyle(fontSize: 18.0),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
