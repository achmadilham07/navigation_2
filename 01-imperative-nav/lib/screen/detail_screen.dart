import 'package:flutter/material.dart';
import '../provider/detail_provider.dart';
import '../screen/comment_screen.dart';
import '../widget/item_review.dart';
import 'package:provider/provider.dart';

import '../model/loading_state.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.detailId,
  });
  final String detailId;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<DetailProvider>().getRestaurantDetail(widget.detailId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Restaurant Detail"),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 700,
          ),
          child: Consumer<DetailProvider>(
            builder: (context, value, child) {
              final state = value.state;

              if (state == LoadingState.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == LoadingState.loaded) {
                final restaurant = value.restaurant;
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Image.network(
                        restaurant!.linkMediumPicture,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              restaurant.name,
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  restaurant.city,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    Text(
                                      restaurant.rating.toString(),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              restaurant.description,
                            ),
                            const SizedBox(height: 8),
                            const Divider(),
                            const SizedBox(height: 8),
                            Text(
                              "Komentar",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const SizedBox(height: 8),
                            ListView.builder(
                              itemCount: restaurant.customerReviews!.length,
                              primary: false,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final review =
                                    restaurant.customerReviews![index];
                                return ItemReview(
                                  review: review,
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CommentScreen(
                                          name: review.name,
                                          review: review.review,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                final message = value.message;
                return Center(
                  child: Text(message),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
