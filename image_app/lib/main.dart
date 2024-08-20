import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_app/get_it.dart';
import 'package:image_app/presentation/bloc/home/home_bloc.dart';

import 'presentation/views/home.dart';

void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomeBloc>()..add(HomeLoaded()),
      child: MaterialApp(
        title: 'Image App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  Home(),
      ),
    );
  }
}
