import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'model/weather_info.dart';
import 'main_widget.dart';

Future<WeatherInfo> fetchWeather() async {
  // const name = 'Kathmandu';
  // https://api.openweathermap.org/data/2.5/weather?q=Kathmandu&appid={{API key}}&units=metric
  // const apikey = '59b0df8092de4351ba78f5df7346b584';
  const requestUrl =
      'https://api.openweathermap.org/data/2.5/weather?q=kathmandu&appid=59b0df8092de4351ba78f5df7346b584&units=metric';

  final response = await http.get(
    Uri.parse(requestUrl),
  );
  if (response.statusCode == 200) {
    return WeatherInfo.fromJson(
      jsonDecode(response.body),
    );
  } else {
    throw Exception("Error Loading request URL info");
  }
}

void main() => runApp(
      const MaterialApp(
        title: "Weather App",
        home: MyApp(),
      ),
    );

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Future<WeatherInfo>? fetch;
  @override
  void initState() {
    super.initState();
    // Future.delayed(const Duration(milliseconds: 100), () {
    //   setState(() {
    //     futureWeather = fetchWeather();
    //   });
    // });
    fetch = fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<WeatherInfo>(
        future: fetch ?? fetchWeather(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MainWidget(
              location: snapshot.data!.location,
              temp: snapshot.data!.temp,
              tempMin: snapshot.data!.tempMin,
              tempMax: snapshot.data!.tempMax,
              weather: snapshot.data!.weather,
              humidity: snapshot.data!.humidity,
              windSpeed: snapshot.data!.windSpeed,
            );
          } else {
            return const CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
