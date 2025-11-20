import 'package:flutter/material.dart';
import '../models/weather_data.dart';
import '../services/weather_service.dart';
import '../widgets/weather_widgets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController _controller = TextEditingController();
  final WeatherService _service = WeatherService();

  WeatherData? _weather;
  bool _loading = true;
  String? _error;
  String _city = 'Hanoi';

  @override
  void initState() {
    super.initState();
    _fetchWeather(_city);
  }

  Future<void> _fetchWeather(String city) async {
    setState(() {
      _loading = true;
      _error = null;
    });

    try {
      final data = await _service.getWeather(city);
      setState(() {
        _weather = data;
        _loading = false;
        _city = city;
      });
    } catch (e) {
      setState(() {
        _error = e.toString().replaceAll('Exception: ', '');
        _loading = false;
      });
    }
  }

  void _search() {
    final query = _controller.text.trim();
    if (query.isNotEmpty) {
      _fetchWeather(query);
      _controller.clear();
    } else {
      setState(() => _error = 'Vui lòng nhập tên thành phố.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Weather App')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search bar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Nhập tên thành phố',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)),
                      prefixIcon: const Icon(Icons.search),
                    ),
                    onSubmitted: (_) => _search(),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(onPressed: _search, child: const Text('Tìm'))
              ],
            ),
            const SizedBox(height: 20),

            // Loading indicator
            if (_loading) const CircularProgressIndicator(),

            // Error message
            if (_error != null && !_loading) ErrorMessage(message: _error!),

            // Weather display
            if (_weather != null && !_loading && _error == null)
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${_weather!.name}, ${_weather!.country}',
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    WeatherIcon(
                      iconCode: _weather!.icon,
                      weatherId: _weather!.weatherId,
                      dt: _weather!.dt,
                      sunrise: _weather!.sunrise,
                      sunset: _weather!.sunset,
                      size: 80,
                    ),
                    const SizedBox(height: 10),
                    Text('${_weather!.temp.round()}°C',
                        style: const TextStyle(
                            fontSize: 48, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(_weather!.description,
                        style: const TextStyle(fontSize: 18)),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        WeatherDetailItem(
                          icon: Icons.opacity,
                          label: 'Độ ẩm',
                          value: '${_weather!.humidity}%',
                        ),
                        WeatherDetailItem(
                          icon: Icons.air,
                          label: 'Gió',
                          value: '${_weather!.windSpeed} m/s',
                        ),
                      ],
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }
}
