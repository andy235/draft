import 'package:birthday_data/model/User.dart';
import 'package:birthday_data/provider/list_provider.dart';
import 'package:birthday_data/ui/form_people.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ui/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Birthday data app',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}

