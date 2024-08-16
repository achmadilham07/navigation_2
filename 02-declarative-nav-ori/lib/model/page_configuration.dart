import 'package:equatable/equatable.dart';

sealed class PageConfiguration extends Equatable {
  @override
  List<Object?> get props => [];
}

final class HomePageConfiguration extends PageConfiguration {}

final class DetailPageConfiguration extends PageConfiguration {
  final String id;

  DetailPageConfiguration(this.id);

  @override
  List<Object?> get props => [id];
}

final class ReviewPageConfiguration extends PageConfiguration {
  final String name;
  final String review;

  ReviewPageConfiguration(this.name, this.review);
  @override
  List<Object?> get props => [name, review];
}
