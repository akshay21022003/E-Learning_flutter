import 'package:e_learning/bloc/course/course_event.dart';
import 'package:e_learning/bloc/course/course_state.dart';
import 'package:e_learning/model/course_model.dart';
import 'package:e_learning/utils/components/greeting.dart';
import 'package:e_learning/utils/components/search_bar.dart';
import 'package:e_learning/utils/components/sliver_app_bar.dart';
import 'package:e_learning/utils/components/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/course/course_bloc.dart';
import '../../utils/components/course-containers/course_container.dart';

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
            return courseContainer(
              courseModel: filteredCourses[index],
                title: filteredCourses[index].title,
                description: filteredCourses[index].description,
                thumbnail: filteredCourses[index].thumbnail,
                price: filteredCourses[index].price.toString(),
              oldPrice: filteredCourses[index].oldPrice.toString(),
              context: context
            );
          }
      );
    }).toList();
  }


}
