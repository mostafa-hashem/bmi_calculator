import 'package:bmi_calculate/models/result_data.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  static const String routName = 'resultScreen';

  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final resultData = ModalRoute.of(context)?.settings.arguments as ResultData;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff0A0C23),
          iconTheme: const IconThemeData(color: Colors.white),
        ),
        backgroundColor: const Color(0xff0A0C23),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                resultData.gender,
                style: const TextStyle(color: Colors.white, fontSize: 38),
              ),
              Text(
                '${resultData.result.toInt()}',
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
