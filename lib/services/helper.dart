import 'package:flutter/services.dart' as the_bundle;
import 'package:hive_flutter/hive_flutter.dart';

import '../models/sneakers_model.dart';
import '../shared/constants/assets_constants.dart';

class Helper {
  Future<List<Sneakers>> getSneakersByType(String type) async {
    String jsonFile;

    if (type == 'men') {
      jsonFile = Assets.menShoesJson;
    } else if (type == 'women') {
      jsonFile = Assets.womenShoesJson;
    } else if (type == 'kids') {
      jsonFile = Assets.kidShoesJson;
    } else {
      throw Exception('Invalid sneakers type');
    }

    try {
      final data = await the_bundle.rootBundle.loadString(jsonFile);
      final sneakersList = sneakersFromJson(data);
      return sneakersList;
    } catch (e) {
      throw Exception('Failed to load sneakers data: $e');
    }
  }

  Future<Sneakers> getSneakersById(String type, String id) async {
    final list = await getSneakersByType(type);

    try {
      return list.firstWhere((element) => element.id == id);
    } catch (e) {
      throw Exception('Sneakers not found');
    }
  }

  List<dynamic> get cartList {
    final cartBox = Hive.box('cart_box');
    List<dynamic> cart = [];
    final cartData = cartBox.keys.map((key) {
      final item = cartBox.get(key);
      return {
        "key": key,
        "id": item['id'],
        "category": item['category'],
        "name": item['name'],
        "imageUrl": item['imageUrl'],
        "price": item['price'],
        "qty": item['qty'],
        "sizes": item['sizes']
      };
    }).toList();

    cart = cartData.reversed.toList();
    return cart;
  }
}
