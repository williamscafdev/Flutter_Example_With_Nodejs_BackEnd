// or new Dio with a BaseOptions instance.
import 'package:dio/dio.dart';

BaseOptions options = new BaseOptions(
  baseUrl: "http://192.168.13.2:3000/Api/v1",
  connectTimeout: 5000,
  receiveTimeout: 3000,
);
Dio dio = new Dio(options);
