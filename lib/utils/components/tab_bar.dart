import 'package:e_learning/model/course_model.dart';
import 'package:flutter/material.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;

  const MyTabBar({Key? key, required this.tabController}) : super(key: key);

  List<Tab> _buildCategoryTabs(){
    return CourseCategory.values.map((category){
      return Tab(
        text: category.toString().split(".").last,
      );
    }).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:  TabBar(
          controller: tabController,
          indicatorColor: Theme.of(context).colorScheme.inversePrimary,
          isScrollable: true,
          physics: BouncingScrollPhysics(),
          tabs: _buildCategoryTabs()
      ),
    );
  }
}
