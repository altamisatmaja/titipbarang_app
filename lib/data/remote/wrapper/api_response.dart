import 'package:titipbarang_app/data/model/converter.dart';
import 'package:titipbarang_app/data/remote/wrapper/base_response.dart';
import 'package:titipbarang_app/model/product/product.dart';
import 'package:titipbarang_app/model/user/user.dart';
import 'package:titipbarang_app/utils/helper/parsing_helper.dart';

class ResponseObject<T> extends BaseResponse {
  ResponseObject({
    super.message,
    super.status,
    this.data,
  });

  final T? data;

  factory ResponseObject.fromJson(Map<String, dynamic> json) => ResponseObject(
        message: json['message'],
        status: json['status'],
        data: json['data'] == null ? null : Converter<T>().fromJson(json['data']),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'status': status,
        'data': data == null ? null : Converter<T>().toJson(data as T),
      };
}

class ResponseList<T> extends BaseResponse {
  ResponseList({
    super.message,
    super.status,
    this.data,
    this.total,
    this.skip,
    this.limit,
  });

  final List<T>? data;
  int? total;
  int? skip;
  int? limit;

  factory ResponseList.fromJson(Map<String, dynamic> json) => ResponseList(
        message: json['message'],
        status: json['status'],
        data: json['data'] == null ? [] : List<T>.from(json['data'].map((x) => Converter<T>().fromJson(x))),
        total: ParsingHelper.parseInt(json['total']),
        skip: ParsingHelper.parseInt(json['skip']),
        limit: ParsingHelper.parseInt(json['limit']),
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'status': status,
        'data': data?.map(Converter<T>().toJson).toList(),
        'total': total,
        'skip': skip,
        'limit': limit,
      };
}

class ResponseSignIn extends BaseResponse {
  ResponseSignIn({
    super.message,
    super.status,
    this.user,
    this.accessToken,
    this.refreshToken,
  });

  final User? user;
  final String? accessToken;
  final String? refreshToken;

  factory ResponseSignIn.fromJson(Map<String, dynamic> json) => ResponseSignIn(
        message: json['message'],
        status: json['status'],
        user: User.fromJson(json),
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
      );

  Map<String, dynamic> toJson() => {
        'message': message,
        'status': status,
        ...user?.toJson() ?? {},
        'accessToken': accessToken,
        'refreshToken': refreshToken,
      };
}

class ResponseProducts extends ResponseList<Product> {
  ResponseProducts({
    super.message,
    super.status,
    super.data,
    super.total,
    super.skip,
    super.limit,
  });

  factory ResponseProducts.fromJson(Map<String, dynamic> json) => ResponseProducts(
        message: json['message'],
        status: json['status'],
        data: json['products'] == null ? [] : List<Product>.from(json['products'].map((x) => const Converter<Product>().fromJson(x))),
        total: ParsingHelper.parseInt(json['total']),
        skip: ParsingHelper.parseInt(json['skip']),
        limit: ParsingHelper.parseInt(json['limit']),
      );
}
