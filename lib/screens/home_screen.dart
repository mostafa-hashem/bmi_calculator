import 'package:bmi_calculate/models/result_data.dart';
import 'package:bmi_calculate/screens/result_screen.dart';
import 'package:bmi_calculate/widgets/data_widget.dart';
import 'package:bmi_calculate/widgets/gander_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double sliderCount = 120;
  bool isMale = true;
  int weightCount = 50;
  int ageCount = 18;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xff0A0C23),
        appBar: AppBar(
          backgroundColor: const Color(0xff0A0C23),
          centerTitle: true,
          title: Text(
            'BMI CALCULATOR',
            style: GoogleFonts.alexandria().copyWith(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          isMale = true;
                        },
                        child: GenderWidget(
                          widgetColor: isMale
                              ? const Color(0xffCC1A56)
                              : const Color(0xff1A1B2D),
                          genderIcon: Icons.male_outlined,
                          gender: 'Male',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {});
                          isMale = false;
                        },
                        child: GenderWidget(
                          widgetColor: isMale
                              ? const Color(0xff1A1B2D)
                              : const Color(0xffCC1A56),
                          genderIcon: Icons.female_outlined,
                          gender: 'Female',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: const Color(0xff1A1B2D),
                        borderRadius: BorderRadius.circular(18)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          'Height',
                          style: TextStyle(color: Colors.white, fontSize: 34),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${sliderCount.toInt()}',
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 26),
                            ),
                            const Text(
                              'cm',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        Slider(
                          min: 60,
                          max: 210,
                          value: sliderCount,
                          onChanged: (value) {
                            setState(() {
                              sliderCount = value;
                            });
                          },
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 28,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Flexible(
                          child: DataWidget(
                        increment: weightIncrement,
                        decrement: weightDecrement,
                        label: 'Weight',
                        count: weightCount,
                      )),
                      const SizedBox(
                        width: 20,
                      ),
                      Flexible(
                          child: DataWidget(
                        increment: ageIncrement,
                        decrement: ageDecrement,
                        label: 'Age',
                        count: ageCount,
                      )),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                ],
              ),
            ),
            Flexible(
              child: GestureDetector(
                onTap: () {
                  final double result = calculateResult();
                  Navigator.pushNamed(context, ResultScreen.routName,
                      arguments: ResultData(
                          gender: isMale ? 'Male' : "Female", result: result));
                },
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(color: Color(0xffCC1A56)),
                  child: const Center(
                      child: Text(
                    'Calculate Your BMI',
                    style: TextStyle(color: Colors.white, fontSize: 28),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void weightIncrement() {
    setState(() {
      weightCount++;
    });
  }

  void weightDecrement() {
    setState(() {
      weightCount--;
    });
  }

  void ageIncrement() {
    setState(() {
      ageCount++;
    });
  }

  void ageDecrement() {
    setState(() {
      ageCount--;
    });
  }

  double calculateResult() {
    return weightCount / ((sliderCount / 100) * 2);
  }
}
