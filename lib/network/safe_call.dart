import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:route_e_commerce_v2/network/results.dart';

Future<Results<T>> safeCall<T>(Future<Results<T>> Function() call) async {
  try {
    return call();
  } on SocketException catch (e, stackTrace) {
    return Failure(e, stackTrace.toString());
  } on IOException catch (e, stackTrace) {
    return Failure(e, stackTrace.toString());
  } on TimeoutException catch (e, stackTrace) {
    return Failure(e, stackTrace.toString());
  } on FormatException catch (e, stackTrace) {
    return Failure(e, stackTrace.toString());
  } on DioException catch (e, stackTrace) {
    return Failure(e, stackTrace.toString());
  } catch (e, stackTrace) {
    return Failure(e as Exception, stackTrace.toString());
  }
}
