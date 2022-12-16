import 'package:flutter/material.dart';

class CustomProgressBar extends StatelessWidget {
  final double max;
  final double current;
  final Color color;

  const CustomProgressBar(
      {Key? key,
      required this.max,
      required this.current,
      this.color = Colors.green})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, boxConstraints) {
        var x = boxConstraints.maxWidth;
        var percent = (current / max) * x;
        return Stack(
          children: [
            Container(
              width: x,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(35),
                  border: Border.all(color: Colors.grey, width: 5)),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 1500),
                width: percent,
                height: 50,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(35),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
