// To parse this JSON data, do
//
//     final categories = categoriesFromJson(jsonString);

import 'dart:convert';

List<Categories> categoriesFromJson(String str) => List<Categories>.from(json.decode(str).map((x) => Categories.fromJson(x)));

String categoriesToJson(List<Categories> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Categories {
  Categories({
    this.id,
    this.name,
    this.slug,
    this.parent,
    this.description,
    this.display,
    this.image,
    this.menuOrder,
    this.count,
    this.links,
  });

  int? id;
  String? name;
  String? slug;
  int? parent;
  String? description;
  Display? display;
  Images? image;
  int? menuOrder;
  int? count;
  Links? links;

  factory Categories.fromJson(Map<dynamic, dynamic> json) => Categories(
    id: json["id"],
    name: json["name"],
    slug: json["slug"],
    parent: json["parent"],
    description: json["description"],
    display: displayValues.map![json["display"]],
    image: json["image"] == null ? null : Images.fromJson(json["image"]),
    menuOrder: json["menu_order"],
    count: json["count"],
    links: Links.fromJson(json["_links"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "slug": slug,
    "parent": parent,
    "description": description,
    "display": displayValues.reverse![display],
    "image": image == null ? null : image!.toJson(),
    "menu_order": menuOrder,
    "count": count,
    "_links": links!.toJson(),
  };
}

enum Display { DEFAULT }

final displayValues = EnumValues({
  "default": Display.DEFAULT
});

class Images {
  Images({
    this.id,
    this.dateCreated,
    this.dateCreatedGmt,
    this.dateModified,
    this.dateModifiedGmt,
    this.src,
    this.name,
    this.alt,
  });

  int? id;
  DateTime? dateCreated;
  DateTime? dateCreatedGmt;
  DateTime? dateModified;
  DateTime? dateModifiedGmt;
  String? src;
  String? name;
  String? alt;

  factory Images.fromJson(Map<dynamic, dynamic> json) => Images(
    id: json["id"],
    dateCreated: DateTime.parse(json["date_created"]),
    dateCreatedGmt: DateTime.parse(json["date_created_gmt"]),
    dateModified: DateTime.parse(json["date_modified"]),
    dateModifiedGmt: DateTime.parse(json["date_modified_gmt"]),
    src: json["src"],
    name: json["name"],
    alt: json["alt"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "date_created": dateCreated!.toIso8601String(),
    "date_created_gmt": dateCreatedGmt!.toIso8601String(),
    "date_modified": dateModified!.toIso8601String(),
    "date_modified_gmt": dateModifiedGmt!.toIso8601String(),
    "src": src,
    "name": name,
    "alt": alt,
  };
}

class Links {
  Links({
    this.self,
    this.collection,
    this.up,
  });

  List<Collection>? self;
  List<Collection>? collection;
  List<Collection>? up;

  factory Links.fromJson(Map<String, dynamic> json) => Links(
    self: List<Collection>.from(json["self"].map((x) => Collection.fromJson(x))),
    collection: List<Collection>.from(json["collection"].map((x) => Collection.fromJson(x))),
    up: json["up"] == null ? null : List<Collection>.from(json["up"].map((x) => Collection.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "self": List<dynamic>.from(self!.map((x) => x.toJson())),
    "collection": List<dynamic>.from(collection!.map((x) => x.toJson())),
    "up": up == null ? null : List<dynamic>.from(up!.map((x) => x.toJson())),
  };
}

class Collection {
  Collection({
    this.href,
  });

  String? href;

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
    href: json["href"],
  );

  Map<String, dynamic> toJson() => {
    "href": href,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
