import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'app_style.dart';

class ProductStaggeredTile extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String price;
  const ProductStaggeredTile(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
                height: 150,
                child:
                    CachedNetworkImage(imageUrl: imageUrl, fit: BoxFit.fill)),
            Container(
              padding: const EdgeInsets.only(top: 12),
              height: 75,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,
                      style: appStyle(20, Colors.black, FontWeight.w700, 1)),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(price,
                      style: appStyle(18, Colors.black, FontWeight.w500, 1))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
