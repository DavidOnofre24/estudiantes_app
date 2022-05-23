import 'package:flutter/material.dart';

class NewStudent extends StatefulWidget {
  const NewStudent({Key? key}) : super(key: key);

  @override
  State<NewStudent> createState() => _NewStudentState();
}

class _NewStudentState extends State<NewStudent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar estudiante')),
    );
  }
}
