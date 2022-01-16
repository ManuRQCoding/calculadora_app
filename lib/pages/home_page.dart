// ignore_for_file: prefer_const_constructors

import 'package:calculadora_app/utils/calculadora_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

String _salida = '0';
String _resultado = '0';
List<String> _historial = [];

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double width = 0, height = 0;
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    print('$width    $height');
    return width <= 600
        ? Scaffold(
            body: _bodyCalculadora(),
          )
        : _web(context);
  }

  Scaffold _web(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 35,
                      color: Colors.grey.shade900,
                    )
                  ],
                  color: Colors.blueGrey.shade900,
                  border: Border.all(width: 0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.elliptical(85, 60),
                    bottomRight: Radius.elliptical(85, 60),
                  ),
                ),
                width: 365,
                height: 685,
                child: _bodyCalculadora()),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Container(
                width: 405,
                height: 565,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade900,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      color: Colors.grey.shade900,
                    )
                  ],
                ),
                child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 157, 157, 140),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 0,
                          color: Colors.grey.shade900,
                        )
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                          itemCount: _historial.length,
                          itemBuilder: (_, i) {
                            // ignore: prefer_const_constructors
                            return Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Text(
                                _historial[i],
                                style: TextStyle(
                                  height: 0.8,
                                  overflow: TextOverflow.clip,
                                  fontFamily: 'Calculadora',
                                  fontSize:
                                      MediaQuery.of(context).size.width > 740
                                          ? 50.0
                                          : 35.0,
                                  color: Colors.black,
                                ),
                              ),
                            );
                          }),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column _bodyCalculadora() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _inicioCalc(),
        //Filas de teclas
        _primeraFila(),
        _segundaFila(),
        _terceraFila(),
        _cuartaFila()
      ],
    );
  }

  Column _inicioCalc() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Text(
                'CASIO',
                style: GoogleFonts.exo2(
                  textStyle: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 20),
              child: Text(
                'fx-82MS',
                style: GoogleFonts.exo2(
                  textStyle: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(top: 15, bottom: 15),
          child: Text(
            'S-V-P.A.M.',
            style: GoogleFonts.exo2(
              textStyle: TextStyle(
                color: Colors.redAccent.shade100,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
          ),
        ),

        //La caja de texto para los resultados
        _cajaTexto(context),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _botonRound(5, '', () => null),
            _botonRound(20, '', () => null),
            _bigBoton(),
            _botonRound(20, '', () => null),
            _botonRound(10, '', () => null),
          ],
        ),
      ],
    );
  }

  Row _primeraFila() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _botonOp('7', () => _num('7')),
        _botonOp('8', () => _num('8')),
        _botonOp('9', () => _num('9')),
        _botonRed('DEL', () => del()),
        _botonRed('AC', () => ac()),
      ],
    );
  }

  Row _segundaFila() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _botonOp('4', () => _num('4')),
        _botonOp('5', () => _num('5')),
        _botonOp('6', () => _num('6')),
        _botonOp('×', () => _num('×')),
        _botonOp('÷', () => _num('÷')),
      ],
    );
  }

  Row _terceraFila() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _botonOp('1', () => _num('1')),
        _botonOp('2', () => _num('2')),
        _botonOp('3', () => _num('3')),
        _botonOp('+', () => _num('+')),
        _botonOp('-', () => _num('-')),
      ],
    );
  }

  Row _cuartaFila() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _botonOp('0', () => _num('0')),
        _botonOp('.', () => _num('')),
        _botonOp('EXP', () => _num('')),
        _botonOp('Ans', () => _num('')),
        _botonOp('=', () => _doOperation()),
      ],
    );
  }

  Widget _botonOp(String caracter, Function() f) {
    return MaterialButton(
      elevation: 5,
      height: 50,
      minWidth: 65,
      onPressed: f,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Text(
        caracter,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
      textColor: Colors.white,
      color: Colors.grey,
      highlightColor: Colors.grey.shade700,
      splashColor: null,
      onLongPress: null,
    );
  }

  Widget _botonRed(String caracter, Function() f) {
    return MaterialButton(
      elevation: 5,
      height: 50,
      minWidth: 65,
      onPressed: f,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(5),
              topRight: Radius.circular(5),
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: Text(
        caracter,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24.0,
        ),
      ),
      textColor: Colors.white,
      color: Colors.redAccent.shade100,
      highlightColor: Colors.redAccent.shade200,
      splashColor: null,
      onLongPress: null,
    );
  }

  Widget _botonRound(double top, String caracter, Function() f) {
    return Container(
      margin: EdgeInsets.only(
        top: top,
      ),
      child: MaterialButton(
        elevation: 5,
        height: 20,
        minWidth: 45,
        onPressed: f,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(100))),
        child: Text(
          caracter,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        textColor: Colors.white,
        color: Colors.grey,
        highlightColor: Colors.grey.shade700,
        splashColor: null,
        onLongPress: null,
      ),
    );
  }

  Widget _bigBoton() {
    return Container(
      margin: EdgeInsets.only(
        top: 30,
      ),
      child: MaterialButton(
        elevation: 5,
        height: 100,
        minWidth: 110,
        onPressed: () => null,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100),
                topRight: Radius.circular(100),
                bottomLeft: Radius.elliptical(125, 100),
                bottomRight: Radius.elliptical(125, 100))),
        child: Text(
          '',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24.0,
          ),
        ),
        textColor: Colors.white,
        color: Colors.grey,
        highlightColor: Colors.grey.shade700,
        splashColor: null,
        onLongPress: null,
      ),
    );
  }

  Container _cajaTexto(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15),
      height: Theme.of(context).textTheme.headline3!.fontSize! * 1.1 + 100,
      alignment: Alignment.topLeft,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Color.fromARGB(255, 157, 157, 140),
          boxShadow: [
            BoxShadow(
              blurRadius: 40,
              color: Colors.grey.shade900,
            ),
          ]),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10),
            height: 60,
            width: double.infinity,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                //decoration: BoxDecoration(border: Border.all()),
                child: Text(
                  _salida == '' ? 0.toString() : _salida,
                  style: const TextStyle(
                    fontFamily: 'Calculadora',
                    fontSize: 50.0,
                    color: Colors.black,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 25),
            padding: EdgeInsets.only(top: 10),
            height: 60,
            width: double.infinity,
            child: SingleChildScrollView(
              reverse: true,
              scrollDirection: Axis.horizontal,
              child: Text(
                _resultado == '' ? 0.toString() : _resultado,
                style: const TextStyle(
                  fontFamily: 'Calculadora',
                  fontSize: 50.0,
                  color: Colors.black,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }

  //Le pasamos el caracter de la salida por parámetro
  void _num(String car) {
    setState(() {
      if (isNan(car)) {
        _salida += car;
      } else {
        _salida = _salida != 0.toString() ? _salida += car : car;
      }
    });
  }

  void _doOperation() {
    String op = '';
    setState(() {
      _resultado = doOperation(_salida).toString();
      op += _salida + ' = ' + _resultado;
      _historial.add(op);
      _salida = _resultado;
    });
  }

  void del() {
    if (_salida.length == 1) {
      setState(() {
        _salida = 0.toString();
      });
    } else if (_salida.length > 0) {
      setState(() {
        _salida = deleteLast(_salida);
      });
    }
  }

  void ac() {
    setState(() {
      _salida = 0.toString();
      _resultado = 0.toString();
    });
  }
}
