// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Restaurant {
  final String id;
  final String name;
  final String description;
  final String city;
  final double rating;
  final String pictureId;
  final List<Categorie>? categories;
  final String? address;
  final Menus? menus;
  final List<CustomerReview>? customerReviews;

  String get linkSmallPicture =>
      "https://restaurant-api.dicoding.dev/images/small/$pictureId";
  String get linkMediumPicture =>
      "https://restaurant-api.dicoding.dev/images/medium/$pictureId";
  String get linkLargePicture =>
      "https://restaurant-api.dicoding.dev/images/large/$pictureId";

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.city,
    required this.rating,
    required this.pictureId,
    required this.categories,
    required this.address,
    required this.menus,
    required this.customerReviews,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'city': city,
      'rating': rating,
      'pictureId': pictureId,
      'categories': categories?.map((x) => x.toMap()).toList(),
      'address': address,
      'menus': menus?.toMap(),
      'customerReviews': customerReviews?.map((x) => x.toMap()).toList(),
    };
  }

  factory Restaurant.fromMap(Map<String, dynamic> map) {
    return Restaurant(
      id: map['id'] as String,
      name: map['name'] as String,
      description: map['description'] as String,
      city: map['city'] as String,
      rating: map['rating'].toDouble(),
      pictureId: map['pictureId'] as String,
      categories: map['categories'] != null
          ? List<Categorie>.from(
              (map['categories'] as List).map<Categorie?>(
                (x) => Categorie.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
      address: map['address'] != null ? map['address'] as String : null,
      menus: map['menus'] != null
          ? Menus.fromMap(map['menus'] as Map<String, dynamic>)
          : null,
      customerReviews: map['customerReviews'] != null
          ? List<CustomerReview>.from(
              (map['customerReviews'] as List).map<CustomerReview?>(
                (x) => CustomerReview.fromMap(x as Map<String, dynamic>),
              ),
            )
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Restaurant.fromJson(String source) =>
      Restaurant.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Categorie {
  final String name;
  Categorie({
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Categorie.fromMap(Map<String, dynamic> map) {
    return Categorie(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Categorie.fromJson(String source) =>
      Categorie.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Menus {
  final List<Food> foods;
  final List<Drink> drinks;
  Menus({
    required this.foods,
    required this.drinks,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'foods': foods.map((x) => x.toMap()).toList(),
      'drinks': drinks.map((x) => x.toMap()).toList(),
    };
  }

  factory Menus.fromMap(Map<String, dynamic> map) {
    return Menus(
      foods: List<Food>.from(
        (map['foods'] as List).map<Food>(
          (x) => Food.fromMap(x as Map<String, dynamic>),
        ),
      ),
      drinks: List<Drink>.from(
        (map['drinks'] as List).map<Drink>(
          (x) => Drink.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Menus.fromJson(String source) =>
      Menus.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Food {
  final String name;
  Food({
    required this.name,
  });

  Food copyWith({
    String? name,
  }) {
    return Food(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Food.fromMap(Map<String, dynamic> map) {
    return Food(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Food.fromJson(String source) =>
      Food.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Food(name: $name)';

  @override
  bool operator ==(covariant Food other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}

class Drink {
  final String name;
  Drink({
    required this.name,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory Drink.fromMap(Map<String, dynamic> map) {
    return Drink(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Drink.fromJson(String source) =>
      Drink.fromMap(json.decode(source) as Map<String, dynamic>);
}

class CustomerReview {
  final String name;
  final String review;
  final String date;
  CustomerReview({
    required this.name,
    required this.review,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'review': review,
      'date': date,
    };
  }

  factory CustomerReview.fromMap(Map<String, dynamic> map) {
    return CustomerReview(
      name: map['name'] as String,
      review: map['review'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerReview.fromJson(String source) =>
      CustomerReview.fromMap(json.decode(source) as Map<String, dynamic>);
}
