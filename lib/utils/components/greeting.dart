import 'package:flutter/material.dart';

class Greeting extends StatelessWidget {
  const Greeting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hi akshay",style: TextStyle(color: Theme.of(context).colorScheme.primary,fontSize: 19)),
          Row(
            children: [
              Text('Lets start learning ',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,fontWeight:FontWeight.bold,fontSize: 17)),
              Icon(Icons.waving_hand_rounded)
            ],
          )
        ],
      ),
    );
  }
}
