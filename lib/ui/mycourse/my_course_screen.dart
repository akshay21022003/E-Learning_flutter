import 'package:flutter/material.dart';

import '../../utils/styles.dart';

class MyCourseScreen extends StatelessWidget {
  const MyCourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.school,color: Theme.of(context).colorScheme.inversePrimary),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Akshay',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
            Text('Academy',style: TextStyle(color: primaryColor),),
            SizedBox(width: 35,)
          ],
        ),
      ),
      body: Center(
        child: Text('My Course'),
      ),
    );
  }
}
