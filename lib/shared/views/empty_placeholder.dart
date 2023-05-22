import 'package:flutter/material.dart';

import 'app_style.dart';

class EmptyPlaceholder extends StatelessWidget {
  final String label;
  const EmptyPlaceholder({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.hourglass_empty,
          size: 48,
          color: Colors.grey,
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: appStyle(20, Colors.grey, FontWeight.w600, 1),
        ),
      ],
    );
  }
}
