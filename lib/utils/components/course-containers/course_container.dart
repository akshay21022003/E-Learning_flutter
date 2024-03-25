import 'package:e_learning/model/course_model.dart';
import 'package:flutter/material.dart';

import '../../../ui/detailpage/details_screen.dart';
import '../../styles.dart';
Widget courseContainer({
  required String thumbnail,
  required String title,
  required String description,
  required String price,
  required String oldPrice,
  required CourseModel courseModel,
  required BuildContext context
}) {
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailsScreen(courseModel:courseModel)));
    },
    child: Padding(
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
                        color: primaryColor,
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
    ),
  );
}