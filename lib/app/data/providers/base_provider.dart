// ignore_for_file: non_constant_identifier_names

import 'dart:developer';

import 'package:lilanhdo_workflows/app/services/globals.dart' as globals;
import 'package:get/get.dart';
import 'package:lilanhdo_workflows/app/data/providers/api_result.dart';
import 'package:logger/logger.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class BaseProvider extends GetConnect {
  void initProvider() {
    httpClient.baseUrl = dotenv.env['BASE_API'];
  }

  Future<ApiResult> GET(String url) async {
    log('============================================================');
    log('[GET] ${httpClient.baseUrl!}$url');
    log("Bearer ${globals.accessToken}");
    try {
      final res = await get(url, headers: {'Authorization': 'Bearer ${globals.accessToken}'});
      httpClient.timeout = const Duration(seconds: 30);
      if (res.isOk && res.body != null) {
        var result = res.body;
        Logger().d(result);
        return ApiResult<dynamic>(
          error: buildErrorMessage(result['error']),
          data: result,
        );
      } else {
        log('Error ${res.status.code} - ${res.statusText}');
        return ApiResult<dynamic>(
          error: res.statusText ?? '',
        );
      }
    } on Exception catch (exception) {
      log('[EXCEPTION] $exception');
      log('============================================================');
      return ApiResult<dynamic>(
        error: exception.toString(),
      );
    } catch (error) {
      log('[ERROR] $error');
      log('============================================================');
      log(error.toString());
      return ApiResult<dynamic>(
        error: error.toString(),
      );
    }
  }

  Future<ApiResult> PATCH(String url, dynamic body) async {
    log('============================================================');
    log('[PATCH] ${httpClient.baseUrl!}$url');
    log('[PARAMS] $body');
    try {
      final res = await patch(url, body, headers: {'Authorization': 'Bearer ${globals.accessToken}'});
      httpClient.timeout = const Duration(seconds: 30);
      if (res.isOk && res.body != null) {
        var result = res.body;
        Logger().d(result);
        return ApiResult<dynamic>(
          error: buildErrorMessage(result['error']),
          data: result,
        );
      } else {
        log('Error ${res.status.code} - ${res.statusText}');
        return ApiResult<dynamic>(
          error: res.body?["error"] != null ? buildErrorMessage(res.body?["error"]) : res.statusText ?? '',
        );
      }
    } on Exception catch (exception) {
      log('[EXCEPTION] $exception');
      log('============================================================');
      return ApiResult<dynamic>(
        error: exception.toString(),
      );
    } catch (error) {
      log('[ERROR] $error');
      log('============================================================');
      return ApiResult<dynamic>(
        error: error.toString(),
      );
    }
  }

  Future<ApiResult> POST(String url, dynamic body) async {
    log('============================================================');
    log('[POST] ${httpClient.baseUrl!}$url');
    log('[PARAMS] $body');
    log(globals.accessToken);
    try {
      final res = await post(url, body, headers: {'Authorization': 'Bearer ${globals.accessToken}'});
      httpClient.timeout = const Duration(seconds: 30);
      if (res.isOk && res.body != null) {
        var result = res.body;
        Logger().d(result);
        return ApiResult<dynamic>(
          error: buildErrorMessage(result['error']),
          data: result,
        );
      } else {
        log('Error ${res.status.code} - ${res.statusText}');
        var result = res.body;
        return ApiResult<dynamic>(
          error: result["error"] != null ? buildErrorMessage(result["error"]) : res.statusText ?? '',
          data: result,
        );
      }
    } on Exception catch (exception) {
      log('[EXCEPTION] $exception');
      log('============================================================');
      return ApiResult<dynamic>(
        error: exception.toString(),
      );
    } catch (error) {
      log('[ERROR] $error');
      log('============================================================');
      return ApiResult<dynamic>(
        error: error.toString(),
      );
    }
  }

  Future<ApiResult> PUT(String url, dynamic body) async {
    log('============================================================');
    log('[PUT] ${httpClient.baseUrl!}$url');
    log('[PARAMS] $body');
    try {
      final res = await put(url, body, headers: {'Authorization': 'Bearer ${globals.accessToken}'});
      httpClient.timeout = const Duration(seconds: 30);
      if (res.isOk && res.body != null) {
        var result = res.body;
        Logger().d(result);
        return ApiResult<dynamic>(
          error: buildErrorMessage(result['error']),
          data: result,
        );
      } else {
        log('Error ${res.status.code} - ${res.statusText}');
        return ApiResult<dynamic>(
          error: res.body?["error"] != null ? buildErrorMessage(res.body?["error"]) : res.statusText ?? '',
        );
      }
    } on Exception catch (exception) {
      log('[EXCEPTION] $exception');
      log('============================================================');
      return ApiResult<dynamic>(
        error: exception.toString(),
      );
    } catch (error) {
      log('[ERROR] $error');
      log('============================================================');
      return ApiResult<dynamic>(
        error: error.toString(),
      );
    }
  }

  Future<ApiResult> DELETE(String url) async {
    log('============================================================');
    log('[DELETE] ${httpClient.baseUrl!}$url');
    try {
      final res = await delete(url, headers: {'Authorization': 'Bearer ${globals.accessToken}'});
      httpClient.timeout = const Duration(seconds: 30);
      if (res.isOk && res.body != null) {
        var result = res.body;
        Logger().d(result);
        return ApiResult<dynamic>(
          error: buildErrorMessage(result['error']),
          data: result,
        );
      } else {
        log('Error ${res.status.code} - ${res.statusText}');
        return ApiResult<dynamic>(
          error: res.statusText ?? '',
        );
      }
    } on Exception catch (exception) {
      log('[EXCEPTION] $exception');
      log('============================================================');
      return ApiResult<dynamic>(
        error: exception.toString(),
      );
    } catch (error) {
      log('[ERROR] $error');
      log('============================================================');
      return ApiResult<dynamic>(
        error: error.toString(),
      );
    }
  }

  String buildErrorMessage(dynamic error) {
    String errorMessage = "";
    if (error != null) {
      if (error.runtimeType == String) {
        errorMessage = error;
      } else if (error["messages"] != null) {
        error["messages"].forEach((k, v) {
          var msg = "";
          // if (v.runtimeType == List) {
          msg = v.join(" ");
          // } else {
          //   msg = v.toString();
          // }
          errorMessage += "$msg ";
        });
      } else {
        errorMessage = "Có lỗi xảy ra, vui lòng thử lại sau!";
      }
    }
    if (error.runtimeType == String) {
      errorMessage = error;
    }
    return errorMessage;
  }
}
