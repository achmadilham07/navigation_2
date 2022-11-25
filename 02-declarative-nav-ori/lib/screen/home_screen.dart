import 'package:flutter/material.dart';
import '../widget/item_restaurant.dart';
import '../model/loading_state.dart';
import '../provider/home_provider.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.toDetailScreen});
  final Function(String) toDetailScreen;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      await context.read<HomeProvider>().getRestaurantList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List of Restaurant"),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 700,
          ),
          child: Consumer<HomeProvider>(
            builder: (context, value, child) {
              final state = value.state;

              if (state == LoadingState.loading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state == LoadingState.loaded) {
                final listOfRestaurant = value.listOfRestaurant;
                return ListView.builder(
                  itemCount: listOfRestaurant.length,
                  itemBuilder: (context, index) {
                    final item = listOfRestaurant[index];
                    return ItemRestaurant(
                      restaurant: item,
                      onTap: () => widget.toDetailScreen(item.id),
                    );
                  },
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
