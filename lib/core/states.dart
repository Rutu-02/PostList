import 'package:equatable/equatable.dart';
import 'package:flutter_demo_project/model/response_model.dart';
abstract class PostsState extends Equatable {
  @override
  List<Object> get props => [];
}
class PostsInitState extends PostsState {}
class PostsLoading extends PostsState {}
class PostsLoaded extends PostsState {
  final List<PostModel> posts;
  PostsLoaded({this.posts});
}
class PostsListError extends PostsState {
  final error;
  PostsListError({this.error});
}