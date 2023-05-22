import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/views/bottom_nav_bar.dart';
import '../bloc/main_bloc.dart';
import 'page_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<MainBloc>(context).add(MainInitailEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFE2E2E2),
          body: Center(child: pageList[state.pageIndex!]),
          bottomNavigationBar: const BottomNavBar(),
        );
      },
      listener: (context, state) {},
    );
  }
}
