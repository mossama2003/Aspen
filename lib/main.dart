import 'package:aspen/controller/home/home_cubit.dart';
import 'package:aspen/controller/nav_bar/nav_bar_cubit.dart';
import 'package:aspen/view/screens/start_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/storage/db_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DbHelper().db;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavBarCubit()),
        BlocProvider(create: (context) => HomeCubit()),
      ],
      child: const MaterialApp(
        title: 'Aspen App',
        home: StartScreen(),
      ),
    );
  }
}
