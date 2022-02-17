import 'package:flutter/material.dart';
import 'package:sample_app_getx/base/base_controller.dart';
import 'package:sample_app_getx/core/constants/constants.dart';
import 'package:sample_app_getx/data/models/banners/banners_response.dart';
import 'package:sample_app_getx/data/models/categories/category_response.dart';
import 'package:sample_app_getx/data/models/products/products_response.dart';
import 'package:sample_app_getx/data/models/search/products_search_response.dart';
import 'package:sample_app_getx/data/repository/home/home_repository.dart';
import 'package:get/get.dart';

class HomeController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final HomeRepository? repository;

  HomeController({
    required this.repository,
  }) : assert(repository != null);

  List<Banners> _banners = [];

  List<Categories> _categories = [];
  List<Products> _products = [];
  List<Products> _search = [];
  List<Products> _favourite = [];
  int _index = 0;
  bool _check = true;
  late TabController tabController;
  final scrollController = ScrollController();

  @override
  void onInit() {
    getBanners();
    getCategory();
    getAllproduct();
    tabController = TabController(length: 1, vsync: this);
    super.onInit();
  }

  void setIndex(int i) {
    _index = i;
    update();
  }

  void checkFavourite(bool check) {
    _check;
    update();
  }

  Future<void> getBanners() async {
    setLoading(true);
    final result = await repository?.getBanners(shipperId: Constants.shipperId);
    if (result is BannersResponse) {
      _banners = result.banners;
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<void> getAllproduct() async {
    setLoading(true);
    final result = await repository?.getAllProducts();
    if (result is ProductsResponse) {
      _products = result.featuredList?.products ?? [];
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<void> getCategory() async {
    setLoading(true);
    final result = await repository?.getCategoryWithProducts();
    setLoading(false);
    if (result is CategoryResponse) {
      _categories = result.categories ?? [];
      update();
    } else {
      Get.snackbar('error'.tr, result.toString());
      setLoading(false);
    }
  }

  Future<List<Products>> searchProduct(String? search) async {
    setLoading(true);
    final result = await repository?.getSearchProducts(search: search!);
    setLoading(false);
    if (result is ProductsResponsee) {
      return result.products;
    } else {
      Get.snackbar('error'.tr, result.toString());
      return [];
    }
  }

  List<Banners> get banners => _banners;

  List<Categories> get categories => _categories;

  List<Products> get products => _products;

  int get index => _index;
  bool get check => _check;
}
