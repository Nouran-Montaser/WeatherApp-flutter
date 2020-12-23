import 'dart:async';
import 'package:chopper/chopper.dart';
import 'package:connectivity/connectivity.dart';

class MobileDataInterceptor implements RequestInterceptor {
  @override
  FutureOr<Request> onRequest(Request request) async{
    final connectivityResult = await Connectivity().checkConnectivity();

    final isConnected = connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi;
    if (!isConnected) {
      throw NetworkException();
    }

    return request;
  }

}

class NetworkException implements Exception {
  final message = "please, check your internet connection";

  @override
  String toString() => message;
}