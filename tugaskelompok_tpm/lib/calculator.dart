import 'package:flutter/material.dart';
import 'package:tugaskelompok_tpm/data_kelompok.dart';


class CalculatorApp extends StatefulWidget {
  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String _input = '';
  double _value = 0;

  void _onPressed(String text) {
    setState(() {
      if (text == '+') {
        _value += double.parse(_input);
        _input = '';
      } else if (text == '-') {
        _value -= double.parse(_input);
        _input = '';
      } else if (text == 'C') {
        _input = '';
        _value = 0;
      } else if (text == '=') {
        if (_input.isNotEmpty) {
          if (_value == 0) {
            _value = double.parse(_input);
          } else {
            if (_input.startsWith('-')) {
              _value -= double.parse(_input.substring(1));
            } else {
              _value += double.parse(_input);
            }
          }
          _input = '';
        }
      } else {
        _input += text;
      }
    });
  }

  Widget _buildButton(String text, {Color color = Colors.black, int flex = 1}) {
    return Expanded(
      flex: flex,
      child: Container(
        margin: EdgeInsets.all(2.0),
        child: ElevatedButton(
          onPressed: () => _onPressed(text),
          child: Text(
            text,
            style: TextStyle(fontSize: 24.0),
          ),
          style: ElevatedButton.styleFrom(
            primary: color,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Calculator App')),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DataKelompok()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.bottomRight,
              child: Text(
                _value.toString(),
                style: TextStyle(fontSize: 48.0),
              ),
            ),
          ),
          Row(
            children: <Widget>[
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
              _buildButton('+', color: Colors.blue),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
              _buildButton('-', color: Colors.blue),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
              _buildButton('C', color: Colors.red),
            ],
          ),
          Row(
            children: <Widget>[
              _buildButton('0'),
              _buildButton('.'),
              _buildButton('=', color: Colors.blue),
            ],
          ),
        ],
      ),
    );
  }
}
