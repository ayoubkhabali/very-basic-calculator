import 'package:flutter/material.dart';

void main() {
  runApp(CalculatriceApp());
}

class CalculatriceApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CalculatricePage(),
    );
  }
}

class CalculatricePage extends StatefulWidget {
  @override
  _CalculatricePageState createState() => _CalculatricePageState();
}

class _CalculatricePageState extends State<CalculatricePage> {
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  double _result = 0.0;

  void _calculer(Operation operation) {
    double value1 = double.tryParse(_controller1.text) ?? 0.0;
    double value2 = double.tryParse(_controller2.text) ?? 0.0;
    setState(() {
      switch (operation) {
        case Operation.ADDITION:
          _result = value1 + value2;
          break;
        case Operation.SOUSTRACTION:
          _result = value1 - value2;
          break;
        case Operation.MULTIPLICATION:
          _result = value1 * value2;
          break;
        case Operation.DIVISION:
          _result = value1 / value2;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculatrice'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: _controller1,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Nombre 1',
              ),
            ),
            TextField(
              controller: _controller2,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: 'Nombre 2',
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () => _calculer(Operation.ADDITION),
                  child: Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => _calculer(Operation.SOUSTRACTION),
                  child: Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => _calculer(Operation.MULTIPLICATION),
                  child: Text('x'),
                ),
                ElevatedButton(
                  onPressed: () => _calculer(Operation.DIVISION),
                  child: Text('/'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Résultat: $_result',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}

enum Operation {
  ADDITION,
  SOUSTRACTION,
  MULTIPLICATION,
  DIVISION,
}
