import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewShoe extends StatelessWidget {
  final String imageUrl;
  const NewShoe({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 1,
              blurRadius: 0.8,
              offset: Offset(0, 1),
            )
          ]),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width * 0.28,
      child: CachedNetworkImage(
        imageUrl: imageUrl,
      ),
    );
  }
}
