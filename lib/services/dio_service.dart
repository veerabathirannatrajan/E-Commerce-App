// api_service.dart
import 'package:dio/dio.dart';
import 'package:e_com/services/convert_2_data.dart';

class ApiService {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://e-commerce-app-backend-6mvs.onrender.com/',
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    ),
  );
  static Future<List<Product>> fetchProducts() async {
    try {
      final response = await dio.get('/products');
      List data = response.data;
      return data.map((e) => Product.fromJson(e)).toList();
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception('Connection timeout. Try again.');
      } else if (e.type == DioExceptionType.connectionError) {
        throw Exception('No internet connection.');
      } else {
        throw Exception('Failed to load products.');
      }
    }
  }


  static Future<Product> addProduct(Product product) async {
    final response = await dio.post(
      '/products',
      data: {
        'brand': product.brand,
        'name': product.name,
        'price': product.price,
        'offer': product.offer,
        'rating': product.rating,
        'images': product.images,
      },
    );

    return Product.fromJson(response.data);
  }

  static Future<Product> updateProduct(String id, Map<String, dynamic> data) async {
    final response = await dio.put('/products/$id', data: data);
    return Product.fromJson(response.data);
  }

  static Future<void> deleteProduct(String id) async {
    await dio.delete('/products/$id');
  }
}
