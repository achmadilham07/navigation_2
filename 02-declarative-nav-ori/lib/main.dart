import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../provider/home_provider.dart';
import '../routes/route_information_parser.dart';
import '../routes/router_delegate.dart';
import '../service/http_service.dart';
import 'package:provider/provider.dart';

import 'provider/detail_provider.dart';

void main() {
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
      routeInformationParser: MyRouteInformationParser(),
      routerDelegate: MyRouterDelegate(),
      backButtonDispatcher: RootBackButtonDispatcher(),
    );
  }
}
