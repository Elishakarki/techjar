import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techjar/blocs/bloc/post_bloc.dart';
import 'package:techjar/blocs/bloc/post_event.dart';
import 'package:techjar/blocs/bloc/post_state.dart';
import 'package:techjar/models/comments.dart';
import 'package:techjar/models/post.dart';

class PostDetailScreen extends StatefulWidget {
  final Post post;

  const PostDetailScreen({Key? key, required this.post}) : super(key: key);

  @override
  State<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends State<PostDetailScreen> {
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<PostBloc>(context).add(LoadComments(widget.post.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.post.title)),
      body: BlocBuilder<PostBloc, MyState>(
        builder: (context, state) {
          if (state is PostLoadingProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CommentLoadSucces) {
            return ListView.builder(
              itemCount: state.comments.length,
              itemBuilder: (context, index) {
                final comment = state.comments[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  elevation: 4.0,
                  child: ListTile(
                    contentPadding:
                        EdgeInsets.all(8.0), // Padding inside the ListTile
                    title: Row(
                      children: [
                        CircleAvatar(
                          child: Text(comment.name[
                              0]), // Displaying the first letter of the name
                        ),
                        SizedBox(
                            width:
                                16.0), // Space between the avatar and the text
                        Expanded(
                            child: Column(
                          children: [
                            Text(
                              comment.name,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(comment.body),
                          ],
                        )
                            // Body text will expand to fill available space
                            ),
                      ],
                    ),
                  ),
                );
              },
            );
          } else if (state is PostError) {
            return Center(
                child: Text('Failed to load comments: ${state.message}'));
          } else {
            return const Center(child: Text('No comments available'));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCommentDialog();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showCommentDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add Comment'),
          content: TextField(
            controller: _commentController,
            decoration: const InputDecoration(hintText: 'Enter your comment'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                if (_commentController.text.isNotEmpty) {
                  final comment = Comment(
                    id: widget.post.id,
                    name:
                        'Anonymous', // Use a static user ID or dynamically fetch user info
                    body: _commentController.text,
                  );
                  BlocProvider.of<PostBloc>(context)
                      .add(AddComments(widget.post.id, comment));
                }
                _commentController.clear();
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
            TextButton(
              onPressed: () {
                _commentController.clear();
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
          ],
        );
      },
    ).then((_) {
      // Refresh comments after adding a new comment
      BlocProvider.of<PostBloc>(context).add(LoadComments(widget.post.id));
    });
  }
}
