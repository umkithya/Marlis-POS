import 'package:dio/dio.dart';
import 'package:malispos/app/network/dio_helper.dart';

import '../../network/end_point.dart';

class ProductRemoteApi {
  final DioHelper dioHelper = DioHelper(Dio());

  // ProductRemoteApi({required this.dioHelper});
  Future<Response> getProduct() async {
    try {
      final Response response = await dioHelper.onNetworkRequest(
        Endpoints.products,
        methode: METHODE.get,
        // isDebugOn: true,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
