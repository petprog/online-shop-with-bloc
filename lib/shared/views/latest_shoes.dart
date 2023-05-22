import 'package:flutter/material.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

import '../../models/sneakers_model.dart';
import 'product_staggered_tile.dart';

class LatestShoes extends StatelessWidget {
  final List<Sneakers> list;
  const LatestShoes({
    Key? key,
    required this.list,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.zero,
      crossAxisCount: 2,
      crossAxisSpacing: 20,
      mainAxisSpacing: 16,
      itemCount: list.length,
      scrollDirection: Axis.vertical,
      staggeredTileBuilder: (index) => StaggeredTile.extent(
          (index % 2 == 0) ? 1 : 1,
          (index % 4 == 1 || index % 4 == 3)
              ? MediaQuery.of(context).size.height * 0.3
              : MediaQuery.of(context).size.height * 0.28),
      itemBuilder: (context, index) {
        final sneakers = list[index];
        return ProductStaggeredTile(
            name: sneakers.name,
            price: '\$${sneakers.price}',
            imageUrl: sneakers.imageUrl[0]);
      },
    );
  }
}
