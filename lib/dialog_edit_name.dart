import 'package:flutter/material.dart';
import 'detector.dart';

class DialogEditName extends StatelessWidget {
  String name;
  final control = TextEditingController();

  DialogEditName({super.key, required this.name});

  String getNewName(){
    return name;
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[800],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(
              width: 3, color: Color.fromRGBO(255, 188, 108, 1.0))),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        TextField(
            controller: control,
            textAlign: TextAlign.center,
            autofocus: true,
            style: const TextStyle(color: Colors.white),
            maxLength: 30,
            showCursor: true,
            maxLines: 1,
            onSubmitted: (String value) async {
              name = control.text;
              Navigator.of(context).pop();
            }),
        /*TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Image(
              image: AssetImage('assets/images/accept.png'),
              width: 30,
              height: 30,
            ))*/
      ]),
    );
  }
}
