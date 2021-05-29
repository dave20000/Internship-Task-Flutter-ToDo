// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task(
    id: json['id'] as int,
    title: json['title'] as String,
    details: json['details'] as String,
    taskDate: json['taskDate'] == null
        ? null
        : DateTime.parse(json['taskDate'] as String),
    endDate: json['endDate'] == null
        ? null
        : DateTime.parse(json['endDate'] as String),
    category: json['category'] as String,
  );
}

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'details': instance.details,
      'taskDate': instance.taskDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'category': instance.category,
    };
