import 'dart:convert';

import 'package:flutter/material.dart';
import 'example_data.dart';
import 'detector.dart'; // Class detector
// Всплывающее окно подробной информацции про датчик
import 'dialog_full_information.dart';
// Метод декодирования статуса
import 'decode_status.dart';

// Функция получение файла с сервера
/*Future<Detector> fetchDetector() async {
  final response = await http
      .get(Uri.parse(''));
  if (response.statusCode == 200) {
    return Detector.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
  } else {
    throw Exception('Failed to load');
  }
}*/

// Функция декодирования JSON файла
List<Detector> decode() {
  final json = jsonDecode(jsonString) as List<dynamic>;
  final detectors = json
      .map((dynamic e) => Detector.fromJson(e as Map<String, dynamic>))
      .toList();
  return detectors;
}


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}


// Создание основного экрана
class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(context) {
    List<Detector> detectors = decode(); // Получение списка всех датчиков

    // Заполнение пустых полей датчика
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
        title: const Text('Список датчиков'),
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
            // Декодирование статуса датчика
            String text = decodeStatusText(detectors[index].status);
            AssetImage imageTmp = decodeStatusImage(detectors[index].status);
            Color colorTmp = decodeStatusColor(detectors[index].status);

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
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const SizedBox(width: 150),
                      Text(
                        detectors[index].name,
                        style:
                            const TextStyle(fontSize: 28, color: Colors.white),
                      ),
                      // Кнопка активации всплывающего окна диалога
                      // с полной информацией о датчике
                      TextButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return DialogFullInformation(
                                  detector: detectors[index],
                                  imageTmp: imageTmp,
                                  colorTmp: colorTmp,
                                  textTmp: text,
                                );
                              });
                        },
                        child: const Text(
                          'Подробная\nинформация',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(width: 150),
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
                ],
              ),
            );
          }),
    );
  }
}
