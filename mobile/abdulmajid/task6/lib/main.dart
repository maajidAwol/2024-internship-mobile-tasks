import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task6/add_item.dart';
import 'package:task6/details_page.dart';
import 'package:task6/home.dart';
import 'package:task6/models/products.dart';
import 'package:task6/search_product.dart';
import 'package:provider/provider.dart';
// import 'package:task6/home.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ProductData(),
      child: const Root(),
    ),

  );
}

class Root extends StatelessWidget {
  const Root({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      
      title: 'E-Commerce App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme
        ),
        // backgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
        
          backgroundColor: Colors.white
        )
        
      ),
      
      
      home: Scaffold(
        body: Home(),
        
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



Route _createRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}