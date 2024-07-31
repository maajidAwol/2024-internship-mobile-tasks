import 'package:flutter/material.dart';
import 'package:task6/add_item.dart';
import 'package:task6/details_page.dart';
import 'package:task6/home.dart';
import 'package:task6/search_product.dart';
// import 'package:task6/home.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        body: Home(),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              backgroundColor: Colors.blue,
              onPressed: () {
                Navigator.pushNamed(context, '/additem');
              },
              child: Icon(
                Icons.add,color: Colors.white,
              ),
              shape: CircleBorder(),
            );
          }
        ),
      ),
      // initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/detail': (context) => DetailsPage(),
        '/additem': (context) => AddItem(),
        '/searchpage': (context) => SearchPage(),
      },
    );
  }
}
