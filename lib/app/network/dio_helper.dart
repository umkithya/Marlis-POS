import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';

import 'end_point.dart';

/// Is a class for help _dio development better and more easy.
/// ```dart
/// final dioBaseHelper = DioBaseHelper("www.api.com");
/// ```
class DioHelper {
  /// [_baseUrl]. is a parameter for input the base api url.
  /// ```dart
  /// final dioBaseHelper = DioBaseHelper("www.api.com");
  /// ```
  final Dio _dio;

  DioHelper(this._dio) {
    _dio
      ..options.baseUrl = Endpoints.baseUrl
      ..options.connectTimeout =
          const Duration(milliseconds: Endpoints.connectionTimeout)
      ..options.receiveTimeout =
          const Duration(milliseconds: Endpoints.receiveTimeout)
      ..options.responseType = ResponseType.json;
  }
  // final String _baseUrl = Endpoints.baseUrl;
  // String? _token;
  // String? _session;
  // DioBaseHelper(String baseUrl, {String? token, String? session}) {
  //   _baseUrl = baseUrl;
  //   _token = token;
  //   _session = session;

  //   log('Constructor Initialized');
  // }

  Future<Response> onNetworkRequest(
    String endPoint, {
    required METHODE? methode,
    Map<dynamic, dynamic>? body,
    Map<String, dynamic>? queryParameters,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
    bool? isAuthorize = false,
    bool isDebugOn = false,
    bool showBodyInput = false,
  }) async {
    if (methode != METHODE.get && body == null) {
      throw Exception('Body must not be null of $methode');
      // log('Error=======');
    }
    const token = "Bearer TOKENENENNENEN";

    Map<String, String> header = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': isAuthorize! ? token : ""
    };
    _dio.options.headers = header;
    if (isDebugOn) {
      log('token===$token');
    }

    if (showBodyInput) {
      log('BodyInputDebug:${json.encode(body)}');
    }
    try {
      // var _dio = Dio();
      // var fullUrl = "$_baseUrl$endPoint";
      late Response response;
      switch (methode) {
        case METHODE.get:
          {
            response = await _dio.get(
              endPoint,
              queryParameters: queryParameters,
              onReceiveProgress: onReceiveProgress,
            );
            break;
          }
        case METHODE.post:
          {
            response = await _dio.post(
              endPoint,
              data: json.encode(body),
              queryParameters: queryParameters,
              onReceiveProgress: onReceiveProgress,
              onSendProgress: onSendProgress,
            );
            break;
          }
        case METHODE.put:
          {
            response = await _dio.put(
              endPoint,
              data: json.encode(body),
              queryParameters: queryParameters,
              onReceiveProgress: onReceiveProgress,
              onSendProgress: onSendProgress,
            );
            break;
          }
        case METHODE.delete:
          {
            response = await _dio.delete(
              endPoint,
              data: json.encode(body),
              queryParameters: queryParameters,
            );
            break;
          }
        default:
          break;
      }
      if (isDebugOn) {
        log("200=====$response");
      }
      return response;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  // Future<dynamic> onRequestFormData({
  //   /// A file to be uploaded as part of a [MultipartRequest]. This doesn't need to
  //   /// correspond to a physical file.
  //   ///
  //   /// MultipartFile is based on stream, and a stream can be read only once,
  //   /// so the same MultipartFile can't be read multiple times.
  //   String? endPoint,
  //   required Map<String, dynamic> formData,
  //   bool? isAuthorize = false,
  //   bool isDebugOn = false,
  //   bool showBodyInput = false,
  // }) async {
  //   if (isDebugOn) {
  //     log('Token:$_token');
  //   }
  //   Map<String, String> header = {
  //     'Content-Type': 'application/json',
  //     'Authorization': isAuthorize!
  //         ? _token != ''
  //             ? '$_token'
  //             : '$_session'
  //         : ""
  //   };

  //   try {
  //     var dio = Dio();
  //     var fullUrl = _baseUrl + endPoint.toString();
  //     if (isDebugOn) {
  //       log('FullUrl:$fullUrl');
  //     }

  //     var data = FormData.fromMap(formData);
  //     if (showBodyInput) {
  //       log('BodyInputDebug:${data.files}');
  //     }
  //     Response response = await dio.post(fullUrl,
  //         data: data,
  //         options: Options(
  //           headers: header,
  //         ));

  //     var lastResponse = await _returnResponse(response);
  //     if (isDebugOn) {
  //       log("200=====${lastResponse.toString()}");
  //     }
  //     return lastResponse;
  //   } on DioError catch (e) {
  //     if (isDebugOn) {
  //       log('DioError:${e.message}');
  //       log('DioError:${e.error}');
  //       log('DioError:${e.stackTrace}');
  //       log('DioError:${e.response}');
  //       log('DioError:${e.type}');
  //     }
  //     if (e.response != null) {
  //       return await _returnResponse(e.response!);
  //     }
  //   }
  // }

  dynamic _returnResponse(Response response) async {
    switch (response.statusCode) {
      case 200:
        return response.data;
      case 201:
        return response.data;
      case 202:
        return response.data;
      case 302:
        return response.data;
      case 400:
        return Future.error(ErrorModel(
            statusCode: response.statusCode, bodyString: response.data));
      case 401:
        return Future.error(ErrorModel(
            statusCode: response.statusCode, bodyString: response.data));
      case 404:
        return Future.error(ErrorModel(
            statusCode: response.statusCode, bodyString: response.data));
      case 403:
        return Future.error(ErrorModel(
            statusCode: response.statusCode, bodyString: response.data));
      case 500:
        return Future.error(ErrorModel(
            statusCode: response.statusCode, bodyString: response.data));

      default:
        return Future.error(ErrorModel(
            statusCode: response.statusCode,
            bodyString: response.data ?? 'Error'));
    }
  }
}

class ErrorModel {
  final int? statusCode;
  final dynamic bodyString;
  final String? message;
  const ErrorModel({
    this.statusCode,
    this.bodyString,
    this.message,
  });
}

enum METHODE {
  get,
  post,
  delete,
  put,
}
