import 'package:equatable/equatable.dart';

import 'package:techjar/models/comments.dart';
import 'package:techjar/models/post.dart';

class MyState extends Equatable {
  const MyState();

  @override
  List<Object> get props => [];
}

class PostInitial extends MyState {}

class PostLoadingProgress extends MyState {}

class PostLoadedSuccess extends MyState {
 final  List<Post> posts;
  const PostLoadedSuccess(this.posts);
  @override
  List<Object> get props => [posts];
}

class  CommentLoadSucces extends MyState{

  final  List<Comment> comments;
  
  const CommentLoadSucces( this.comments);
  @override
  List<Object> get props => [comments];
}

class PostError extends MyState {
  final String message;
  const PostError(this.message);
}