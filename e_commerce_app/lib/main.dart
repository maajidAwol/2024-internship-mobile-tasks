import 'package:e_commerce_app/features/product/domain/usecase/insert_product_usecase.dart';
import 'package:e_commerce_app/features/product/presentation/bloc/home/home_bloc.dart';
import 'package:e_commerce_app/features/product/presentation/bloc/insert_product/insert_product_bloc.dart';
import 'package:e_commerce_app/features/product/presentation/view/details.dart';
import 'package:e_commerce_app/features/product/presentation/view/home.dart';
import 'package:e_commerce_app/features/product/presentation/view/insert_item.dart';
import 'package:e_commerce_app/get_it.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<HomeBloc>()..add(HomeLoaded()),
          
        ),
        BlocProvider(
          create: (context) => getIt<InsertProductBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'E-Commerce App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
            // backgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            useMaterial3: true,
            appBarTheme: AppBarTheme(backgroundColor: Colors.white)),

        home: Scaffold(
          body: Home(),
        ),
        // initialRoute: '/home',
        routes: {
          '/home': (context) => Home(),
          '/detail': (context) => DetailsPage(),
          '/insertitem': (context) => AddItem(),
          '/searchpage': (context) => Text("ppp"),
        },
      ),
    );
  }
}
