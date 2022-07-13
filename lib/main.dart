import 'package:flutter/material.dart';

import 'task_database.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final taskController = TextEditingController();
  final taskDatabase = TaskDatabase();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usando Sql'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: const InputDecoration(
                hintText: 'Escreva sua tarefa',
              ),
            ),
            MaterialButton(
              onPressed: () {
                taskDatabase.insert(taskController.text);
                taskDatabase.select();
              },
              child: const Text('Salvar'),
            )
          ],
        ),
      ),
    );
  }
}
