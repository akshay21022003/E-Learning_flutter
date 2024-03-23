import 'package:e_learning/bloc/course/course_event.dart';
import 'package:e_learning/bloc/course/course_state.dart';
import 'package:e_learning/model/course_model.dart';
import 'package:e_learning/utils/components/greeting.dart';
import 'package:e_learning/utils/components/search_bar.dart';
import 'package:e_learning/utils/components/sliver_app_bar.dart';
import 'package:e_learning/utils/components/tab_bar.dart';
import 'package:e_learning/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/course/course_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: CourseCategory.values.length, vsync: this);
    context.read<CourseBloc>().add(FetchedCourse());
  }

  void destroy() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme
          .of(context)
          .colorScheme
          .secondary,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
          [
            MySliverAppBar(
              title: MyTabBar(tabController: _tabController),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Divider(
                    indent: 25,
                    endIndent: 25,
                    color: Theme
                        .of(context)
                        .colorScheme
                        .secondary,
                  ),
                  Greeting(),
                  MySearchBar()
                ],
              ),
            )
          ],
          body: BlocBuilder<CourseBloc, CourseState>(
              builder: (context, state) {
                if (state.courseStatus == CourseStatus.loading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return TabBarView(
                      controller: _tabController,
                      children: _getCourseInThisCategory(state.courseList)
                  );
                }
              }
          )
      ),
    );
  }

  List<CourseModel> _filterCoursesByCategory(CourseCategory courseCategory,
      List<CourseModel> courses) {
    return courses.where((course) => course.category == courseCategory)
        .toList();
  }

  List<Widget> _getCourseInThisCategory(List<CourseModel> courses) {
    return CourseCategory.values.map((category) {
      List<CourseModel> filteredCourses = _filterCoursesByCategory(
          category, courses);
      return ListView.builder(
          itemCount: filteredCourses.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            return _courseContainer(
                title: filteredCourses[index].title,
                description: filteredCourses[index].description,
                thumbnail: filteredCourses[index].thumbnail,
                price: filteredCourses[index].price.toString(),
              oldPrice: filteredCourses[index].oldPrice.toString()
            );
          }
      );
    }).toList();
  }

  Widget _courseContainer({
    required String thumbnail,
    required String title,
    required String description,
    required String price,
    required String oldPrice
  }) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(1, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                thumbnail,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 12.0),
            Text(
              title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              style: TextStyle(
                fontSize: 16.0,
                color: Theme.of(context).colorScheme.primary
              ),
            ),
            SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text(
                      '\₹$price',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).colorScheme.inversePrimary,
                      ),
                    ),
                    horizontalSpaceSmall,
                    Text(
                      '\₹$oldPrice',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.pink,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.star,color: Colors.yellow,),
                    Icon(Icons.star,color: Colors.yellow,),
                    Icon(Icons.star,color: Colors.yellow,),
                    Icon(Icons.star,color: Colors.yellow,),
                    Icon(Icons.star_border_rounded,color: Colors.yellow,)
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
