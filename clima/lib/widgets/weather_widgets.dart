import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeatherDetailItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const WeatherDetailItem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.blue),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(value),
            ],
          ),
        ],
      ),
    );
  }
}

class WeatherIcon extends StatelessWidget {
  final String iconCode;
  final int weatherId;
  final int dt;
  final int sunrise;
  final int sunset;
  final double size;

  const WeatherIcon({
    super.key,
    required this.iconCode,
    required this.weatherId,
    required this.dt,
    required this.sunrise,
    required this.sunset,
    this.size = 64,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDay = dt > sunrise && dt < sunset;
    final iconPrefix = iconCode.substring(0, 2);

    IconData icon;

    switch (iconPrefix) {
      case '01':
        icon = isDay ? FontAwesomeIcons.sun : FontAwesomeIcons.moon;
        break;
      case '02':
        icon = isDay ? FontAwesomeIcons.cloudSun : FontAwesomeIcons.cloudMoon;
        break;
      case '03':
      case '04':
        icon = FontAwesomeIcons.cloud;
        break;
      case '09':
        icon = FontAwesomeIcons.cloudRain;
        break;
      case '10':
        icon = isDay ? FontAwesomeIcons.cloudSunRain : FontAwesomeIcons.cloudMoonRain;
        break;
      case '11':
        icon = FontAwesomeIcons.bolt;
        break;
      case '13':
        icon = FontAwesomeIcons.snowflake;
        break;
      case '50':
        icon = FontAwesomeIcons.smog;
        break;
      default:
        icon = FontAwesomeIcons.sun;
    }

    return FaIcon(icon, size: size, color: Colors.blue);
  }
}

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      margin: const EdgeInsets.only(top: 16),
      decoration: BoxDecoration(
        color: Colors.red.withOpacity(0.3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        message,
        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
  }
}
