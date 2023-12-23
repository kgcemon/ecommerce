import 'package:ecommerce/Provider/Favorites_provider.dart';
import 'package:ecommerce/Provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/HomeScreen.dart';

void main() {
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(
        create: (context) => home_provider(),
      ),
      ChangeNotifierProvider(create: (context) => Favorites_Provider(),),
    ], child: const MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomeScreen(),
    );
  }
}
