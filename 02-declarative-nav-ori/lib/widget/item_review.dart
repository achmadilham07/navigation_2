import 'package:flutter/material.dart';

import '../model/restaurant.dart';

class ItemReview extends StatelessWidget {
  const ItemReview({
    super.key,
    required this.review,
    required this.onTap,
  });
  final CustomerReview review;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                review.name,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 8),
              Text(review.review),
            ],
          ),
        ),
      ),
    );
  }
}
