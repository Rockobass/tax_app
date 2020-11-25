import 'package:dio/dio.dart';
import 'package:flutter_app/model/tax_code.dart';

class Service{
  static const String BASE_URL = "http://192.168.123.130:8080";
//  static const String BASE_URL = "http://192.168.43.82:8080";
//  static const String BASE_URL = "http://192.168.43.82:8080";
  static Future<TaxCode> getTaxCode(String goods) async {
    Dio dio = Dio();
    Response response = await dio.get("$BASE_URL/taxcode/?name=$goods");
    TaxCode taxCode = new TaxCode();
    if(response.data == null)
      return Future.error('获取数据失败');
    taxCode = TaxCode.fromJson(response.data);
    return taxCode;
  }

  static Future<TaxCode> postTaxCode(String goods) async {
    Dio dio = Dio();
    print("开始获取数据");
    Map<String, dynamic> map = Map();
    map["name"] = goods;
    Response response = await dio.post("$BASE_URL/taxcode/", queryParameters: map);
    if(response.data == null)
      return Future.error('获取数据失败');
    print(response.data);
    TaxCode taxCode = TaxCode.fromJson(response.data);
    return taxCode;
  }
}