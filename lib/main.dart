import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techjar/Ui/post_screen.dart';
import 'package:techjar/repositories/post_repository.dart';
import 'package:techjar/blocs/bloc/post_bloc.dart';
import 'package:techjar/blocs/bloc/post_event.dart';


void main() {
  final PostRepository postRepository = PostRepository();
  runApp(App(postRepository: postRepository));
}

class App extends StatelessWidget {
  final PostRepository postRepository;

  App({required this.postRepository});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(postRepository)..add(LoadPosts()),
      child: MaterialApp(
        title: 'Listing App',
        home: PostListScreen(),
      ),
    );
  }
}
