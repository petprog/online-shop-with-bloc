// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

import '../../../shared/constants/assets_constants.dart';
import '../../../shared/views/app_style.dart';
import '../../../shared/views/category_btn.dart';
import '../../../shared/views/custom_spacer.dart';
import '../../../shared/views/latest_shoes.dart';
import '../bloc/home_bloc.dart';

class ProductByCategory extends StatefulWidget {
  final int tabIndex;
  const ProductByCategory({
    super.key,
    required this.tabIndex,
  });

  @override
  State<ProductByCategory> createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory>
    with TickerProviderStateMixin {
  double sliderValue = 100;
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.animateTo(widget.tabIndex, curve: Curves.easeIn);
  }

  void changeSliderValue(double newValue) {
    setState(() {
      sliderValue = newValue;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  List<String> brand = [
    Assets.adidas,
    Assets.gucci,
    Assets.jordan,
    Assets.nike,
  ];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<HomeBloc>(context).add(HomeGetProductsEvent());
    return BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
      switch (state.runtimeType) {
        case HomeSuccessState:
          final sstate = (state as HomeSuccessState);
          return Scaffold(
            backgroundColor: const Color(0xFFE2E2E2),
            body: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(16, 20, 0, 0),
                    height: MediaQuery.of(context).size.height * 0.4,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          Assets.topImage,
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(6, 12, 16, 18),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(AntDesign.close,
                                    color: Colors.white),
                              ),
                              InkWell(
                                onTap: () {
                                  filter(sliderValue);
                                },
                                child: const Icon(
                                  FontAwesome.sliders,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          ),
                        ),
                        TabBar(
                          padding: EdgeInsets.zero,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicatorColor: Colors.transparent,
                          controller: _tabController,
                          isScrollable: true,
                          labelColor: Colors.white,
                          labelStyle:
                              appStyle(24, Colors.white, FontWeight.bold),
                          unselectedLabelColor: Colors.grey.withOpacity(0.3),
                          tabs: const [
                            Tab(text: "Men  Shoes"),
                            Tab(text: "Women  Shoes"),
                            Tab(text: "Kids  Shoes"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.17,
                      left: 16,
                      right: 12,
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(16)),
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          LatestShoes(list: sstate.menSneakersList!),
                          LatestShoes(list: sstate.womenSneakersList!),
                          LatestShoes(list: sstate.kidsSneakersList!),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        default:
          return const SizedBox();
      }
    });
  }

  Future<dynamic> filter(double sliderValue) {
    return showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        barrierColor: Colors.white54,
        context: context,
        builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.82,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25))),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  height: 5,
                  width: 40,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black38,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: Column(
                    children: [
                      const CustomSpacer(),
                      Text(
                        "Filter",
                        style: appStyle(40, Colors.black, FontWeight.bold),
                      ),
                      const CustomSpacer(),
                      Text(
                        "Gender",
                        style: appStyle(18, Colors.black, FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          CategoryBtn(
                            label: "Men",
                            buttonClr: Colors.black,
                          ),
                          CategoryBtn(
                            label: "Women",
                            buttonClr: Colors.grey,
                          ),
                          CategoryBtn(
                            label: "Kids",
                            buttonClr: Colors.grey,
                          ),
                        ],
                      ),
                      const CustomSpacer(),
                      Text(
                        "Category",
                        style: appStyle(18, Colors.black, FontWeight.w600),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: const [
                          CategoryBtn(
                            label: "Shoes",
                            buttonClr: Colors.black,
                          ),
                          CategoryBtn(
                            label: "Apparrels",
                            buttonClr: Colors.grey,
                          ),
                          CategoryBtn(
                            label: "Accessories",
                            buttonClr: Colors.grey,
                          ),
                        ],
                      ),
                      const CustomSpacer(),
                      Text(
                        "Price",
                        style: appStyle(18, Colors.black, FontWeight.bold),
                      ),
                      const CustomSpacer(),
                      Slider(
                          value: sliderValue,
                          activeColor: Colors.black,
                          inactiveColor: Colors.grey,
                          thumbColor: Colors.black,
                          max: 500,
                          divisions: 50,
                          label: sliderValue.toString(),
                          onChanged: (double newValue) {
                            changeSliderValue(newValue);
                          }),
                      const CustomSpacer(),
                      Text(
                        "Brand",
                        style: appStyle(20, Colors.black, FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding: const EdgeInsets.all(8),
                        height: 80,
                        child: ListView.builder(
                            itemCount: brand.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.all(8),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(12))),
                                  child: Image.asset(
                                    brand[index],
                                    height: 60,
                                    width: 80,
                                    color: Colors.black,
                                  ),
                                ),
                              );
                            }),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
