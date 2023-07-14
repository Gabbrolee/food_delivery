import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:foodie_app/core/models/product.dart';
import 'package:foodie_app/core/constant/url_config.dart';

class ProductService {
  final dio = Dio(BaseOptions(baseUrl: UrlConfig.baseUrl));

  Future<List<Product>> getProducts([int limit = 10, int offset = 10]) async {
    Map<String, dynamic> queryParams = {"limit": limit, "offset": offset};
    final res = await dio.get(UrlConfig.products, queryParameters: queryParams);
    return List<Product>.from((res.data as List).map((e) {
      return Product.fromJson(e);
    }));
  }
}
