import 'package:bloc/bloc.dart';
import 'package:e_learning/bloc/course/course_event.dart';
import 'package:e_learning/bloc/course/course_state.dart';
import 'package:e_learning/repository/course/course_repository.dart';

class CourseBloc extends Bloc<CourseEvent,CourseState>{
  CourseRepository courseRepository = CourseRepository();
  CourseBloc(this.courseRepository):super(const CourseState()){
    on<FetchedCourse>(fetchCourse);
    on<FetchedCart>(fetchCart);
    on<FetchedWishlist>(fetchWishlist);
    on<AddedToCart>(addToCart);
    on<AddedToWishlist>(addToWishlist);
    on<DeletedFromCart>(deleteFromCart);
    on<DeletedFromWishlist>(deleteFromWishlist);
  }
  void fetchCourse(FetchedCourse event,Emitter<CourseState> emit)async{
    emit(state.copyWith(courseStatus: CourseStatus.loading));
    final courseList = await courseRepository.fetchCoursesApi();
    emit(state.copyWith(courseList: courseList,courseStatus: CourseStatus.success,message: ''));
  }

  void fetchCart(FetchedCart event,Emitter<CourseState> emit)async{
    emit(state.copyWith(courseStatus: CourseStatus.loading));
    final courseList = await courseRepository.fetchCartApi();
    emit(state.copyWith(courseList: courseList,courseStatus: CourseStatus.success,message: ''));
  }
  void fetchWishlist(FetchedWishlist event,Emitter<CourseState> emit)async{
    emit(state.copyWith(courseStatus: CourseStatus.loading));
    final courseList = await courseRepository.fetchWishlistApi();
    emit(state.copyWith(courseList: courseList,courseStatus: CourseStatus.success,message: ''));
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

  void deleteFromCart(DeletedFromCart event,Emitter<CourseState> emit)async {
    emit(state.copyWith(courseStatus: CourseStatus.loading));
    bool isDeleted = await courseRepository.deleteCartItem(event.courseId);
    if(isDeleted){
      final courseList = await courseRepository.fetchCartApi();
      emit(state.copyWith(courseList: courseList,courseStatus: CourseStatus.success,message: "course removed from cart"));
    }else{
      emit(state.copyWith(courseStatus: CourseStatus.initial));
    }
  }
  void deleteFromWishlist(DeletedFromWishlist event , Emitter<CourseState> emit)async{
    emit(state.copyWith(courseStatus: CourseStatus.loading));
    bool isDeleted = await courseRepository.deleteWishlistItem(event.courseId);
    if(isDeleted){
      final courseList = await courseRepository.fetchWishlistApi();
      emit(state.copyWith(courseList: courseList,courseStatus: CourseStatus.success,message: "course removed from wishlist"));
    }else{
      emit(state.copyWith(courseStatus: CourseStatus.initial));
    }
  }
}