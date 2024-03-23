import 'package:equatable/equatable.dart';
import 'package:e_learning/model/course_model.dart';

enum CourseStatus { loading, success, failure, initial }

class CourseState extends Equatable {
  final CourseStatus courseStatus;
  final List<CourseModel> courseList;
  final String message;

  const CourseState({
    this.courseStatus = CourseStatus.initial,
    this.courseList = const [],
    this.message = '',
  });

  CourseState copyWith({
    CourseStatus? courseStatus,
    List<CourseModel>? courseList,
    String? message,
  }) {
    return CourseState(
      courseStatus: courseStatus ?? this.courseStatus,
      courseList: courseList ?? this.courseList,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [courseStatus, courseList, message];
}
