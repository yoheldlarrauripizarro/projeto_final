import 'package:flutter/material.dart';
import 'tarefa_final_page.dart';

void main() {
  runApp(TarefaFinalApp());
}

class TarefaFinalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tarefa Final',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TarefaFinalPage(),
    );
  }
}