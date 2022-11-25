import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import '../common/url_strategy.dart';
import '../provider/detail_provider.dart';
import '../provider/home_provider.dart';
import '../routes/go_router.dart';
import '../service/http_service.dart';

void main() {
  usePathUrlStrategy();
  final httpService = HttpService(client: Client());
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => HomeProvider(httpService: httpService),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailProvider(httpService: httpService),
        ),
        Provider(
          create: (context) => MyGoRouter(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Restaurant App',
      routerConfig: context.read<MyGoRouter>().router,
    );
  }
}
