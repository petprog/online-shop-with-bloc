import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import '../../features/main/bloc/main_bloc.dart';
import 'bottom_nav_item.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BottomNavItem(
                    onTap: () {
                      BlocProvider.of<MainBloc>(context)
                          .add(MainChangePageEvent(pageIndex: 0));
                    },
                    icon: state.pageIndex == 0
                        ? MaterialCommunityIcons.home
                        : MaterialCommunityIcons.home_outline,
                  ),
                  BottomNavItem(
                    onTap: () {
                      BlocProvider.of<MainBloc>(context)
                          .add(MainChangePageEvent(pageIndex: 1));
                    },
                    icon: state.pageIndex == 1
                        ? MaterialCommunityIcons.store_search
                        : Ionicons.search,
                  ),
                  BottomNavItem(
                    onTap: () {
                      BlocProvider.of<MainBloc>(context)
                          .add(MainChangePageEvent(pageIndex: 2));
                    },
                    icon: state.pageIndex == 2
                        ? Ionicons.heart
                        : Ionicons.heart_circle_outline,
                  ),
                  BottomNavItem(
                    onTap: () {
                      BlocProvider.of<MainBloc>(context)
                          .add(MainChangePageEvent(pageIndex: 3));
                    },
                    icon: state.pageIndex == 3
                        ? Ionicons.cart
                        : Ionicons.cart_outline,
                  ),
                  BottomNavItem(
                    onTap: () {
                      BlocProvider.of<MainBloc>(context)
                          .add(MainChangePageEvent(pageIndex: 4));
                    },
                    icon: state.pageIndex == 4
                        ? Ionicons.person
                        : Ionicons.person_outline,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
