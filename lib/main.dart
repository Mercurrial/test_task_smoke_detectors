import 'dart:convert';

import 'package:flutter/material.dart';
import 'example_data.dart';
import 'detector.dart';
import 'dialog_full_information.dart';

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
  final detectors = json
      .map((dynamic e) => Detector.fromJson(e as Map<String, dynamic>))
      .toList();
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

  @override
  Widget build(context) {
    List<Detector> detectors = decode();

    for (Detector e in detectors) {
      if (e.name == "" || e.name == "N/A") {
        e.name = "Датчик";
      }
      e.temperature ??= 'N/A';
      e.humidity ??= 'N/A';
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
            String text;
            AssetImage imageTmp;
            Color colorTmp;

            switch (detectors[index].status) {
              case (0):
                text = 'Неизвестно';
                imageTmp = const AssetImage('assets/images/alert.png');
                colorTmp = Colors.grey;
              case (1):
                text = 'Готов';
                imageTmp = const AssetImage('assets/images/accept.png');
                colorTmp = Colors.green;
              case (2):
                text = 'Тревога';
                imageTmp = const AssetImage('assets/images/exclamation.png');
                colorTmp = Colors.red;
              case (3):
                text = 'Пожар';
                imageTmp = const AssetImage('assets/images/exclamation.png');
                colorTmp = Colors.red;
              case (4):
                text = 'Корпус открыт';
                imageTmp = const AssetImage('assets/images/warning.png');
                colorTmp = Colors.yellowAccent;
              case (5):
                text = 'Корпус закрыт';
                imageTmp = const AssetImage('assets/images/accept.png');
                colorTmp = Colors.green;
              case (6):
                text = 'Потерян';
                imageTmp = const AssetImage('assets/images/alert.png');
                colorTmp = Colors.grey;
              case (7):
                text = 'Низкий заряд\nбатареи';
                imageTmp = const AssetImage('assets/images/warning.png');
                colorTmp = Colors.yellowAccent;
              case (8):
                text = 'Событие по\nтемпературе';
                imageTmp = const AssetImage('assets/images/warning.png');
                colorTmp = Colors.yellowAccent;
              case (9):
                text = 'Событие по\nвлажности';
                imageTmp = const AssetImage('assets/images/warning.png');
                colorTmp = Colors.yellowAccent;
              default:
                text = 'N\A';
                imageTmp = const AssetImage('assets/images/allert.png');
                colorTmp = Colors.grey;
            }
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.black54,
                border: Border.all(
                    width: 5, color: const Color.fromRGBO(255, 188, 108, 1.0)),
              ),
              padding: const EdgeInsets.fromLTRB(5, 10, 5, 20),
              margin: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(detectors[index].name,
                            style: const TextStyle(
                                fontSize: textSize, color: Colors.white)),
                        TextButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context){
                                  return DialogFullInformation(
                                    detector: detectors[index],
                                    imageTmp: imageTmp,
                                    colorTmp: colorTmp,
                                    textTmp: text,
                                  );
                                }
                            );
                          },
                          child: const Text('Подробная\nинформцаия',
                              style: TextStyle(fontSize: 18, color: Colors.grey), textAlign: TextAlign.center,),
                        )
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.fromLTRB(25, 0, 0, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image(
                          image: imageTmp,
                          width: 50,
                          height: 50,
                        ),
                        Text(text,
                            style: TextStyle(color: colorTmp, fontSize: 18),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
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
