import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Contador de Pessoas",
      home: Home(),
    )
  );
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _people = 0;
  String _infoText = "Pode Entrar!";

  void changePeople(int delta) {
    setState(() {
      _people += delta;
      if(_people < 0) {
        _infoText = "Mundo invertido?!";
      } else if(_people <= 10) {
        _infoText = "Pode Entrar";
      } else {
        _infoText = "Lotado!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
          Image.asset(
            "images/restaurant.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Pessoas: $_people",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text(
                        "+1",
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        changePeople(1);
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: FlatButton(
                      child: Text(
                        "-1",
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                        ),
                      ),
                      onPressed: () {
                        changePeople(-1);
                      },
                    ),
                  ),
                ],
              ),
              Text(
                _infoText,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ],
      );
  }
}