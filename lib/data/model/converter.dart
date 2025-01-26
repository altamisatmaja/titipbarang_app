import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:titipbarang_app/model/product/product.dart';
import 'package:titipbarang_app/model/user/user.dart';

bool typeEqual<S, T>() => S == T;

bool typeEqualn<S, T>() => typeEqual<S, T>() || typeEqual<S?, T?>();

class Converter<T> implements JsonConverter<T, Object> {
  const Converter();

  @override
  T fromJson(Object json) {
    json = json as Map<String, dynamic>;

    if (typeEqualn<T, User>()) {
      return User.fromJson(json) as T;
    } else if (typeEqualn<T, Product>()) {
      return Product.fromJson(json) as T;
    }
    throw UnimplementedError('`$T` fromJson factory unimplemented');
  }

  @override
  Object toJson(T object) {
    if (typeEqualn<T, User>()) {
      return (object as User).toJson();
    } else if (typeEqualn<T, Product>()) {
      return (object as Product).toJson();
    }
    throw UnimplementedError('`$T` toJson factory unimplemented');
  }
}
