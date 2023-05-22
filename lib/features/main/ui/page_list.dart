import 'package:flutter/material.dart';
import '../../cart/ui/cart_page.dart';
import '../../favorites/ui/favorites_page.dart';
import '../../home/ui/home_page.dart';
import '../../profile/ui/profile_page.dart';
import '../../search/ui/search_page.dart';

List<Widget> pageList = [
  const HomePage(),
  const SearchPage(),
  const FavoritesPage(),
  const CartPage(),
  const ProfilePage(),
  // const SearchPage(),
  // const FavoritesPage(),
  // const CartPage(),
  // const Profile(),
];
