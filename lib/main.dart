import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'example_data.dart';
import 'detector.dart';

/*Future<Detector> fetchDetector() async {
  final response = await http
      .get(Uri.parse(''));
  if (response.statusCode == 200) {
    return Detector.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load');
  }
}*/

List<Detector> decode() {
  final json = jsonDecode(jsonString) as List<dynamic>;
  final detectors = json.map((dynamic e) => Detector.fromJson(e as Map<String, dynamic>)).toList();
  return detectors;
}

void main() {
  runApp(
    MaterialApp(home: Home()),
  );
}

const double textSize = 28;

class Home extends StatelessWidget {
  Home({super.key});

  late Future<Detector> futureDetector;

  @override
  Widget build(context) {
    List<Detector> detectors = decode();

    for(Detector e in detectors){
      if(e.name == "" || e.name == "N/A") {
        e.name = "Датчик";
      }
    }

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Мои датчики'),
        titleTextStyle: const TextStyle(
          color: Colors.white,
          fontSize: 32,
          fontWeight: FontWeight.bold,
        ),
        backgroundColor: const Color.fromRGBO(255, 188, 108, 1.0),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: detectors.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  color: Colors.black54,
                  border: Border.all(width: 5, color: Color.fromRGBO(255, 188, 108, 1.0)),
                ),
                padding: const EdgeInsets.fromLTRB(5, 10, 5, 20),
                margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(detectors[index].name, style: const TextStyle(fontSize: textSize, color: Colors.white)),
                    Text("${detectors[index].status}", style: const TextStyle(fontSize: textSize, color: Colors.white)),
                  ],
                ),
            );
          }
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
