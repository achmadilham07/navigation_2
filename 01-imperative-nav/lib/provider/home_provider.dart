import 'package:flutter/material.dart';
import '../model/restaurant.dart';

import '../service/http_service.dart';
import '../model/loading_state.dart';

class HomeProvider extends ChangeNotifier {
  final HttpService httpService;

  HomeProvider({
    required this.httpService,
  });

  LoadingState state = LoadingState.initial;
  String message = "";
  List<Restaurant> listOfRestaurant = [];

  Future<dynamic> getRestaurantList() async {
    try {
      state = LoadingState.loading;
      notifyListeners();

      final result = await httpService.getRestaurantList();

      listOfRestaurant = result.restaurants;
      message = result.message;
      state = LoadingState.loaded;
      notifyListeners();
    } catch (e) {
      message = e.toString();
      state = LoadingState.error;
      notifyListeners();
    }
  }
}
