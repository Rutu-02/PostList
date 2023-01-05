import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_demo_project/core/events.dart';
import 'package:flutter_demo_project/core/exception.dart';
import 'package:flutter_demo_project/core/service.dart';
import 'package:flutter_demo_project/core/states.dart';
import 'package:flutter_demo_project/model/response_model.dart';

class PostsBloc extends Bloc<PostEvents, PostsState> {
  final PostServices postsRepo;
  List<PostModel> posts;
  PostsBloc({this.postsRepo}) : super(PostsInitState());
  @override
  Stream<PostsState> mapEventToState(PostEvents event) async* {
    switch (event) {
      case PostEvents.fetchPosts:
        yield PostsLoading();
        try {
          posts = await postsRepo.getPostList();
          yield PostsLoaded(posts: posts);
        } on SocketException {
          yield PostsListError(
            error: NoInternetException('No Internet'),
          );
        } on HttpException {
          yield PostsListError(
            error: NoServiceFoundException('No Service Found'),
          );
        } on FormatException {
          yield PostsListError(
            error: InvalidFormatException('Invalid Response format'),
          );
        } catch (e) {
          yield PostsListError(
            error: UnknownException('Unknown Error'),
          );
        }
        break;
    }
  }
}
