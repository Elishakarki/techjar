// blocs/post_bloc.dart
import 'package:bloc/bloc.dart';
import 'package:techjar/repositories/post_repository.dart';
import 'post_event.dart';
import 'post_state.dart';


class PostBloc extends Bloc<PostEvent, MyState> {
  final PostRepository postRepository;

  PostBloc(this.postRepository) : super(PostInitial());

  @override
  Stream<MyState> mapEventToState(PostEvent event) async* {
    if (event is LoadPosts) {
      yield PostLoadingProgress();
      try {
        final posts = await postRepository.fetchPosts();
        yield PostLoadedSuccess(posts);
      } catch (_) {
        yield PostError(_.toString());
      }
    } else if (event is LoadComments) {
      yield PostLoadingProgress();
      try {
        final comments = await postRepository.fetchComments(event.postId);
        yield commentLoadSucces(comments);
      } catch (e) {
        yield PostError(e.toString());
      }
    } else if (event is AddComments) {
      yield PostLoadingProgress();
      try {
        await postRepository.addComment(event.postId, event.comment);
        final comments = await postRepository.fetchComments(event.postId);
        yield commentLoadSucces(comments);
      } catch (_) {
        yield PostError(_.toString());
      }
    }
  }
}
