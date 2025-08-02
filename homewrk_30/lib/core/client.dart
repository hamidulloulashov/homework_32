import 'package:dio/dio.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: "http://10.10.1.41:8888/api/v1",
    validateStatus: (status) => true,
  ),
);
