import 'package:dio/dio.dart';
import 'package:malispos/app/data/model/product_model.dart';
import 'package:malispos/app/data/remote/product_remote_api.dart';

import '../../network/dio_exceptions.dart';

class ProductRepository {
  final ProductRemoteApi productRemoteApi = ProductRemoteApi();

  Future<List<ProductModel>> productList() async {
    try {
      final response = await productRemoteApi.getProduct();
      final users = (response.data['products'] as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();
      return users;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
