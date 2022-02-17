import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/base/base_controller.dart';
import 'package:sample_app_getx/core/constants/constants.dart';
import 'package:sample_app_getx/data/models/assembly/assembly_banner_response.dart';
import 'package:sample_app_getx/data/provider/api_client.dart';
import 'package:sample_app_getx/data/repository/home/home_repository.dart';

class AssemblyController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final HomeRepository repository = HomeRepository(
    apiClient: ApiClient.getInstance(),
  );
  AssemblyController();
  List<String> _result = [];
  int _price = 0;

  // Future<void> getDiscriptions() async {
  //   setLoading(true);
  //   final result = await repository?.getDiscriptions();
  //   if (result is DisctriptionResponse) {
  //     _result = result.characteristics ?? '';
  //   } else {
  //     Get.snackbar('error'.tr, result.toString());
  //     setLoading(false);
  //   }
  // }
  Future<void> getProductImage({required String id}) async {
    setLoading(true);
    final result = await repository.getProductImageFunc(id: id);
    debugPrint(
        'assembly controller result return qilamiza $result, va id ni $id');
    if (result is AssemblyBannersResponse) {
      _result = result.product!.gallery ?? [];
      // _result.add(result.product!.image ?? '');
      // _result.add(result.product!.image ?? '');

      update();
      setLoading(false);
      debugPrint('aaaaaaaaaaaaaa qowildi $_result');
    } else {
      debugPrint('result qiymatsiz $_result');
      Get.snackbar('error'.tr, result.toString());
    }
  }

  Future<void> getProductPrice({required String id}) async {
    setLoading(true);
    final result = await repository.getProductImageFunc(id: id);
    debugPrint(
        'assembly controller result return qilamiza $result, va id ni $id');
    if (result is AssemblyBannersResponse) {
      _price = result.product!.price!.uzsPrice ?? 0;
      // _result.add(result.product!.image ?? '');
      // _result.add(result.product!.image ?? '');

      update();
      setLoading(false);
      debugPrint('aaaaaaaaaaaaaa qowildi $_result');
    } else {
      debugPrint('result qiymatsiz $_result');
      Get.snackbar('error'.tr, result.toString());
    }
  }
  // _price = result.product!.price?.uzsPrice ?? [];

  List<String> get result => _result;
  int get price => _price;
}
