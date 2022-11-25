// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:http/http.dart';
import '../model/restaurants.dart';

class HttpService {
  final Client client;

  HttpService({
    required this.client,
  });

  static String baseUrl = "restaurant-api.dicoding.dev";

  Future<Restaurants> getRestaurantList() async {
    try {
      final response = await client.get(
        Uri.https(baseUrl, "/list"),
      );

      return Restaurants.fromJson(response.body);
    } catch (e) {
      throw "Cannot load the url";
    }
  }

  Future<RestaurantDetail> getRestaurantDetail(String id) async {
    try {
      final response = await client.get(
        Uri.https(baseUrl, "/detail/$id"),
      );

      return RestaurantDetail.fromJson(response.body);
    } catch (e) {
      throw "Cannot load the url";
    }
  }
}
