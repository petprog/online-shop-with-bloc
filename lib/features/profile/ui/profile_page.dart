import 'package:flutter/material.dart';

import '../../../shared/views/app_style.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "This is Profile",
          style: appStyle(40, Colors.black, FontWeight.bold),
        ),
      ),
    );
  }
}
