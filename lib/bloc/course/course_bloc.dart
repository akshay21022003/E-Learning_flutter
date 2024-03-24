import 'package:bloc/bloc.dart';
import 'package:e_learning/bloc/course/course_event.dart';
import 'package:e_learning/bloc/course/course_state.dart';
import 'package:e_learning/repository/course/course_repository.dart';

class CourseBloc extends Bloc<CourseEvent,CourseState>{
  CourseRepository courseRepository = CourseRepository();
  CourseBloc(this.courseRepository):super(const CourseState()){
    on<FetchedCourse>(fetchCourse);
    on<AddedToCart>(addToCart);
    on<AddedToWishlist>(addToWishlist);
  }
  void fetchCourse(FetchedCourse event,Emitter<CourseState> emit)async{
    emit(state.copyWith(courseStatus: CourseStatus.loading));
    await Future.delayed(const Duration(seconds: 2));
    final list = courseRepository.courses;
    emit(state.copyWith(courseList: list,courseStatus: CourseStatus.success));
  }

  void addToCart(AddedToCart event,Emitter<CourseState> emit)async{
    var data = await courseRepository.addToCartApi(event.userId, event.courseId);
    if(data.containsKey("message")){
      emit(state.copyWith(courseStatus: CourseStatus.success,message: data["message"]));
    }else{
      emit(state.copyWith(courseStatus: CourseStatus.failure,message:data["errorMessage"]));
      emit(state.copyWith(courseStatus: CourseStatus.initial));
    }
  }

  void addToWishlist(AddedToWishlist event , Emitter<CourseState> emit)async{
    var data = await courseRepository.addToWishlistApi(event.userId, event.courseId);
    if(data.containsKey("message")){
      emit(state.copyWith(courseStatus: CourseStatus.success,message: data["message"]));
    }else{
      emit(state.copyWith(courseStatus: CourseStatus.failure,message:data["errorMessage"]));
      emit(state.copyWith(courseStatus: CourseStatus.initial));
    }
  }
}