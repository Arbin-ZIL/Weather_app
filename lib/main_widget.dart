import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainWidget extends StatelessWidget {
  final String location;
  final double temp;
  final double tempMin;
  final double tempMax;
  final String weather;
  final int humidity;
  final double windSpeed;

  const MainWidget({
    required this.location,
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.weather,
    required this.humidity,
    required this.windSpeed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.amber,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text(
              'Weather App',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            location.toString(),
            style: const TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            '${temp.toInt()}\u00B0',
            style: const TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 25,
          ),
          Text(
            'High of ${tempMax.toInt().toString()}, low of ${tempMin.toInt().toString()}',
            style: const TextStyle(
                fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 400.0),
            child: ListTile(
              leading: const FaIcon(FontAwesomeIcons.thermometerHalf,
                  color: Colors.purple),
              title: const Text(
                'Temperature',
                style: TextStyle(color: Colors.white),
              ),
              subtitle: Text(
                '${temp.toInt().toString()}+\u00B0',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 400.0),
            child: ListTile(
              leading:
                  const FaIcon(FontAwesomeIcons.cloud, color: Colors.purple),
              title: const Text('Weather'),
              subtitle: Text(weather.toString()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 400.0),
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.sun, color: Colors.purple),
              title: const Text('Humidity'),
              subtitle: Text(humidity.toString()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 400.0),
            child: ListTile(
              leading: const Icon(FontAwesomeIcons.wind, color: Colors.purple),
              title: const Text('Wind Speed'),
              subtitle: Text(
                '${windSpeed.toInt().toString()}MPH',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
