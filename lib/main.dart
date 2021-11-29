import 'package:flutter/material.dart';
import 'package:food_app/view/home/home_page.dart';
import 'package:food_app/view_model/product_state.dart';
import 'package:food_app/view_model/user_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (BuildContext context) {
              return ProductState();
            },
          ),
          ChangeNotifierProvider(
            create: (BuildContext context) {
              return UserState();
            },
          ),
        ],
        child: const HomePage(),
      ),
    );
  }
}
