import 'dart:developer';

import 'package:flutter/material.dart';
import '../screen/detail_screen.dart';
import '../screen/home_screen.dart';
import '../model/page_configuration.dart';
import '../screen/review_screen.dart';

class MyRouterDelegate extends RouterDelegate<PageConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final GlobalKey<NavigatorState> _navigatorKey;

  bool? isUnknown;

  MyRouterDelegate() : _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  String? detailId;
  String? nameReview;
  String? review;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: navigatorKey,
      pages: [
        MaterialPage(
          child: HomeScreen(
            toDetailScreen: (String id) {
              detailId = id;
              notifyListeners();
            },
          ),
        ),
        if (detailId != null)
          MaterialPage(
            child: DetailScreen(
              detailId: detailId!,
              toReviewScreen: (name, review) {
                nameReview = name;
                this.review = review;
                notifyListeners();
              },
            ),
          ),
        if (nameReview != null && review != null)
          MaterialPage(
            child: ReviewScreen(
              name: nameReview!,
              review: review!,
            ),
          ),
      ],
      onPopPage: (route, result) {
        final didPop = route.didPop(result);
        if (!didPop) {
          return false;
        }

        if (nameReview != null && review != null) {
          nameReview = null;
          review = null;
        } else if (detailId != null) {
          detailId = null;
        }

        notifyListeners();

        return true;
      },
    );
  }

  @override
  PageConfiguration? get currentConfiguration {
    if (isUnknown == true) {
      return PageConfiguration.unknown();
    } else if (detailId == null) {
      return PageConfiguration.home();
    } else if (nameReview != null && review != null) {
      return PageConfiguration.review(nameReview!, review!);
    } else if (detailId != null) {
      return PageConfiguration.detail(detailId!);
    } else {
      return null;
    }
  }

  @override
  Future<void> setNewRoutePath(PageConfiguration configuration) async {
    if (configuration.isUnknownPage) {
      isUnknown = true;
      detailId = null;
      nameReview = null;
      review = null;
    } else if (configuration.isHomePage) {
      isUnknown = false;
      detailId = null;
      nameReview = null;
      review = null;
    } else if (configuration.isDetailPage) {
      isUnknown = false;
      detailId = configuration.detailId;
      nameReview = null;
      review = null;
    } else if (configuration.isReviewPage) {
      isUnknown = false;
      detailId = configuration.detailId;
      nameReview = configuration.nameReview;
      review = configuration.review;
    } else {
      log(' Could not set new route');
    }

    notifyListeners();
  }
}
