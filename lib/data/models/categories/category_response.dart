class CategoryResponse {
  List<Categories>? categories;
  String? count;

  CategoryResponse({this.categories, this.count});

  CategoryResponse.fromJson(Map<String, dynamic> json) {
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    return data;
  }
}

class Categories {
  String? id;
  String? name;
  String? slug;
  bool? active;
  String? description;
  String? order;
  List<Children>? children;
  String? image;
  bool? wide;

  Categories(
      {this.id,
      this.name,
      this.slug,
      this.active,
      this.description,
      this.order,
      this.children,
      this.image,
      this.wide});

  Categories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    active = json['active'];
    description = json['description'];
    order = json['order'];
    if (json['children'] != null) {
      children = <Children>[];
      json['children'].forEach((v) {
        children!.add(new Children.fromJson(v));
      });
    }
    image = json['image'];
    wide = json['wide'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['active'] = this.active;
    data['description'] = this.description;
    data['order'] = this.order;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    data['image'] = this.image;
    data['wide'] = this.wide;
    return data;
  }
}

class Children {
  String? id;
  String? name;
  String? slug;
  bool? active;
  String? description;
  String? order;
  String? image;
  Null? children;
  String? createdAt;
  String? updatedAt;

  Children(
      {this.id,
      this.name,
      this.slug,
      this.active,
      this.description,
      this.order,
      this.image,
      this.children,
      this.createdAt,
      this.updatedAt});

  Children.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    active = json['active'];
    description = json['description'];
    order = json['order'];
    image = json['image'];
    children = json['children'];
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
    data['children'] = this.children;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
