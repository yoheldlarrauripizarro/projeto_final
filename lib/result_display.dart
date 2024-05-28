import 'package:flutter/material.dart';

class ResultDisplay extends StatelessWidget {
  final String resultadoNome;
  final String resultadoEmail;
  final String resultadoNotas;
  final String resultadoMedia;

  ResultDisplay({
    required this.resultadoNome,
    required this.resultadoEmail,
    required this.resultadoNotas,
    required this.resultadoMedia,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text('Resultado:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        Text('Nome: $resultadoNome'),
        Text('Email: $resultadoEmail'),
        Text('Notas: $resultadoNotas'),
        Text('Média: $resultadoMedia'),
      ],
    );
  }
}
