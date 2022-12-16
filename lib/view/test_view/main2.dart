import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slidable Example',
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 1200),
              curve: Curves.easeInOut,
              tween: Tween<double>(
                begin: 0,
                end: 0.7,
              ),
              builder: (context, value, _) => Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(26),
                      border: Border.all(
                        color: Colors.grey,
                        width: 5,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: value,
                        color: Colors.green,
                        backgroundColor: Colors.black,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 25,
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(26),
                          topRight: Radius.circular(26),
                        ),
                        color: Colors.white.withOpacity(0.2)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
