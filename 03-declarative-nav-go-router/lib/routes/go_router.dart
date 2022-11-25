import 'package:go_router/go_router.dart';
import '../screen/detail_screen.dart';
import '../screen/review_screen.dart';
import '../screen/home_screen.dart';

class MyGoRouter {
  GoRouter get router => _router;
  final _router = GoRouter(
    initialLocation: "/restaurant",
    routes: [
      GoRoute(
        path: '/restaurant',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'detail/:id',
            builder: (context, state) {
              final id = state.params["id"]!;
              return DetailScreen(detailId: id);
            },
          ),
          GoRoute(
            path: 'review',
            builder: (context, state) {
              final query = state.queryParams;
              final name = query["name"]!;
              final review = query["review"]!;
              return ReviewScreen(name: name, review: review);
            },
          ),
        ],
      ),
    ],
  );
}
