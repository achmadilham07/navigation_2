import 'package:flutter/material.dart';

import '../model/page_configuration.dart';

class MyRouteInformationParser
    extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = routeInformation.uri;

    if (uri.pathSegments.isEmpty) {
      // without path parameter => "/"
      return HomePageConfiguration();
    } else if (uri.pathSegments.length == 1) {
      // path parameter => "/aaa"
      final first = uri.pathSegments[0].toLowerCase();
      if (first == 'home' || first == 'restaurant') {
        return HomePageConfiguration();
      } else {
        return HomePageConfiguration();
      }
    } else if (uri.pathSegments.length == 2) {
      // path parameter => "/aaa/bbb"
      final first = uri.pathSegments[0].toLowerCase();
      final second = uri.pathSegments[1].toLowerCase();
      final query = uri.queryParameters;
      if (first == 'restaurant' && second == 'review' && query.isNotEmpty) {
        return ReviewPageConfiguration(query["name"]!, query["review"]!);
      } else {
        return HomePageConfiguration();
      }
    } else if (uri.pathSegments.length == 3) {
      // path parameter => "/aaa/bbb/ccc"
      final first = uri.pathSegments[0].toLowerCase();
      final second = uri.pathSegments[1].toLowerCase();
      final third = uri.pathSegments[2].toLowerCase();
      if (first == 'restaurant' && second == 'detail' && third.isNotEmpty) {
        return DetailPageConfiguration(third);
      } else {
        return HomePageConfiguration();
      }
    } else {
      return HomePageConfiguration();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(PageConfiguration configuration) {
    return switch (configuration) {
      HomePageConfiguration() => RouteInformation(
          uri: Uri.parse('/restaurant'),
        ),
      ReviewPageConfiguration() => RouteInformation(
          uri: Uri.parse(
              '/restaurant/review?name=${configuration.name}&review=${configuration.review}'),
        ),
      DetailPageConfiguration() => RouteInformation(
          uri: Uri.parse('/restaurant/detail/${configuration.id}'),
        ),
    };
  }
}
