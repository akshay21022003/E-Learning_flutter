import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:e_learning/bloc/course/course_bloc.dart';
import 'package:e_learning/bloc/course/course_event.dart';
import 'package:e_learning/bloc/course/course_state.dart';
import 'package:e_learning/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/course_model.dart';

class DetailsScreen extends StatelessWidget {
  final CourseModel courseModel;
  const DetailsScreen({super.key,required this.courseModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        backgroundColor: Theme.of(context).colorScheme.secondary,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 12, bottom: 12),
                  child: Container(
                    height: 200,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(courseModel.thumbnail))),
                  ),
                ),
                Text(
                  courseModel.title,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontSize: 19),
                ),
                verticalSpaceSmall,
                Text(
                  'Build fullstack React.js applications with Node.js, Express.js & MongoDB (MERN) with this project-focused course.',
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary, fontSize: 13),
                ),
                verticalSpaceMedium,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹${courseModel.price}',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold,
                          fontSize: 23),
                    ),
                    const Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star_border_rounded,
                          color: Colors.yellow,
                        )
                      ],
                    )
                  ],
                ),
                verticalSpaceMedium,
                Container(
                  height: 50,
                  color: primaryColor,
                  child: Center(
                    child: Text('Buy now',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,fontSize: 19,fontWeight: FontWeight.bold),),
                  ),
                ),
                verticalSpaceMedium,
                BlocListener<CourseBloc,CourseState>(
                  listener:(context,state){
                    if(state.courseStatus == CourseStatus.success){
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
                    if(state.courseStatus == CourseStatus.failure){
                      final snackBar = SnackBar(
                        elevation: 0,
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: Colors.transparent,
                        content: AwesomeSnackbarContent(
                          title: 'Cart',
                          message: state.message,
                          contentType: ContentType.failure,
                        ),
                      );

                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                    }
                  },
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){
                            context.read<CourseBloc>().add(AddedToCart(userId: "65edfb88ed5c75b45e38408c", courseId: courseModel.id.toString()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1,color: Theme.of(context).colorScheme.primary)
                            ),
                            child: Center(
                              child: Text('Add To Cart',style: TextStyle(color:Theme.of(context).colorScheme.primary ),),
                            ),
                          ),
                        ),
                      ),
                      horizontalSpaceSmall,
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: (){
                            context.read<CourseBloc>().add(AddedToWishlist(userId: "65edfb88ed5c75b45e38408c", courseId: courseModel.id.toString()));
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                border: Border.all(width: 1,color: Theme.of(context).colorScheme.primary)
                            ),
                            child: Center(
                              child: Text('Add To Wishlist',style: TextStyle(color:Theme.of(context).colorScheme.primary ),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                verticalSpaceMedium,
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://img.freepik.com/free-psd/3d-illustration-human-avatar-profile_23-2150671142.jpg?w=740&t=st=1711268839~exp=1711269439~hmac=9783a0fd6cbb0aebc29bd3f9fd2b0620801b0493d39a69f58e6c4fa14178efe8',
                      ),
                      radius: 30,
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Brad Traversy',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                          ),
                        ),
                        Text(
                          'Software',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 15
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpaceMedium,
                Text('Curriculum ',style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary,fontSize: 19,fontWeight: FontWeight.bold),),
                verticalSpaceSmall,
                Container(
                  height: courseModel.sections.length * 50.0,
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: courseModel.sections.length,
                    itemBuilder: (context, index) {
                      var courseSection = courseModel.sections[index];
                      return ExpansionTile(
                        leading: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                            child: Text(
                              '${index + 1}',
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.inversePrimary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        title: Text(
                          courseSection.title,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.inversePrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 17
                          ),
                        ),
                        trailing: Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        children: [
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: courseSection.videos.length,
                            itemBuilder: (context, videoIndex) {
                              var video = courseSection.videos[videoIndex];
                              return ListTile(
                                title: Text(
                                  video.title,
                                  style: TextStyle(
                                    color: Theme.of(context).colorScheme.inversePrimary,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 13
                                  ),
                                ),
                                leading: Icon(Icons.play_arrow_outlined,color: Theme.of(context).colorScheme.primary,),
                                trailing: Text('59:30'),
                                onTap: () {
                                  // Handle onTap event for video
                                },
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),

              ],
            ),
          ),
        )
    );
  }
}
