

import 'package:equatable/equatable.dart';
import 'package:techjar/models/comments.dart';


abstract class PostEvent extends Equatable {
  const PostEvent();
  @override
  List<Object?> get props => [];
}

class LoadPosts extends PostEvent {}

class LoadComments extends PostEvent {
  final int postId;
  const LoadComments(this.postId);
}

class AddComments extends PostEvent {
  final int postId;
  final Comment comment;
  const AddComments(this.postId, this.comment);
}


