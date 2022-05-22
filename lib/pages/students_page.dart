import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:estudiantes_app/pages/student_detail_page.dart';
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
        appBar: AppBar(title: const Text('Estudiantes')),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 15) +
                  const EdgeInsets.only(top: 15),
              child: TextField(
                  controller: _searchtxt,
                  onChanged: (a) {
                    setState(() {});
                  },
                  decoration: const InputDecoration(
                      hintText: 'Buscar', suffixIcon: Icon(Icons.search)))),
          FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
              future: students.get(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
                if (snapshot.hasError) {
                  return const Text('A ocurrido un error, intentalo mas tarde');
                }

                if (snapshot.hasData && !snapshot.data!.docs.isNotEmpty) {
                  return const Text('No hay registros');
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  var list = snapshot.data!.docs;

                  if (_searchtxt.text.isNotEmpty) {
                    list = list
                        .where((element) =>
                            element
                                .get('nombre')
                                .toString()
                                .toLowerCase()
                                .contains(_searchtxt.text.toLowerCase()) ||
                            element
                                .get('Grupo')
                                .toString()
                                .toLowerCase()
                                .contains(_searchtxt.text.toLowerCase()))
                        .toList();
                  }

                  return Column(
                      children: [for (final a in list) _studentCard(a)]);
                }
                return Container(
                    margin: const EdgeInsets.only(top: 20),
                    child: const CircularProgressIndicator());
              })
        ])));
  }

  Widget _studentCard(QueryDocumentSnapshot snapshot) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => StudentDetail(documentId: snapshot.id)));
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
                          Wrap(children: [
                            const Text('Nombre estudiante: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('${snapshot.get('nombre')}')
                          ]),
                          Wrap(children: [
                            const Text('Grupo: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('${snapshot.get('Grupo')}')
                          ]),
                          Container(
                              padding: const EdgeInsets.all(10),
                              alignment: Alignment.bottomRight,
                              child: const Text('1'))
                        ])))
          ])),
    );
  }

  final _searchtxt = TextEditingController();

  CollectionReference<Map<String, dynamic>> students =
      FirebaseFirestore.instance.collection('estudiantes');
}
