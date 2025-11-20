class WeatherData {
  final String name;
  final String country;
  final double temp;
  final double feelsLike;
  final int humidity;
  final int weatherId;
  final String description;
  final String icon;
  final double windSpeed;
  final int dt;
  final int sunrise;
  final int sunset;

  WeatherData({
    required this.name,
    required this.country,
    required this.temp,
    required this.feelsLike,
    required this.humidity,
    required this.weatherId,
    required this.description,
    required this.icon,
    required this.windSpeed,
    required this.dt,
    required this.sunrise,
    required this.sunset,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      name: json['name'],
      country: json['sys']['country'],
      temp: json['main']['temp'].toDouble(),
      feelsLike: json['main']['feels_like'].toDouble(),
      humidity: json['main']['humidity'],
      weatherId: json['weather'][0]['id'],
      description: json['weather'][0]['description'],
      icon: json['weather'][0]['icon'],
      windSpeed: json['wind']['speed'].toDouble(),
      dt: json['dt'],
      sunrise: json['sys']['sunrise'],
      sunset: json['sys']['sunset'],
    );
  }
}
