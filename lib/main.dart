import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'manager_cubit/button_navigation_cubit/button_navation_bar_cubit.dart';
import 'manager_cubit/coins_app_cubit/coins_cubit.dart';
import 'manager_cubit/new_app_cubit/news_cubit.dart';
import 'navigation_bar_item_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit()..getArticle(value: 'General'),
        ),
        BlocProvider(create: (context) => CoinsCubit()..getCoins()),
        BlocProvider(create: (context) => ButtonNavationBarCubit()),
      ],
      child: MaterialApp(
        home: NavigationBarItemScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
