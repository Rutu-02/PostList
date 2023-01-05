import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_project/bloc/post_bloc.dart';
import 'package:flutter_demo_project/core/events.dart';
import 'package:flutter_demo_project/core/states.dart';
import 'package:flutter_demo_project/model/response_model.dart';
import 'package:flutter_demo_project/presentation/listview_item.dart';

class PostsScreen extends StatefulWidget {
  const PostsScreen({Key key}) : super(key: key);

  @override
  _PostsScreenState createState() => _PostsScreenState();
}
class _PostsScreenState extends State<PostsScreen> {
  //
  @override
  void initState() {
    super.initState();
    _loadPosts();
  }
  _loadPosts() async {
    context.bloc<PostsBloc>().add(PostEvents.fetchPosts);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
      ),
      body: Container(
        child: _body(),
      ),
    );
  }
  _body() {
    return Column(
      children: [
        BlocBuilder<PostsBloc, PostsState>(
            builder: (BuildContext context, PostsState state) {
              if (state is PostsListError) {
                final error = state.error;
                String message = '${error.message}\nTap to Retry.';
                return Text(
                  message,
                  // message: message,
                  //onTap: _loadAlbums,
                );
              }
              if (state is PostsLoaded) {
                List<PostModel> posts = state.posts;
                return _list(posts);
              }
              return CircularProgressIndicator();
            }),
      ],
    );
  }
  Widget _list(List<PostModel> posts) {
    return Expanded(
      child: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (_, index) {
          PostModel post = posts[index];
          return ListViewItem(post: post);
        },
      ),
    );
  }
}