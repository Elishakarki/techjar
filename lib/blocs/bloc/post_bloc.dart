// import 'package:bloc/bloc.dart';
// import 'package:techjar/repositories/post_repository.dart';
// import 'post_event.dart';
// import 'post_state.dart';

// class PostBloc extends Bloc<PostEvent, MyState> {
//   final PostRepository postRepository;

//   PostBloc(this.postRepository) : super(PostInitial()) {
//     on<LoadPosts>(_onLoadPosts);
//     on<LoadComments>(_onLoadComments);
//     on<AddComments>(_onAddComments);
//   }

//   Future<void> _onLoadPosts(LoadPosts event, Emitter<MyState> emit) async {
//     emit(PostLoadingProgress());
//     try {
//       final posts = await postRepository.fetchPosts();
//       emit(PostLoadedSuccess(posts));
//     } catch (error) {
//       emit(PostError(error.toString()));
//     }
//   }

//   Future<void> _onLoadComments(LoadComments event, Emitter<MyState> emit) async {
//     emit(PostLoadingProgress());
//     try {
//       final comments = await postRepository.fetchComments(event.postId);
//       emit(CommentLoadSucces(comments));
//     } catch (error) {
//       emit(PostError(error.toString()));
//     }
//   }

//   Future<void> _onAddComments(AddComments event, Emitter<MyState> emit) async {
//     emit(PostLoadingProgress());
//     try {
//       await postRepository.addComment(event.postId, event.comment);
//       final comments = await postRepository.fetchComments(event.postId);
//       emit(CommentLoadSucces(comments));
//     } catch (error) {
//       emit(PostError(error.toString()));
//     }
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:techjar/repositories/post_repository.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, MyState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostInitial()) {
    on<LoadPosts>(_onLoadPosts);
    on<LoadComments>(_onLoadComments);
    on<AddComments>(_onAddComments);
  }

  Future<void> _onLoadPosts(LoadPosts event, Emitter<MyState> emit) async {
    emit(PostLoadingProgress());
    try {
      final posts = await postRepository.fetchPosts();
      emit(PostLoadedSuccess(posts));
    } catch (error) {
      emit(PostError(error.toString()));
    }
  }

  Future<void> _onLoadComments(LoadComments event, Emitter<MyState> emit) async {
    emit(PostLoadingProgress());
    try {
      final comments = await postRepository.fetchComments(event.postId);
      emit(CommentLoadSucces(comments));
    } catch (error) {
      emit(PostError(error.toString()));
    }
  }

  Future<void> _onAddComments(AddComments event, Emitter<MyState> emit) async {
    try {
      await postRepository.addComment(event.postId, event.comment);
      final comments = await postRepository.fetchComments(event.postId);
      emit(CommentLoadSucces(comments));
    } catch (error) {
      emit(PostError(error.toString()));
    }
  }
}
