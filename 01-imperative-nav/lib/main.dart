import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../provider/home_provider.dart';
import '../screen/home_screen.dart';
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
    return MaterialApp(
      title: 'Restaurant App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
