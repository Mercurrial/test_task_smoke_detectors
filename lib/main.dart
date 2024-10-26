import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Detector {
  final int sensorId;
  final String name;
  final int status;
  final int temperature;
  final int humidity;

  const Detector({
    required this.sensorId,
    required this.name,
    required this.status,
    required this.temperature,
    required this.humidity,
  });

  factory Detector.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
      'sensor_id': int sensorId,
      'name': String name,
      'status': int status,
      'temperature': int temperature,
      'humidity': int humidity,
      } =>
          Detector(
            sensorId: sensorId,
            name: name,
            status: status,
            temperature: temperature,
            humidity: humidity,
          ),
      _ => throw const FormatException('Failed to load.'),
    };
  }
}

Future<Detector> fetchDetector() async {
  final response = await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
  if (response.statusCode == 200) {
    return Detector.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load');
  }
}

void main() {
  runApp(
    MaterialApp(home: Home()),
  );
}

class Home extends StatelessWidget {
  Home({super.key});

  late Future<Detector> futureDetector;

  @override
  Widget build(context) {
    futureDetector = fetchDetector();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мои датчики'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: const Color.fromRGBO(255,188,108, 1.0),
      ),
      body: Center(
        child: FutureBuilder<Detector>(
          future: futureDetector,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.name);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}

/*child: Container(
decoration: const BoxDecoration(
gradient: LinearGradient(
begin: Alignment.topCenter,
end: Alignment.bottomCenter,
stops: [
0.0,
0.5,
],
colors: [
Color.fromRGBO(255,188,108, 1.0),
Colors.black87,
],
),
),
),*/
