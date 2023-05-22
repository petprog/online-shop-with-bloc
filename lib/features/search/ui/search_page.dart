import 'package:flutter/material.dart';

import '../../../shared/views/app_style.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is Search Page",
          style: appStyle(40, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}
