import 'package:chuck_interceptor/chuck_interceptor.dart';
import 'package:dio_retry_plus/dio_retry_plus.dart';
import 'package:get/get.dart';
import 'package:sample_app_getx/core/constants/constants.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:sample_app_getx/data/data_source/local_source.dart';
import 'package:sample_app_getx/data/models/assembly/assembly_banner_response.dart';
import 'package:sample_app_getx/data/models/auth/login_model.dart';
import 'package:sample_app_getx/data/models/banners/banners_response.dart';
import 'package:sample_app_getx/data/models/categories/category_response.dart';
import 'package:sample_app_getx/data/models/code_generate/code_generate_request.dart';
import 'package:sample_app_getx/data/models/code_generate/code_generate_response.dart';
import 'package:sample_app_getx/data/models/passcode_confirm/passcode_confirm_request.dart';
import 'package:sample_app_getx/data/models/passcode_confirm/passcode_confirm_response.dart';
import 'package:sample_app_getx/data/models/products/products_response.dart';
import 'package:sample_app_getx/data/models/register/register_request.dart';
import 'package:sample_app_getx/data/models/register/register_response.dart';
import 'package:sample_app_getx/data/models/search/products_search_response.dart';

import 'package:sample_app_getx/data/models/userme/userme_response.dart';
import 'package:sample_app_getx/routes/app_routes.dart';

import '../models/assembly/disctriptions_response.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class ApiClient {
  static Alice alice = Alice(
    navigatorKey: Constants.navigatorKey,
    showNotification: true,
    showInspectorOnShake: false,
    darkTheme: false,
  );

  static get getDio {
    Dio dio = Dio(BaseOptions(followRedirects: false));

    ///Alice chuck interceptor
    dio.interceptors.add(alice.getDioInterceptor());

    /// Tries the last error request again.
    dio.interceptors.add(
      RetryInterceptor(
        dio: dio,
        toNoInternetPageNavigator: () async =>
            await Get.toNamed(Routes.internetConnection),
        accessTokenGetter: () => LocalSource.getInstance().getAccessToken(),
        // refreshTokenFunction: BaseFunctions.refreshToken,
      ),
    );
    dio.interceptors.add(
      LogInterceptor(
        responseBody: true,
        requestBody: true,
        request: true,
      ),
    );
    return dio;
  }

  static CancelToken cancelToken = CancelToken();

  static ApiClient? _apiClient;
  static ApiClient? _apiClientAuth;

  static ApiClient getInstance({String baseUrl = Constants.baseUrl}) {
    if (_apiClient != null) {
      return _apiClient!;
    } else {
      _apiClient = ApiClient(getDio, cancelToken, baseUrl);
      return _apiClient!;
    }
  }

  static ApiClient getInstanceAuth({String baseUrl = Constants.authUrl}) {
    if (_apiClientAuth != null) {
      return _apiClientAuth!;
    } else {
      _apiClientAuth = ApiClient(getDio, cancelToken, baseUrl);
      return _apiClientAuth!;
    }
  }

  factory ApiClient(Dio dio, CancelToken cancelToken, String baseUrl) {
    dio.options = BaseOptions(receiveTimeout: 30000, connectTimeout: 30000);
    return _ApiClient(dio, baseUrl: baseUrl);
  }

  /// Get banner list
  @GET('banner')
  Future<BannersResponse> getBanners(
    @Query('limit') int limit,
  );
  //Featured List
  @GET('featured-list/rasprodazha')
  Future<ProductsResponse> getFProducts();

  /// Category
  @GET('category')
  Future<CategoryResponse> getCategoryWithProduct(
    @Query('limit') String limit,
    @Query('lang') String lang,
  );

  /// Search
  @GET('product')
  Future<ProductsResponsee> getProductSearch(@Query('search') String search);

  /// Auth
  @POST('user/exists')
  Future<AuthResponse> postPhoneNumber(@Body() AuthRequest request);

  /// Auth
  @POST('user/exists')
  Future<AuthResponse> postPhoneNumber2(@Body() AuthRequest2 request);

  /// Auth
  @POST('auth/passcode/generate')
  Future<GenerateResponse> passCodeGenerate(
    @Body() GenerateRequest username,
    @Header("platform-id") platformId,
  );

  /// Auth
  @POST('auth/passcode/confirm')
  Future<PasscodeConfirmResponse> passCodeConfirm(
    @Body() PasscodeConfirmRequest passcode,
    @Header("platform-id") platformId,
  );

  ///Auth
  @POST('auth/user/register')
  Future<RegistrResponse> userregister(
    @Body() RegistrRequest clientTypeId,
  );

  @GET('user/me')
  Future<UserMeResponse> userMe(
    @Header('Authorization') authorization,
    @Header('platform-id') platformId,
  );

  // ?!
  @GET('product/{product_id}/related-products')
  Future<AssemblyDisctriptionResponse> getDiscription(
      @Query('lang') String lang, @Path('product_id') String productId);
  // ?!
  @GET('product/{id}')
  Future<AssemblyBannersResponse> getProductImage(@Path('id') String id);
}
///will pops

