import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) => _buildItemList(index),
        ),
      ),
    );
  }

  Widget _buildItemList(int index) {
    return Slidable(
      key: const ValueKey(0),
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        dismissible: DismissiblePane(
          onDismissed: () {},
        ),
        children: const [
          SlidableAction(
            onPressed: doNothing,
            backgroundColor: Color(0xFF7BC043),
            foregroundColor: Colors.white,
            icon: Icons.archive,
          ),
        ],
      ),
      child: Container(
        width: double.infinity,
        // padding: const EdgeInsets.all(16),
        height: 80,
        color: Colors.lightBlueAccent,
        child: Text('Slide me $index'),
      ),
    );
  }
}

void doNothing(BuildContext context) {}
