// CourseModel
import 'package:freezed_annotation/freezed_annotation.dart';

part 'course_model.freezed.dart';
part 'course_model.g.dart';

enum CourseCategory {
  photography,
  design,
  software,
  business,
  marketing,
}

@freezed
class CourseModel with _$CourseModel {
  const factory CourseModel({
    @JsonKey(name: '_id') String? id,
    required String title,
    required String description,
    @Default("https://www.srishticampus.com/packageImages/MERN-Stack-considered-the-Best-for-Developing-Web-Apps.png") String thumbnail,
    @Default(CourseCategory.photography) CourseCategory category,
    required int price,
    required int oldPrice,
    required List<SectionModel> sections,
  }) = _CourseModel;

  factory CourseModel.fromJson(Map<String, dynamic> json) => _$CourseModelFromJson(json);
}

// SectionModel
@freezed
class SectionModel with _$SectionModel {
  const factory SectionModel({
    @JsonKey(name: '_id') String? id,
    required String title,
    required List<VideoModel> videos,
  }) = _SectionModel;

  factory SectionModel.fromJson(Map<String, dynamic> json) => _$SectionModelFromJson(json);
}

// VideoModel
@freezed
class VideoModel with _$VideoModel {
  const factory VideoModel({
    @JsonKey(name: '_id') String? id,
    required String title,
    required String url,
  }) = _VideoModel;

  factory VideoModel.fromJson(Map<String, dynamic> json) => _$VideoModelFromJson(json);
}
