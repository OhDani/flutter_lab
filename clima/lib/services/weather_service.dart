import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_data.dart';

class WeatherService {
  static const _apiKey = '77541d44d10cc590b35953e842456e27';
  static const _baseUrl = 'https://api.openweathermap.org/data/2.5/weather';

  Future<WeatherData> getWeather(String city) async {
    final response = await http.get(Uri.parse(
        '$_baseUrl?q=$city&appid=$_apiKey&units=metric'));

    if (response.statusCode != 200) {
      throw Exception(
          response.statusCode == 404 ? 'Không tìm thấy thành phố' : 'Lỗi HTTP ${response.statusCode}');
    }

    final data = jsonDecode(response.body);
    return WeatherData.fromJson(data);
  }
}
