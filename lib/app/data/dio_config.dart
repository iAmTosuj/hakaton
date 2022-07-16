import 'package:dio/dio.dart';

class BaseNetwork {
  static Dio client = Dio(BaseOptions(
      baseUrl: 'http://10.0.0.20/api', headers: {'X-Username': '79876543210'}));
}
