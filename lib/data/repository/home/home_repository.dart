import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:sample_app_getx/base/base_repository.dart';
import 'package:sample_app_getx/data/models/assembly/assembly_banner_response.dart';
import 'package:sample_app_getx/data/models/assembly/disctriptions_response.dart';
import 'package:sample_app_getx/data/models/banners/banners_response.dart';
import 'package:sample_app_getx/data/models/categories/category_response.dart';
import 'package:sample_app_getx/data/models/products/products_response.dart';
import 'package:sample_app_getx/data/models/search/products_search_response.dart';
import 'package:sample_app_getx/data/provider/api_client.dart';
import 'package:sample_app_getx/data/provider/response_handler.dart';
import 'package:sample_app_getx/data/provider/server_error.dart';

class HomeRepository extends BaseRepository {
  ApiClient apiClient;

  HomeRepository({
    required this.apiClient,
  }) : assert(apiClient != null);

  Future<ResponseHandler<BannersResponse>> _fetchBanners(
      {required String shipperId,
      required int page,
      required int limit}) async {
    BannersResponse response;
    try {
      response = await apiClient.getBanners(limit);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getBanners({required String shipperId}) async {
    final response =
        await _fetchBanners(shipperId: shipperId, limit: 100, page: 1);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? '');
    }
  }

  Future<ResponseHandler<CategoryResponse?>>
      _fetchCategoryWithProducts() async {
    CategoryResponse response;
    try {
      response = await apiClient.getCategoryWithProduct("100", "ru");
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getCategoryWithProducts() async {
    final response = await _fetchCategoryWithProducts();
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  Future<ResponseHandler<ProductsResponse>> _fetchSearchProducts() async {
    ProductsResponse response;
    try {
      response = await apiClient.getFProducts();
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getAllProducts() async {
    final response = await _fetchSearchProducts();
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  Future<dynamic> getSearchProducts({required String search}) async {
    final response = await _fetchSearchPProducts(search: search);
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != "Canceled") {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  Future<ResponseHandler<ProductsResponsee>> _fetchSearchPProducts({
    required String search,
  }) async {
    ProductsResponsee response;
    try {
      response = await apiClient.getProductSearch(search);
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getDiscriptions() async {
    final response = await _fetchDiscription();
    if (response.data != null) {
      return response.data;
    } else if (response.getException()?.getErrorMessage() != 'Canceled') {
      return await getErrorMessage(
        response.getException()?.getErrorMessage() ?? '',
      );
    }
  }

  Future<ResponseHandler<AssemblyDisctriptionResponse>>
      _fetchDiscription() async {
    AssemblyDisctriptionResponse response;
    try {
      response = await apiClient.getDiscription("ru", '');
    } catch (error, stacktrace) {
      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  // Future<ResponseHandler<CategoryResponse?>>
  //     _fetchCategoryWithProducts() async {
  //   CategoryResponse response;
  //   try {
  //     response = await apiClient!.getCategoryWithProduct("100", "ru");
  //   } catch (error, stacktrace) {
  //     debugPrint("Exception occurred: $error stacktrace: $stacktrace");
  //     return ResponseHandler()
  //       ..setException(ServerError.withError(error: error as DioError));
  //   }
  //   return ResponseHandler()..data = response;
  // }

  // Future<dynamic> getCategoryWithProducts() async {
  //   final response = await _fetchCategoryWithProducts();
  //   if (response.data != null) {
  //     return response.data;
  //   } else if (response.getException()?.getErrorMessage() != "Canceled") {
  //     return await getErrorMessage(
  //       response.getException()?.getErrorMessage() ?? '',
  //     );
  //   }
  // }
  Future<ResponseHandler<AssemblyBannersResponse>> _fetchAssemblyBannerResponse(
      {required String id}) async {
    AssemblyBannersResponse response;
    try {
      response = await apiClient.getProductImage(id);
      print('TRY Response from api client $response');
    } catch (error, stacktrace) {
      print('Catch error Response from api client $error');

      debugPrint("Exception occurred: $error stacktrace: $stacktrace");
      return ResponseHandler()
        ..setException(ServerError.withError(error: error as DioError));
    }
    return ResponseHandler()..data = response;
  }

  Future<dynamic> getProductImageFunc({required String id}) async {
    final response = await _fetchAssemblyBannerResponse(id: id);
    print('home repositorydan id qaytaramiz $id');
    if (response.data != null) {
      print('Home repositoryda respose qiymati: ${response.data}');
      return response.data;
    } else if (response.getException()?.getErrorMessage() != 'Canceled') {
      print(
          'home repositoryda else if ga kirib ketti ${response.getException()?.getErrorMessage()}');
      return await getErrorMessage(
          response.getException()?.getErrorMessage() ?? '');
    }
  }
}
