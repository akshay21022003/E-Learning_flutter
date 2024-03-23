import 'package:e_learning/utils/styles.dart';
import 'package:flutter/material.dart';

class MySliverAppBar extends StatelessWidget {
  final Widget child;
  final Widget title;
  const MySliverAppBar({
    super.key,
    required this.child,
    required this.title
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300,
      collapsedHeight: 100,
      floating: false,
      pinned: true,
      centerTitle: true,
      backgroundColor: Theme.of(context).colorScheme.background,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Akshay',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
          Text('Academy',style: TextStyle(color: primaryColor),),
          SizedBox(width: 35,)
        ],
      ),
      leading: Icon(Icons.school,color: Theme.of(context).colorScheme.inversePrimary),
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: child,
        ),
        title: title,
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0,right: 0,top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
