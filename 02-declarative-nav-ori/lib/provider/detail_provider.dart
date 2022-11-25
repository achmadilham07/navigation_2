import 'package:flutter/material.dart';
import '../model/restaurant.dart';

import '../service/http_service.dart';
import '../model/loading_state.dart';

class DetailProvider extends ChangeNotifier {
  final HttpService httpService;

  DetailProvider({
    required this.httpService,
  });

  LoadingState state = LoadingState.initial;
  String message = "";
  Restaurant? restaurant;

  Future<dynamic> getRestaurantDetail(String id) async {
    restaurant = null;
      state = LoadingState.loading;
      notifyListeners();

      final result = await httpService.getRestaurantDetail(id);

      restaurant = result.restaurant;
      message = result.message;
      state = LoadingState.loaded;
      notifyListeners();
    try {
      restaurant = null;
      state = LoadingState.loading;
      notifyListeners();

      final result = await httpService.getRestaurantDetail(id);

      restaurant = result.restaurant;
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
