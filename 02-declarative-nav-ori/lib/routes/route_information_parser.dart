import 'package:flutter/material.dart';

import '../model/page_configuration.dart';

class MyRouteInformationParser
    extends RouteInformationParser<PageConfiguration> {
  @override
  Future<PageConfiguration> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location.toString());

    if (uri.pathSegments.isEmpty) {
      // without path parameter => "/"
      return PageConfiguration.home();
    } else if (uri.pathSegments.length == 1) {
      // path parameter => "/aaa"
      final first = uri.pathSegments[0].toLowerCase();
      if (first == 'home' || first == 'restaurant') {
        return PageConfiguration.home();
      } else {
        return PageConfiguration.home();
      }
    } else if (uri.pathSegments.length == 2) {
      // path parameter => "/aaa/bbb"
      final first = uri.pathSegments[0].toLowerCase();
      final second = uri.pathSegments[1].toLowerCase();
      final query = uri.queryParameters;
      if (first == 'restaurant' && second == 'review' && query.isNotEmpty) {
        return PageConfiguration.review(query["name"]!, query["review"]!);
      } else {
        return PageConfiguration.home();
      }
    } else if (uri.pathSegments.length == 3) {
      // path parameter => "/aaa/bbb/ccc"
      final first = uri.pathSegments[0].toLowerCase();
      final second = uri.pathSegments[1].toLowerCase();
      final third = uri.pathSegments[2].toLowerCase();
      if (first == 'restaurant' && second == 'detail' && third.isNotEmpty) {
        return PageConfiguration.detail(third);
      } else {
        return PageConfiguration.home();
      }
    } else {
      return PageConfiguration.home();
    }
  }

  @override
  RouteInformation? restoreRouteInformation(PageConfiguration configuration) {
    if (configuration.isHomePage) {
      return const RouteInformation(location: '/restaurant');
    } else if (configuration.isReviewPage) {
      return RouteInformation(
          location:
              '/restaurant/review?name=${configuration.nameReview}&review=${configuration.review}');
    } else if (configuration.isDetailPage) {
      return RouteInformation(
          location: '/restaurant/detail/${configuration.detailId}');
    } else {
      return null;
    }
  }
}
