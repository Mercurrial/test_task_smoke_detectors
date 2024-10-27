
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'detector.dart';

class DialogFullInformation extends StatelessWidget{
  final Detector detector;
  final AssetImage imageTmp;
  final String textTmp;
  final Color colorTmp;

  const DialogFullInformation({super.key, required this.detector, required this.imageTmp, required this.textTmp, required this.colorTmp});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.grey[800],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20), side: BorderSide(width: 3, color: Color.fromRGBO(255, 188, 108, 1.0))),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 15),
          Text(detector.name, style: const TextStyle(
              fontSize: 40,
              color: Colors.white),
          ),
          const SizedBox(height: 15),
          Image(
            image: imageTmp,
            width: 75,
            height: 75,
          ),
          Text(textTmp, style: TextStyle(
              fontSize: 22,
              color: colorTmp),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  const Image(
                    image: AssetImage('assets/images/celsius.png'),
                    width: 75,
                    height: 75,
                  ),
                  const SizedBox(height: 3),
                  Text('${detector.temperature} C°\nТемпература', style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              const SizedBox(width: 50),
              Column(
                children: [
                  const Image(
                    image: AssetImage('assets/images/humidity.png'),
                    width: 75,
                    height: 75,
                  ),
                  const SizedBox(height: 3),
                  Text('${detector.humidity} %\nВлажность', style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          FilledButton(
            style: const ButtonStyle(
              backgroundColor:  MaterialStatePropertyAll<Color>(Colors.black45),
            ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK', style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  
}