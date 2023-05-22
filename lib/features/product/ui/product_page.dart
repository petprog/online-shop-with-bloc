import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../cart/bloc/cart_bloc.dart';
import '../bloc/product_bloc.dart';

import '../../../models/sneakers_model.dart';
import '../../../shared/views/app_style.dart';
import '../../../shared/views/checkout_btn.dart';
import '../../favorites/bloc/favorites_bloc.dart';
import '../../favorites/ui/favorites_page.dart';

class ProductPage extends StatefulWidget {
  final Sneakers sneaker;
  const ProductPage({
    super.key,
    required this.sneaker,
  });

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FavoritesBloc>(context).add(FavoritesGetFavoritesEvent());
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              leadingWidth: 0,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                        BlocProvider.of<ProductBloc>(context)
                            .add(ProductAddSizes([]));
                      },
                      child: const Icon(
                        AntDesign.close,
                        color: Colors.black,
                      ),
                    ),
                    GestureDetector(
                      onTap: null,
                      child: const Icon(
                        Ionicons.ellipsis_horizontal,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
              ),
              pinned: true,
              snap: false,
              floating: true,
              backgroundColor: Colors.transparent,
              expandedHeight: MediaQuery.of(context).size.height,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: widget.sneaker.imageUrl.length,
                          controller: _pageController,
                          onPageChanged: (page) {
                            // productNotifier.activePage = page;
                            BlocProvider.of<ProductBloc>(context)
                                .add(ProductChangePageEvent(pageIndex: page));
                          },
                          itemBuilder: (context, int index) {
                            return Stack(
                              children: [
                                Container(
                                  height:
                                      MediaQuery.of(context).size.height * 0.39,
                                  width: MediaQuery.of(context).size.width,
                                  color: Colors.grey.shade300,
                                  child: CachedNetworkImage(
                                    imageUrl: widget.sneaker.imageUrl[index],
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Positioned(
                                  top: MediaQuery.of(context).size.height * 0.1,
                                  right: 20,
                                  child: BlocBuilder<FavoritesBloc,
                                      FavoritesState>(
                                    builder: (context, state) {
                                      return GestureDetector(
                                        onTap: () async {
                                          if (BlocProvider.of<FavoritesBloc>(
                                                  context)
                                              .isFavorite(widget.sneaker.id)) {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const FavoritesPage()));
                                          } else {
                                            BlocProvider.of<FavoritesBloc>(
                                                    context)
                                                .add(
                                                    FavoritesAddFavoritesEvent({
                                              "id": widget.sneaker.id,
                                              "name": widget.sneaker.name,
                                              'category':
                                                  widget.sneaker.category,
                                              "price": widget.sneaker.price,
                                              "imageUrl":
                                                  widget.sneaker.imageUrl[0],
                                            }));
                                          }
                                          setState(() {});
                                        },
                                        child: BlocProvider.of<FavoritesBloc>(
                                                    context)
                                                .isFavorite(widget.sneaker.id)
                                            ? const Icon(
                                                MaterialCommunityIcons.heart)
                                            : const Icon(MaterialCommunityIcons
                                                .heart_outline),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          }),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.32,
                      right: 0,
                      left: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List<Widget>.generate(
                          widget.sneaker.imageUrl.length,
                          (index) => Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: CircleAvatar(
                              radius: 5,
                              backgroundColor: state.activePage != index
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                        bottom: 30,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 0.63,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(12),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      widget.sneaker.name,
                                      style: appStyle(
                                          40, Colors.black, FontWeight.bold),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          widget.sneaker.category,
                                          style: appStyle(
                                              20, Colors.grey, FontWeight.w500),
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        RatingBar.builder(
                                          initialRating: 4,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 22,
                                          itemPadding:
                                              const EdgeInsets.symmetric(
                                                  horizontal: 1),
                                          itemBuilder: (context, _) =>
                                              const Icon(
                                            Icons.star,
                                            size: 18,
                                            color: Colors.black,
                                          ),
                                          onRatingUpdate: (rating) {},
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$${widget.sneaker.price}",
                                          style: appStyle(26, Colors.black,
                                              FontWeight.w600),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Colors",
                                              style: appStyle(18, Colors.black,
                                                  FontWeight.w500),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const CircleAvatar(
                                              radius: 7,
                                              backgroundColor: Colors.black,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            const CircleAvatar(
                                              radius: 7,
                                              backgroundColor: Colors.red,
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Select sizes",
                                              style: appStyle(20, Colors.black,
                                                  FontWeight.w600),
                                            ),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                              "View size guide",
                                              style: appStyle(20, Colors.grey,
                                                  FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        const ShoeSizeChoices()
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Divider(
                                      indent: 10,
                                      endIndent: 10,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: Text(
                                        widget.sneaker.title,
                                        maxLines: 2,
                                        style: appStyle(
                                            26, Colors.black, FontWeight.w700),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      widget.sneaker.description,
                                      textAlign: TextAlign.justify,
                                      maxLines: 4,
                                      style: appStyle(
                                          14, Colors.black, FontWeight.normal),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Padding(
                                        padding: const EdgeInsets.only(top: 12),
                                        child: CheckoutButton(
                                          onTap: () async {
                                            if (state.sizes.isEmpty) {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                      "Please select size"),
                                                ),
                                              );
                                            } else {
                                              // print('addTocart ${state.sizes}');
                                              BlocProvider.of<CartBloc>(context)
                                                  .add(CartAddNewCartEvent({
                                                "id": widget.sneaker.id,
                                                "name": widget.sneaker.name,
                                                "category":
                                                    widget.sneaker.category,
                                                "sizes": state.sizes[0],
                                                "imageUrl":
                                                    widget.sneaker.imageUrl[0],
                                                "price": widget.sneaker.price,
                                                "qty": 1
                                              }));
                                              // print(sneaker.name);
                                              BlocProvider.of<ProductBloc>(
                                                      context)
                                                  .add(ProductAddSizes([]));
                                              BlocProvider.of<ProductBloc>(
                                                      context)
                                                  .add(
                                                      ProductUnCheckAllShoeSizes());
                                              Navigator.pop(context);
                                            }
                                          },
                                          label: "Add to Cart",
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}

class ShoeSizeChoices extends StatefulWidget {
  const ShoeSizeChoices({
    Key? key,
  }) : super(key: key);

  @override
  State<ShoeSizeChoices> createState() => _ShoeSizeChoicesState();
}

class _ShoeSizeChoicesState extends State<ShoeSizeChoices> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) => SizedBox(
        height: 40,
        child: ListView.builder(
            itemCount: state.shoeSizes.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final shoeSize = state.shoeSizes[index];

              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
                child: ChoiceChip(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60),
                      side: const BorderSide(
                          color: Colors.black,
                          width: 1,
                          style: BorderStyle.solid),
                    ),
                    backgroundColor: Colors.grey.shade200,
                    disabledColor: Colors.white,
                    label: Text(
                      shoeSize['size'],
                      style: appStyle(
                          18,
                          shoeSize['isSelected']
                              ? Colors.white
                              : Colors.black38,
                          FontWeight.w500),
                    ),
                    selectedColor: Colors.black,
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    selected: shoeSize['isSelected'],
                    onSelected: (newState) {
                      if (state.sizes.contains(shoeSize['size'])) {
                        state.sizes.remove(shoeSize['size']);
                        // BlocProvider.of<ProductBloc>(context)
                        //     .add(ProductAddSizes(state.sizes));
                      } else {
                        state.sizes.add(shoeSize['size']);
                        // BlocProvider.of<ProductBloc>(context)
                        //     .add(ProductAddSizes(state.sizes));
                      }
                      BlocProvider.of<ProductBloc>(context)
                          .add(ProductCheckShoeSizes(index));

                      setState(() {});
                    }),
              );
            }),
      ),
    );
  }
}
