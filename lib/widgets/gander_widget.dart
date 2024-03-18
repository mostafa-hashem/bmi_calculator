import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GenderWidget extends StatelessWidget {
  final IconData genderIcon;
  final String gender;
  final Color widgetColor;

  const GenderWidget(
      {super.key,
      required this.genderIcon,
      required this.gender,
      required this.widgetColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 180,
      decoration: BoxDecoration(
          color: widgetColor, borderRadius: BorderRadius.circular(18)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Icon(
            genderIcon,
            color: Colors.white,
            size: 62,
          ),
          Text(
            gender,
            style: GoogleFonts.alexandria()
                .copyWith(color: Colors.white, fontSize: 32),
          )
        ],
      ),
    );
  }
}
