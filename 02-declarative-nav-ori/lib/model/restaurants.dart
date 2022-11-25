// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'restaurant.dart';

class Restaurants {
  final bool error;
  final String message;
  final int count;
  final List<Restaurant> restaurants;
  Restaurants({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurants,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
      'message': message,
      'count': count,
      'restaurants': restaurants.map((x) => x.toMap()).toList(),
    };
  }

  factory Restaurants.fromMap(Map<String, dynamic> map) {
    return Restaurants(
      error: map['error'] as bool,
      message: map['message'] as String,
      count: map['count'] as int,
      restaurants: List<Restaurant>.from(
        (map['restaurants'] as List<dynamic>).map<Restaurant>(
          (x) => Restaurant.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurants.fromJson(String source) =>
      Restaurants.fromMap(json.decode(source) as Map<String, dynamic>);
}


class RestaurantDetail {
  final bool error;
  final String message;
  final int? count;
  final Restaurant restaurant;
  RestaurantDetail({
    required this.error,
    required this.message,
    required this.count,
    required this.restaurant,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'error': error,
      'message': message,
      'count': count,
      'restaurant': restaurant.toMap(),
    };
  }


  String toJson() => json.encode(toMap());

  factory RestaurantDetail.fromJson(String source) => RestaurantDetail.fromMap(json.decode(source) as Map<String, dynamic>);

  factory RestaurantDetail.fromMap(Map<String, dynamic> map) {
    return RestaurantDetail(
      error: map['error'] as bool,
      message: map['message'] as String,
      count: map['count'] != null ? map['count'] as int : null,
      restaurant: Restaurant.fromMap(map['restaurant'] as Map<String,dynamic>),
    );
  }
}
