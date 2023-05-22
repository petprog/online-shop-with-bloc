import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../../shared/constants/assets_constants.dart';
import '../../../shared/views/app_style.dart';
import '../../../shared/views/empty_placeholder.dart';
import '../bloc/favorites_bloc.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<FavoritesBloc>(context).add(FavoritesGetFavEvent());
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(16, 20, 0, 0),
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(Assets.topImage),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "My Favorites",
                  style: appStyle(40, Colors.white, FontWeight.bold),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: BlocBuilder<FavoritesBloc, FavoritesState>(
                  builder: (context, state) {
                final favShoes = state.fav;
                return favShoes.isEmpty
                    ? const Center(
                        child: EmptyPlaceholder(
                          label: 'No favorites yet',
                        ),
                      )
                    : ListView.builder(
                        itemCount: favShoes.length,
                        itemBuilder: (context, index) {
                          final shoe = favShoes[index];
                          // print(shoe);
                          return Padding(
                            padding: const EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(12)),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.11,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade500,
                                      blurRadius: 0.3,
                                      spreadRadius: 5,
                                      offset: const Offset(0, 1),
                                    )
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(12),
                                          child: CachedNetworkImage(
                                            imageUrl: shoe['imageUrl'],
                                            width: 70,
                                            height: 70,
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                            left: 20.0,
                                            top: 12,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                shoe['name'],
                                                style: appStyle(
                                                    16,
                                                    Colors.black,
                                                    FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                shoe['category'],
                                                style: appStyle(14, Colors.grey,
                                                    FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    "${shoe['price']}",
                                                    style: appStyle(
                                                        18,
                                                        Colors.black,
                                                        FontWeight.w600),
                                                  )
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: GestureDetector(
                                        onTap: () {
                                          BlocProvider.of<FavoritesBloc>(
                                                  context)
                                              .add(FavoritesDeleteFavEvent(
                                                  shoe['key']));
                                          BlocProvider.of<FavoritesBloc>(
                                                  context)
                                              .add(FavoritesRemoveFavoriteEvent(
                                                  shoe['id']));
                                          setState(() {});
                                        },
                                        child: const Icon(
                                            Ionicons.md_heart_dislike),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
              }),
            )
          ],
        ),
      ),
    );
  }
}
