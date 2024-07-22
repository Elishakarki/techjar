
import 'package:json_annotation/json_annotation.dart';

part 'comments.g.dart';
@JsonSerializable()
class Comment {

  final int id;
  final String name;
  final String body;
  Comment({required this.id, required this.name, required this.body});
  
factory Comment.fromJson(Map<String, dynamic> json) => _$CommentFromJson(json);
    Map<String, dynamic> toJson() => _$CommentToJson(this);

}
