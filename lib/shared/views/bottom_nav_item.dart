import 'package:flutter/material.dart';

class BottomNavItem extends StatelessWidget {
  final Function()? onTap;
  final IconData? icon;
  const BottomNavItem({
    Key? key,
    this.onTap,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 36,
        width: 36,
        child: Icon(
          icon,
          color: Colors.white,
        ),
      ),
    );
  }
}
