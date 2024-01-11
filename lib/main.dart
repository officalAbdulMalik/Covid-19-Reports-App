import 'package:covid19/views/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'controler/app_cubit/country_state_fetch_cubit.dart';
import 'controler/app_cubit/world_state_fetch_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<WorldStateFetchCubit>(
          create: (BuildContext context) => WorldStateFetchCubit(),
        ),
        // BlocProvider<CountryStateFetchCubit>(
        //   create: (BuildContext context) => CountryStateFetchCubit(),
        // ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          backgroundColor: Colors.black,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
