import 'package:flutter/material.dart';

class StudentsPage extends StatefulWidget {
  const StudentsPage({Key? key}) : super(key: key);

  @override
  State<StudentsPage> createState() => _StudentsPageState();
}

class _StudentsPageState extends State<StudentsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inicio')),
      body: SingleChildScrollView(
          child: Column(children: [_studentCard(), _studentCard()])),
    );
  }

  Widget _studentCard() {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).pushNamed('studentDetail');
      },
      child: Container(
          margin: const EdgeInsets.only(top: 20) +
              const EdgeInsets.symmetric(horizontal: 10),
          child: Row(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/foto.jpeg',
                    width: 120, height: 100, fit: BoxFit.cover)),
            Flexible(
                child: Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Nombre estudiante'),
                          const Text(
                              'Praesent id sollicitudin diam, mattis dictum enim.'),
                          Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.bottomRight,
                              child: const Text('1'))
                        ])))
          ])),
    );
  }
}
