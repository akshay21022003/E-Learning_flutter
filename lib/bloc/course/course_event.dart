
import 'package:equatable/equatable.dart';

abstract class CourseEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class FetchedCourse extends CourseEvent{}

class AddedToCart extends CourseEvent{
  final String courseId;
  final String userId;

  AddedToCart({
    required this.userId,
    required this.courseId
});

  @override
  List<Object> get props => [userId,courseId];
}

class AddedToWishlist extends CourseEvent{
  final String courseId;
  final String userId;

  AddedToWishlist({
    required this.userId,
    required this.courseId
  });

  @override
  List<Object> get props => [userId,courseId];
}
