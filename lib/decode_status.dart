import 'package:flutter/material.dart';

String decodeStatusText(int i){
  switch(i){
    case(0):
      return 'Неизвестно';
    case(1):
      return 'Готов';
    case(2):
      return 'Тревога';
    case(3):
      return 'Пожар';
    case(4):
      return 'Корпус открыт';
    case(5):
      return 'Корпус закрыт';
    case(6):
      return 'Потерян';
    case(7):
      return 'Низкий заряд\nбатареи';
    case(8):
      return 'Событие по\nтемпературе';
    case(9):
      return 'Событие по\nвлажности';
    default:
      return 'N/A';
  }
}

AssetImage decodeStatusImage(int i){
  switch(i){
    case(0):
      return const AssetImage('assets/images/alert.png');
    case(1):
      return const AssetImage('assets/images/accept.png');
    case(2):
      return const AssetImage('assets/images/exclamation.png');
    case(3):
      return const AssetImage('assets/images/exclamation.png');
    case(4):
      return const AssetImage('assets/images/warning.png');
    case(5):
      return const AssetImage('assets/images/accept.png');
    case(6):
      return const AssetImage('assets/images/alert.png');
    case(7):
      return const AssetImage('assets/images/warning.png');
    case(8):
      return const AssetImage('assets/images/warning.png');
    case(9):
      return const AssetImage('assets/images/warning.png');
    default:
      return const AssetImage('assets/images/alert.png');
  }
}

Color decodeStatusColor(int i){
  switch(i){
    case(0):
      return Colors.grey;
    case(1):
      return Colors.green;
    case(2):
      return Colors.red;
    case(3):
      return Colors.red;
    case(4):
      return Colors.yellowAccent;
    case(5):
      return Colors.green;
    case(6):
      return Colors.grey;
    case(7):
      return Colors.yellowAccent;
    case(8):
      return Colors.yellowAccent;
    case(9):
      return Colors.yellowAccent;
    default:
      return Colors.grey;
  }
}