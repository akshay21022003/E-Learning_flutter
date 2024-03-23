// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CourseModelImpl _$$CourseModelImplFromJson(Map<String, dynamic> json) =>
    _$CourseModelImpl(
      id: json['_id'] as String?,
      title: json['title'] as String,
      description: json['description'] as String,
      thumbnail: json['thumbnail'] as String? ??
          "https://www.srishticampus.com/packageImages/MERN-Stack-considered-the-Best-for-Developing-Web-Apps.png",
      category:
          $enumDecodeNullable(_$CourseCategoryEnumMap, json['category']) ??
              CourseCategory.photographyAndVideo,
      price: json['price'] as int,
      oldPrice: json['oldPrice'] as int,
      sections: (json['sections'] as List<dynamic>)
          .map((e) => SectionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CourseModelImplToJson(_$CourseModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'thumbnail': instance.thumbnail,
      'category': _$CourseCategoryEnumMap[instance.category]!,
      'price': instance.price,
      'oldPrice': instance.oldPrice,
      'sections': instance.sections,
    };

const _$CourseCategoryEnumMap = {
  CourseCategory.photographyAndVideo: 'photographyAndVideo',
  CourseCategory.design: 'design',
  CourseCategory.itAndSoftware: 'itAndSoftware',
  CourseCategory.business: 'business',
  CourseCategory.marketing: 'marketing',
};

_$SectionModelImpl _$$SectionModelImplFromJson(Map<String, dynamic> json) =>
    _$SectionModelImpl(
      id: json['_id'] as String?,
      title: json['title'] as String,
      videos: (json['videos'] as List<dynamic>)
          .map((e) => VideoModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SectionModelImplToJson(_$SectionModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'videos': instance.videos,
    };

_$VideoModelImpl _$$VideoModelImplFromJson(Map<String, dynamic> json) =>
    _$VideoModelImpl(
      id: json['_id'] as String?,
      title: json['title'] as String,
      url: json['url'] as String,
    );

Map<String, dynamic> _$$VideoModelImplToJson(_$VideoModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'url': instance.url,
    };
