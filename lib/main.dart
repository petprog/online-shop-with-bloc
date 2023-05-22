import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'features/favorites/bloc/favorites_bloc.dart';
import 'features/home/bloc/home_bloc.dart';
import 'features/main/bloc/main_bloc.dart';
import 'features/main/ui/main_screen.dart';
import 'features/product/bloc/product_bloc.dart';

import 'features/cart/bloc/cart_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('cart_box');
  await Hive.openBox('fav_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<MainBloc>(create: (context) => MainBloc()),
          BlocProvider<HomeBloc>(create: (context) => HomeBloc()),
          BlocProvider<FavoritesBloc>(create: (context) => FavoritesBloc()),
          BlocProvider<ProductBloc>(create: (context) => ProductBloc()),
          BlocProvider<CartBloc>(create: (context) => CartBloc()),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: const MainScreen(),
        ));
  }
}
