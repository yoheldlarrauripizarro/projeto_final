import 'package:flutter/material.dart';
import 'controllers.dart';
import 'result_display.dart';

class TarefaFinalPage extends StatefulWidget {
  @override
  _TarefaFinalPageState createState() => _TarefaFinalPageState();
}

class _TarefaFinalPageState extends State<TarefaFinalPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nota1Controller = TextEditingController();
  final TextEditingController _nota2Controller = TextEditingController();
  final TextEditingController _nota3Controller = TextEditingController();

  String _resultadoNome = '';
  String _resultadoEmail = '';
  String _resultadoNotas = '';
  String _resultadoMedia = '';

  void _calcularMedia() {
    setState(() {
      final nome = _nomeController.text;
      final email = _emailController.text;
      final nota1 = double.tryParse(_nota1Controller.text) ?? 0.0;
      final nota2 = double.tryParse(_nota2Controller.text) ?? 0.0;
      final nota3 = double.tryParse(_nota3Controller.text) ?? 0.0;
      final media = (nota1 + nota2 + nota3) / 3;

      _resultadoNome = nome;
      _resultadoEmail = email;
      _resultadoNotas = '${nota1.toStringAsFixed(1)} - ${nota2.toStringAsFixed(1)} - ${nota3.toStringAsFixed(1)}';
      _resultadoMedia = media.toStringAsFixed(1);
    });
  }

  void _apagarCampos() {
    setState(() {
      _nomeController.clear();
      _emailController.clear();
      _nota1Controller.clear();
      _nota2Controller.clear();
      _nota3Controller.clear();

      _resultadoNome = '';
      _resultadoEmail = '';
      _resultadoNotas = '';
      _resultadoMedia = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarefa Final'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Calculadora Média', style: TextStyle(fontSize: 20)),
            TextField(
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _nota1Controller,
                    decoration: InputDecoration(labelText: 'Nota 1'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _nota2Controller,
                    decoration: InputDecoration(labelText: 'Nota 2'),
                    keyboardType: TextInputType.number,
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextField(
                    controller: _nota3Controller,
                    decoration: InputDecoration(labelText: 'Nota 3'),
                    keyboardType: TextInputType.number,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: _calcularMedia,
                    child: Text('Calcular Média'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            ResultDisplay(
              resultadoNome: _resultadoNome,
              resultadoEmail: _resultadoEmail,
              resultadoNotas: _resultadoNotas,
              resultadoMedia: _resultadoMedia,
            ),
            SizedBox(height: 20),
            Row(
              children: <Widget>[
                Expanded(
                  child: ElevatedButton(
                    onPressed: _apagarCampos,
                    child: Text('Apagar Campos'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}