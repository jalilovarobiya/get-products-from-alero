import 'dart:convert';
import 'package:dars15/model/product_model.dart';
import 'package:http/http.dart' as http;

class Viewmodel {
  Future<ProductsModel?> getProducts() async {
    try {
      final uri = Uri.parse(
        "https://api.elaro.uz/api/categories/3?price_min=10000000&price_max=20000000&color=#050505",
      );
      final response = await http.get(uri);

      if (response.statusCode == 200) {
        final decoded = jsonDecode(response.body);

        if (decoded is Map<String, dynamic> && decoded.containsKey('data')) {
          return ProductsModel.fromMap(decoded['data']);
        }
      }
    } catch (e) {
      print('Error: $e');
    }

    return null;
  }
}
