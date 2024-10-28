import 'package:flutter/material.dart';

List<dynamic> decodeStatus(int i){
  final resultList = <dynamic>['', const AssetImage('assets/images/alert.png')];
  resultList.add(Colors.grey);
  switch (i) {
    case (0):
      resultList[0] = 'Неизвестно';
      resultList[1] = const AssetImage('assets/images/alert.png');
      resultList[2] = Colors.grey;
    case (1):
      resultList[0] = 'Готов';
      resultList[1] = const AssetImage('assets/images/accept.png');
      resultList[2] = Colors.green;
    case (2):
      resultList[0] = 'Тревога';
      resultList[1] = const AssetImage('assets/images/exclamation.png');
      resultList[2] = Colors.red;
    case (3):
      resultList[0] = 'Пожар';
      resultList[1] = const AssetImage('assets/images/exclamation.png');
      resultList[2] = Colors.red;
    case (4):
      resultList[0] = 'Корпус открыт';
      resultList[1] = const AssetImage('assets/images/warning.png');
      resultList[2] = Colors.yellowAccent;
    case (5):
      resultList[0] = 'Корпус закрыт';
      resultList[1] = const AssetImage('assets/images/accept.png');
      resultList[2] = Colors.green;
    case (6):
      resultList[0] = 'Потерян';
      resultList[1] = const AssetImage('assets/images/alert.png');
      resultList[2] = Colors.grey;
    case (7):
      resultList[0] = 'Низкий заряд\nбатареи';
      resultList[1] = const AssetImage('assets/images/warning.png');
      resultList[2] = Colors.yellowAccent;
    case (8):
      resultList[0] = 'Событие по\nтемпературе';
      resultList[1] = const AssetImage('assets/images/warning.png');
      resultList[2] = Colors.yellowAccent;
    case (9):
      resultList[0] = 'Событие по\nвлажности';
      resultList[1] = const AssetImage('assets/images/warning.png');
      resultList[2] = Colors.yellowAccent;
    default:
      resultList[0] = 'N/A';
      resultList[1] = const AssetImage('assets/images/alert.png');
      resultList[2] = Colors.grey;
  }

  return resultList;
}