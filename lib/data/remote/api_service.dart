import 'package:dio/dio.dart';
import 'package:titipbarang_app/data/local/secure/secure_storage_manager.dart';
import 'package:titipbarang_app/data/remote/dio.dart';
import 'package:titipbarang_app/data/remote/environments.dart';
import 'package:titipbarang_app/data/remote/wrapper/api_response.dart';
import 'package:titipbarang_app/data/remote/wrapper/base_response.dart';
import 'package:titipbarang_app/model/product/product.dart';
import 'package:titipbarang_app/utils/helper/connectivity_helper.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  static Future<ApiClient?> create({
    Map<String, dynamic> headers = const {},
    int connectTimeout = 30000,
    int receiveTimeout = 30000,
  }) async {
    if (!ConnectivityHelper.ensureOnlineConnection()) return null;

    final Map<String, dynamic> newHeaders = {};

    newHeaders.addAll(headers);

    String? token = await SecureStorageManager().getToken();

    if (token?.isNotEmpty ?? false) newHeaders.addAll({'Authorization': 'Bearer $token'});

    return ApiClient(
      await AppDio.getDio(
        headers: newHeaders,
        connectTimeout: connectTimeout,
        receiveTimeout: receiveTimeout,
      ),
      baseUrl: Environments.apiUrl,
    );
  }

  @POST('/auth/login')
  Future<ResponseSignIn> login({
    @Field() required String username,
    @Field() required String password,
    @Field() int? expiresInMins,
  });

  @GET('/auth/me')
  Future<ResponseSignIn> getMe();

  // If the sign out service is exists, call this on AuthController
  @POST('/auth/sign-out')
  Future<BaseResponse> signOut();

  @GET('/products')
  Future<ResponseProducts> getProducts({
    @Query('limit') int? limit,
    @Query('skip') int? skip,
    @CancelRequest() required CancelToken cancelToken,
  });

  @GET('/products/{id}')
  Future<Product> getSingleProduct({
    @Path() required int id,
    @CancelRequest() required CancelToken cancelToken,
  });

  @GET('/products/search')
  Future<ResponseProducts> getSearchProducts({
    @Query('q') required String q,
    @Query('limit') int? limit,
    @Query('skip') int? skip,
    @CancelRequest() required CancelToken cancelToken,
  });
}

const createApiClient = ApiClient.create;
