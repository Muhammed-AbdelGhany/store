import 'package:dio/dio.dart';
import 'package:shop_app/models/Items.dart';

class DioClient {
  final Dio _dio = Dio();

  final _baseUrl = 'https://fakestoreapi.com';

  Future<List<Items>> getItems() async {
    Response response = await _dio.get(_baseUrl + '/products');
    print(response.data);

    var userData = response.data as List;
    print('=============================');
    print(userData);

    var items = userData.map((i) => Items.fromJson(i)).toList();

    print('=============================');
    print(items[0].title);
    return items;
  }
}
