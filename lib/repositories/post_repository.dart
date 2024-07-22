// // repositories/post_repository.dart
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:techjar/models/comments.dart';
// import '../models/post.dart';


// class PostRepository {
//   final String baseUrl = 'https://jsonplaceholder.typicode.com';

//   Future<List<Post>> fetchPosts() async {
//     final response = await http.get(Uri.parse('$baseUrl/posts'));
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((post) => Post.fromJson(post)).toList();
//     } else {
//       throw Exception('Failed to load posts');
//     }
//   }

//   Future<List<Comment>> fetchComments(int postId) async {
//     final response = await http.get(Uri.parse('$baseUrl/posts/$postId/comments'));
//     if (response.statusCode == 200) {
//       List jsonResponse = json.decode(response.body);
//       return jsonResponse.map((comment) => Comment.fromJson(comment)).toList();


//     } else {
//       throw Exception('Failed to load comments');
//     }
//   }

//   Future<void> addComment(int postId, Comment comment) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/posts/$postId/comments'),
//       headers: {'Content-Type': 'application/json; charset=UTF-8'},
//       body: jsonEncode(comment.toJson()),
//     );
//     if (response.statusCode != 201) {
//       throw Exception('Failed to add comment');
//     }
//   }
// }


import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:techjar/models/post.dart';
import 'package:techjar/models/comments.dart';

class PostRepository {
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  Future<List<Post>> fetchPosts() async {
    final response = await http.get(Uri.parse('$baseUrl/posts'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((post) => Post.fromJson(post)).toList();
    } else {
      throw Exception('Failed to load posts');
    }
  }

  Future<List<Comment>> fetchComments(int postId) async {
    final response = await http.get(Uri.parse('$baseUrl/posts/$postId/comments'));
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((comment) => Comment.fromJson(comment)).toList();
    } else {
      throw Exception('Failed to load comments');
    }
  }

  Future<void> addComment(int postId, Comment comment) async {
    final response = await http.post(
      Uri.parse('$baseUrl/posts/$postId/comments'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'postId': postId,
        'name': comment.name,
        'email': 'test@example.com', 
        'body': comment.body,
      }),
    );

    if (response.statusCode != 201) {
      throw Exception('Failed to add comment');
    }
  }
}
