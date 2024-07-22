// screens/post_list_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techjar/Ui/post_details_screen.dart';
import 'package:techjar/blocs/bloc/post_bloc.dart';
import 'package:techjar/blocs/bloc/post_state.dart';

class PostListScreen extends StatelessWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      body: BlocBuilder<PostBloc, MyState>(
        builder: (context, state) {
          if (state is PostLoadingProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoadedSuccess) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetailScreen(post: post),
                      ),
                    );
                  },
                );
              },
            );
          } else {
            return const Center(child: Text('Failed to load posts'));
          }
        },
      ),
    );
  }
}
