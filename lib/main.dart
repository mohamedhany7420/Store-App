  import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/Screens/AllProductsScreen.dart';
import 'package:store_app/Screens/categorized_screen.dart';
import 'package:store_app/Screens/favourite_screen.dart';
import 'package:store_app/cupits/favourite_products_cupit/get_fav_products_cupit.dart';
import 'package:store_app/home_page.dart';
void main() {
  runApp(const StoreApp());
}
class StoreApp extends StatelessWidget {
  const StoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => GetFavProductsCupit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          HomePage.id :(context) => const HomePage(),
          AllProductsScreen.id : (context) => const AllProductsScreen(),
          FavoritesScreen.id : (context) => const FavoritesScreen(),
          CategorizedScreen.id :(context)=> const CategorizedScreen()
          },
        initialRoute: HomePage.id,
      
      ),
    );
  }
}

