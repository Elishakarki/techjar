import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techjar/blocs/bloc/post_bloc.dart';
import 'package:techjar/blocs/bloc/post_event.dart';
import 'package:techjar/blocs/bloc/post_state.dart';
import 'package:techjar/ui/post_details_screen.dart';
import 'package:techjar/models/post.dart'; // Assuming you have a Post model
import 'package:hugeicons/hugeicons.dart';

class PostListScreen extends StatefulWidget {
  const PostListScreen({Key? key}) : super(key: key);

  @override
  State<PostListScreen> createState() => _PostListScreenState();
}

class _PostListScreenState extends State<PostListScreen> {
  @override
  void initState() {
    super.initState();
    // Load posts initially
    context.read<PostBloc>().add(LoadPosts());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              context.read<PostBloc>().add(LoadPosts());
            },
          ),
        ],
      ),
      body: BlocBuilder<PostBloc, MyState>(
        bloc: context.read<PostBloc>(),
        builder: (context, state) {
          if (state is PostLoadingProgress) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostLoadedSuccess) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (context, index) {
                final post = state.posts[index];
                return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostDetailScreen(post: post)),
                      );
                    },
                    child: PostItem(post: post));
              },
            );
          } else if (state is PostError) {
            return Center(
                child: Text('Failed to load posts: ${state.message}'));
          } else if (state is PostInitial ||
              state is PostLoadedSuccess && state.posts.isEmpty) {
            return const Center(child: Text('No posts available'));
          } else {
            return const Center(child: Text('No posts available'));
          }
        },
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final Post post;

  const PostItem({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firstWordOfTitle = post.title.split(' ').first;

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 20,
                  child: Text(
                    post.title.isNotEmpty ? post.title[0] : '',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  backgroundColor:
                      Colors.blue, // Optional: Customize the background color
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      firstWordOfTitle,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      " 1 hr ago",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(post.body),
            const SizedBox(height: 10),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: Icon(Icons.thumb_up),
                  onPressed: () {},
                ),
                IconButton(
                    icon: const Icon(Icons.comment),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PostDetailScreen(post: post)),
                      );
                    }),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
