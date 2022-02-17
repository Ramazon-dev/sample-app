class AssemblyBannersResponse {
  Product? product;

  AssemblyBannersResponse({this.product});

  AssemblyBannersResponse.fromJson(Map<String, dynamic> json) {
    product =
        json['product'] != null ? new Product.fromJson(json['product']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.product != null) {
      data['product'] = this.product!.toJson();
    }
    return data;
  }
}

class Product {
  String? id;
  String? name;
  String? slug;
  String? previewText;
  String? description;
  String? characteristics;
  bool? active;
  List<Properties>? properties;
  Price? price;
  String? image;
  List<String>? gallery;
  int? averageRate;
  String? reviewsCount;
  Meta? meta;
  String? order;
  int? cheapestPrice;
  String? code;
  List<Variants>? variants;
  Category? category;
  int? discount;
  int? installmentAmount;

  Product(
      {this.id,
      this.name,
      this.slug,
      this.previewText,
      this.description,
      this.characteristics,
      this.active,
      this.properties,
      this.price,
      this.image,
      this.gallery,
      this.averageRate,
      this.reviewsCount,
      this.meta,
      this.order,
      this.cheapestPrice,
      this.code,
      this.variants,
      this.category,
      this.discount,
      this.installmentAmount});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    previewText = json['preview_text'];
    description = json['description'];
    characteristics = json['characteristics'];
    active = json['active'];
    if (json['properties'] != null) {
      properties = <Properties>[];
      json['properties'].forEach((v) {
        properties!.add(new Properties.fromJson(v));
      });
    }
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    image = json['image'];
    gallery = json['gallery'].cast<String>();
    averageRate = json['average_rate'];
    reviewsCount = json['reviews_count'];
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    order = json['order'];
    cheapestPrice = json['cheapest_price'];
    code = json['code'];
    if (json['variants'] != null) {
      variants = <Variants>[];
      json['variants'].forEach((v) {
        variants!.add(new Variants.fromJson(v));
      });
    }
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    discount = json['discount'];
    installmentAmount = json['installment_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['preview_text'] = this.previewText;
    data['description'] = this.description;
    data['characteristics'] = this.characteristics;
    data['active'] = this.active;
    if (this.properties != null) {
      data['properties'] = this.properties!.map((v) => v.toJson()).toList();
    }
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['image'] = this.image;
    data['gallery'] = this.gallery;
    data['average_rate'] = this.averageRate;
    data['reviews_count'] = this.reviewsCount;
    if (this.meta != null) {
      data['meta'] = this.meta!.toJson();
    }
    data['order'] = this.order;
    data['cheapest_price'] = this.cheapestPrice;
    data['code'] = this.code;
    if (this.variants != null) {
      data['variants'] = this.variants!.map((v) => v.toJson()).toList();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    data['discount'] = this.discount;
    data['installment_amount'] = this.installmentAmount;
    return data;
  }
}

class Properties {
  String? id;
  Property? property;
  List<Value>? value;

  Properties({this.id, this.property, this.value});
  Properties.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    property = json['property'] != null
        ? new Property.fromJson(json['property'])
        : null;
    if (json['value'] != null) {
      value = <Value>[];
      json['value'].forEach((v) {
        value!.add(new Value.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.property != null) {
      data['property'] = this.property!.toJson();
    }
    if (this.value != null) {
      data['value'] = this.value!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Property {
  String? id;
  String? name;
  String? slug;
  String? type;
  bool? active;
  String? description;
  String? order;
  String? lang;

  Property(
      {this.id,
      this.name,
      this.slug,
      this.type,
      this.active,
      this.description,
      this.order,
      this.lang});

  Property.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    type = json['type'];
    active = json['active'];
    description = json['description'];
    order = json['order'];
    lang = json['lang'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['type'] = this.type;
    data['active'] = this.active;
    data['description'] = this.description;
    data['order'] = this.order;
    data['lang'] = this.lang;
    return data;
  }
}

class Value {
  String? name;
  String? value;
  String? extra;
  String? order;

  Value({this.name, this.value, this.extra, this.order});

  Value.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'];
    extra = json['extra'];
    order = json['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['value'] = this.value;
    data['extra'] = this.extra;
    data['order'] = this.order;
    return data;
  }
}

class Price {
  int? price;
  int? oldPrice;
  int? uzsPrice;

  Price({this.price, this.oldPrice, this.uzsPrice});

  Price.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    oldPrice = json['old_price'];
    uzsPrice = json['uzs_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['old_price'] = this.oldPrice;
    data['uzs_price'] = this.uzsPrice;
    return data;
  }
}

class Meta {
  String? title;
  String? description;
  String? tags;

  Meta({this.title, this.description, this.tags});

  Meta.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    tags = json['tags'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['tags'] = this.tags;
    return data;
  }
}

class Variants {
  String? name;
  Value? value;

  Variants({this.name, this.value});

  Variants.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    value = json['value'] != null ? new Value.fromJson(json['value']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.value != null) {
      data['value'] = this.value!.toJson();
    }
    return data;
  }
}

class Values {
  String? id;
  String? name;
  String? slug;
  String? previewText;
  bool? active;
  Price? price;
  String? image;
  List<String>? gallery;
  String? lang;
  String? description;
  String? characteristics;
  int? installmentAmount;
  Values(
      {this.id,
      this.name,
      this.slug,
      this.previewText,
      this.active,
      this.price,
      this.image,
      this.gallery,
      this.lang,
      this.description,
      this.characteristics,
      this.installmentAmount});

  Values.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    previewText = json['preview_text'];
    active = json['active'];
    price = json['price'] != null ? new Price.fromJson(json['price']) : null;
    image = json['image'];
    gallery = json['gallery'].cast<String>();
    lang = json['lang'];
    description = json['description'];
    characteristics = json['characteristics'];
    installmentAmount = json['installment_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['preview_text'] = this.previewText;
    data['active'] = this.active;
    if (this.price != null) {
      data['price'] = this.price!.toJson();
    }
    data['image'] = this.image;
    data['gallery'] = this.gallery;
    data['lang'] = this.lang;
    data['description'] = this.description;
    data['characteristics'] = this.characteristics;
    data['installment_amount'] = this.installmentAmount;
    return data;
  }
}

class Category {
  String? id;
  String? name;
  String? slug;
  Parent? parent;
  bool? active;
  String? order;
  String? image;

  Category(
      {this.id,
      this.name,
      this.slug,
      this.parent,
      this.active,
      this.order,
      this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    parent =
        json['parent'] != null ? new Parent.fromJson(json['parent']) : null;
    active = json['active'];
    order = json['order'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    if (this.parent != null) {
      data['parent'] = this.parent!.toJson();
    }
    data['active'] = this.active;
    data['order'] = this.order;
    data['image'] = this.image;
    return data;
  }
}

class Parent {
  String? id;
  String? name;
  String? slug;
  bool? active;
  String? description;
  String? order;
  String? image;
  String? createdAt;
  String? updatedAt;

  Parent(
      {this.id,
      this.name,
      this.slug,
      this.active,
      this.description,
      this.order,
      this.image,
      this.createdAt,
      this.updatedAt});

  Parent.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    active = json['active'];
    description = json['description'];
    order = json['order'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['active'] = this.active;
    data['description'] = this.description;
    data['order'] = this.order;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
