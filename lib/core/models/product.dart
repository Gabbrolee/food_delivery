
// class Product {
//   int? id;
//   String? title;
//   int? price;
//   String? description;
//   List<String> images;
//   DateTime? creationAt;
//   DateTime? updatedAt;
//   Category? category;
//
//   Product({
//     this.id,
//     this.title,
//     this.price,
//     this.description,
//     this.images = const [],
//     this.creationAt,
//     this.updatedAt,
//     this.category,
//   });
//
//   Product copyWith({
//     int? id,
//     String? title,
//     int? price,
//     String? description,
//     List<String>? images,
//     DateTime? creationAt,
//     DateTime? updatedAt,
//     Category? category,
//   }) =>
//       Product(
//         id: id ?? this.id,
//         title: title ?? this.title,
//         price: price ?? this.price,
//         description: description ?? this.description,
//         images: images ?? this.images,
//         creationAt: creationAt ?? this.creationAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//         category: category ?? this.category,
//       );
//
//   factory Product.fromJson(Map<String, dynamic> json) => Product(
//     id: json["id"],
//     title: json["title"],
//     price: json["price"],
//     description: json["description"],
//     images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
//     creationAt: json["creationAt"] == null ? null : DateTime.parse(json["creationAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//     category: json["category"] == null ? null : Category.fromJson(json["category"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "title": title,
//     "price": price,
//     "description": description,
//     "images": List<dynamic>.from(images.map((x) => x)),
//     "creationAt": creationAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//     "category": category?.toJson(),
//   };
// }
//
// class Category {
//   int? id;
//   Name? name;
//   String? image;
//   DateTime? creationAt;
//   DateTime? updatedAt;
//
//   Category({
//     this.id,
//     this.name,
//     this.image,
//     this.creationAt,
//     this.updatedAt,
//   });
//
//   Category copyWith({
//     int? id,
//     Name? name,
//     String? image,
//     DateTime? creationAt,
//     DateTime? updatedAt,
//   }) =>
//       Category(
//         id: id ?? this.id,
//         name: name ?? this.name,
//         image: image ?? this.image,
//         creationAt: creationAt ?? this.creationAt,
//         updatedAt: updatedAt ?? this.updatedAt,
//       );
//
//   factory Category.fromJson(Map<String, dynamic> json) => Category(
//     id: json["id"],
//     name: nameValues.map[json["name"]]!,
//     image: json["image"],
//     creationAt: json["creationAt"] == null ? null : DateTime.parse(json["creationAt"]),
//     updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
//   );
//
//   Map<String, dynamic> toJson() => {
//     "id": id,
//     "name": nameValues.reverse[name],
//     "image": image,
//     "creationAt": creationAt?.toIso8601String(),
//     "updatedAt": updatedAt?.toIso8601String(),
//   };
// }
//
// enum Name { CHANGE_TITLE, OTHERS, SHOES, ELECTRONICS, CLOTHES }
//
// final nameValues = EnumValues({
//   "Change title": Name.CHANGE_TITLE,
//   "Clothes": Name.CLOTHES,
//   "Electronics": Name.ELECTRONICS,
//   "Others": Name.OTHERS,
//   "Shoes": Name.SHOES
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }


class Product {
  int? id;
  String? title;
  int? price;
  String? description;
  List<String>? images;
  DateTime? creationAt;
  DateTime? updatedAt;
  Category? category;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.images,
    this.creationAt,
    this.updatedAt,
    this.category,
  });

  Product copyWith({
    int? id,
    String? title,
    int? price,
    String? description,
    List<String>? images,
    DateTime? creationAt,
    DateTime? updatedAt,
    Category? category,
  }) =>
      Product(
        id: id ?? this.id,
        title: title ?? this.title,
        price: price ?? this.price,
        description: description ?? this.description,
        images: images ?? this.images,
        creationAt: creationAt ?? this.creationAt,
        updatedAt: updatedAt ?? this.updatedAt,
        category: category ?? this.category,
      );

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    creationAt: json["creationAt"] == null ? null : DateTime.parse(json["creationAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "creationAt": creationAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "category": category?.toJson(),
  };
}

class Category {
  int? id;
  String? name;
  String? image;
  DateTime? creationAt;
  DateTime? updatedAt;

  Category({
    this.id,
    this.name,
    this.image,
    this.creationAt,
    this.updatedAt,
  });

  Category copyWith({
    int? id,
    String? name,
    String? image,
    DateTime? creationAt,
    DateTime? updatedAt,
  }) =>
      Category(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        creationAt: creationAt ?? this.creationAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    name: json["name"],
    image: json["image"],
    creationAt: json["creationAt"] == null ? null : DateTime.parse(json["creationAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "image": image,
    "creationAt": creationAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

