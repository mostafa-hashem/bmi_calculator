import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget {
  final String label;
  final int count;
  final void Function() increment;
  final void Function() decrement;

  const DataWidget({super.key, required this.label, required this.count, required this.increment, required this.decrement});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
          color: const Color(0xff1A1B2D),
          borderRadius: BorderRadius.circular(18)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.5),
              fontSize: 32,
            ),
          ),
          Text(
            '$count',
            style: const TextStyle(color: Colors.white, fontSize: 32),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: increment,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: const Color(0xff0A0C23),
                      borderRadius: BorderRadius.circular(40)),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
              InkWell(
                onTap: decrement,
                child: Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: const Color(0xff0A0C23),
                      borderRadius: BorderRadius.circular(40)),
                  child: const Icon(
                    Icons.remove,
                    color: Colors.white,
                    size: 28,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
