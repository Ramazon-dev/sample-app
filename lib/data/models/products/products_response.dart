class ProductsResponse {
  FeaturedList? featuredList;

  ProductsResponse({this.featuredList});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    featuredList = json['featured_list'] != null
        ? new FeaturedList.fromJson(json['featured_list'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.featuredList != null) {
      data['featured_list'] = this.featuredList!.toJson();
    }
    return data;
  }
}

class FeaturedList {
  String? id;
  String? title;
  String? slug;
  List<Products>? products;
  String? order;
  String? createdAt;
  String? lang;
  bool? active;
  String? description;

  FeaturedList(
      {this.id,
      this.title,
      this.slug,
      this.products,
      this.order,
      this.createdAt,
      this.lang,
      this.active,
      this.description});

  FeaturedList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    order = json['order'];
    createdAt = json['created_at'];
    lang = json['lang'];
    active = json['active'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    data['order'] = this.order;
    data['created_at'] = this.createdAt;
    data['lang'] = this.lang;
    data['active'] = this.active;
    data['description'] = this.description;
    return data;
  }
}

class Products {
  String? id;
  String? name;
  String? slug;
  String? previewText;
  bool? active;
  String? image;
  String? code;
  String? order;
  int? cheapestPrice;
  InStock? inStock;

  Products(
      {this.id,
      this.name,
      this.slug,
      this.previewText,
      this.active,
      this.image,
      this.code,
      this.order,
      this.cheapestPrice,
      this.inStock});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    previewText = json['preview_text'];
    active = json['active'];
    image = json['image'];
    code = json['code'];
    order = json['order'];
    cheapestPrice = json['cheapest_price'];
    inStock =
        json['inStock'] != null ? new InStock.fromJson(json['inStock']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['preview_text'] = this.previewText;
    data['active'] = this.active;
    data['image'] = this.image;
    data['code'] = this.code;
    data['order'] = this.order;
    data['cheapest_price'] = this.cheapestPrice;
    if (this.inStock != null) {
      data['inStock'] = this.inStock!.toJson();
    }
    return data;
  }
}

class InStock {
  bool? samarkand;
  bool? tashkentCity;

  InStock({this.samarkand, this.tashkentCity});

  InStock.fromJson(Map<String, dynamic> json) {
    samarkand = json['samarkand'];
    tashkentCity = json['tashkent_city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['samarkand'] = this.samarkand;
    data['tashkent_city'] = this.tashkentCity;
    return data;
  }
}
