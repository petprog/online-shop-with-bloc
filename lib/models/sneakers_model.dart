import 'dart:convert';

List<Sneakers> sneakersFromJson(String str) =>
    List<Sneakers>.from(json.decode(str).map((x) => Sneakers.fromJson(x)));

class Sneakers {
  final String id;
  final String name;
  final String category;
  final List<String> imageUrl;
  final List<dynamic> sizes;
  final String oldPrice;
  final String price;
  final String description;
  final String title;

  Sneakers({
    required this.id,
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.sizes,
    required this.oldPrice,
    required this.price,
    required this.description,
    required this.title,
  });

  Sneakers copyWith({
    String? id,
    String? name,
    String? category,
    List<String>? imageUrl,
    List<dynamic>? sizes,
    String? oldPrice,
    String? price,
    String? description,
    String? title,
  }) =>
      Sneakers(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        imageUrl: imageUrl ?? this.imageUrl,
        sizes: sizes ?? this.sizes,
        oldPrice: oldPrice ?? this.oldPrice,
        price: price ?? this.price,
        description: description ?? this.description,
        title: title ?? this.title,
      );

  factory Sneakers.fromJson(Map<String, dynamic> json) => Sneakers(
        id: json["id"],
        name: json["name"],
        category: json["category"],
        imageUrl: List<String>.from(json["imageUrl"].map((x) => x)),
        sizes: List<dynamic>.from(json["sizes"].map((x) => x)),
        oldPrice: json["oldPrice"],
        price: json["price"],
        description: json["description"],
        title: json["title"],
      );
}
