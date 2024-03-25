import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:e_learning/bloc/course/course_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/course/course_bloc.dart';
import '../../bloc/course/course_state.dart';
import '../../utils/components/course_cart_container.dart';
import '../../utils/styles.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CourseBloc>().add(FetchedCart());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CourseBloc, CourseState>(
        listener: (context, state) {
          if(state.courseStatus == CourseStatus.success){
            if(state.message != ''){
              final snackBar = SnackBar(
                elevation: 0,
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.transparent,
                content: AwesomeSnackbarContent(
                  title: 'Cart',
                  message: state.message,
                  contentType: ContentType.success,
                ),
              );

              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(snackBar);
            }
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: Icon(Icons.school,
                  color: Theme.of(context).colorScheme.inversePrimary),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Akshay',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary),
                  ),
                  Text(
                    'Academy',
                    style: TextStyle(color: primaryColor),
                  ),
                  SizedBox(
                    width: 35,
                  )
                ],
              ),
            ),
            body: state.courseStatus == CourseStatus.loading ? Center(child: CircularProgressIndicator(),):ListView.builder(
                itemCount: state.courseList.length,
                itemBuilder: (context, index) {
                  var course = state.courseList[index];
                  return courseCartContainer(
                      courseModel: course,
                      thumbnail: course.thumbnail,
                      title: course.title,
                      description: course.title,
                      price: course.price.toString(),
                      oldPrice: course.oldPrice.toString(),
                      context: context,
                      index: index,
                      dismissDirectionCallback:
                          (DismissDirection direction) {
                        context.read<CourseBloc>().add(DeletedFromCart(courseId: course.id!));
                      });
                }),
          );
        });
  }
}
