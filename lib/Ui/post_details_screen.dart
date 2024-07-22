// screens/post_detail_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techjar/blocs/bloc/post_bloc.dart';
import 'package:techjar/blocs/bloc/post_state.dart';
import '../models/post.dart';
// import '../models/comment.dart';
// import '../blocs/post_bloc.dart';
// import '../blocs/post_event.dart';
// import '../blocs/post_state.dart';

class PostDetailScreen extends StatelessWidget {
  final Post post;

  PostDetailScreen({required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(post.title)),
      body: BlocBuilder<PostBloc, MyState>(
        builder: (context, state) {
          if (state is PostLoadingProgress) {
            return Center(child: CircularProgressIndicator());
          } else if (state is commentLoadSucces) {
            return ListView.builder(
              itemCount: state.comments.length,
              itemBuilder: (context, index) {
                final comment = state.comments[index];
                return ListTile(
                  title: Text(comment.name),
                  subtitle: Text(comment.body),
                );
              },
            );
          } else {
            return Center(child: Text('Failed to load comments'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Implement add comment functionality
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
