import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({Key? key, required this.tabController}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Theme(
        data: Theme.of(context).copyWith(
          tabBarTheme: Theme.of(context).tabBarTheme.copyWith(
            labelColor: Theme.of(context).colorScheme.inversePrimary,
            unselectedLabelColor: Theme.of(context).colorScheme.primary,

          ),
        ),
        child: TabBar(
          controller: tabController,
          indicatorColor: Theme.of(context).colorScheme.inversePrimary,
          isScrollable: true,
          physics: BouncingScrollPhysics(),
          tabs: [
            Tab(
                text: 'all'
            ),
            Tab(
              text: 'software'
            ),
            Tab(
              text: 'design'
            ),
            Tab(
              text: 'business',
            ),
            Tab(
              text: 'marketing',
            ),
            Tab(
              text: 'photography',
            ),
          ],
        ),
      ),
    );
  }
}
