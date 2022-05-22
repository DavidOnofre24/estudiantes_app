import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class StudentDetail extends StatefulWidget {
  const StudentDetail({required this.documentId, Key? key}) : super(key: key);

  final String documentId;

  @override
  State<StudentDetail> createState() => _StudentDetailState();
}

class _StudentDetailState extends State<StudentDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Perfil estudiante')),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton:
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.blue,
                  padding: EdgeInsets.zero,
                  child: const Text('Entregar',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    if (_idAcudiente != '') {
                      showDialog<String>(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Entrega exitosa'),
                                  content: FutureBuilder<
                                          DocumentSnapshot<
                                              Map<String, dynamic>>>(
                                      future: students
                                          .doc(widget.documentId)
                                          .collection('acudientes')
                                          .doc(_idAcudiente)
                                          .get(),
                                      builder: (a, s) {
                                        if (s.connectionState ==
                                            ConnectionState.done) {
                                          final acudiente = s.data!.data();

                                          return Text(
                                              'Entrega hecha al acudiente ${acudiente!['Nombre']}');
                                        }
                                        return Container();
                                      }),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pushNamedAndRemoveUntil(
                                              context,
                                              'home',
                                              (route) => false),
                                      child: const Text('Aceptar'),
                                    )
                                  ]));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Debes seleccionar un acudiente primero'),
                      ));
                    }
                  })),
          MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              color: Colors.blue,
              child: const Text('Reporte',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              onPressed: () {
                Navigator.of(context).pushNamed('report');
              })
        ]),
        body: SingleChildScrollView(
          child: Column(children: [
            FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                future: students.doc(widget.documentId).get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot<Map<String, dynamic>>>
                        snapshot) {
                  if (snapshot.hasError) {
                    return const Text(
                        'A ocurrido un error, intentalo mas tarde');
                  }

                  if (snapshot.hasData && !snapshot.data!.exists) {
                    return const Text('No hay registros');
                  }

                  if (snapshot.connectionState == ConnectionState.done) {
                    final student = snapshot.data!.data();

                    return Column(children: [
                      Container(
                          margin: const EdgeInsets.only(top: 20),
                          child: Text(student!['nombre'].toString(),
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                      Container(
                          margin: const EdgeInsets.only(top: 20) +
                              const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(children: [
                            Flexible(
                                child: Container(
                                    margin: const EdgeInsets.only(left: 5),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text('Edad: ${student['edad']} años'),
                                          Text('RH: ${student['RH']}'),
                                          Text(
                                              'Numero documento: ${student['num_doc']}'),
                                          Text('Grupo: ${student['Grupo']}'),
                                          Text('Salon: ${student['Salon']}'),
                                          Text('Sede: ${student['Sede']}')
                                        ]))),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset('assets/foto.jpeg',
                                    width: 130, height: 170, fit: BoxFit.cover))
                          ])),
                      Container(
                          margin: const EdgeInsets.only(top: 20, left: 20),
                          alignment: Alignment.topLeft,
                          child: const Text('Acudientes',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold))),
                      FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                          future: students
                              .doc(widget.documentId)
                              .collection('acudientes')
                              .get(),
                          builder: ((context, snapshot) {
                            if (snapshot.hasError) {
                              return const Text(
                                  'A ocurrido un error, intentalo mas tarde');
                            }

                            if (snapshot.hasData &&
                                !snapshot.data!.docs.isNotEmpty) {
                              return const Text('No hay registros');
                            }

                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              var list = snapshot.data!.docs;
                              return Column(children: [
                                for (final a in list) _acudentCard(a, 0)
                              ]);
                            }
                            return Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: const CircularProgressIndicator());
                          }))
                    ]);
                  }
                  return Container(
                      margin: const EdgeInsets.only(top: 20),
                      child: const CircularProgressIndicator());
                }),
            const SizedBox(height: 100)
          ]),
        ));
  }

  Widget _acudentCard(
      QueryDocumentSnapshot<Map<String, dynamic>> a, int number) {
    return Container(
        margin: const EdgeInsets.only(top: 20) +
            const EdgeInsets.symmetric(horizontal: 10),
        child: CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          value: _idAcudiente == a.id,
          onChanged: (s) {
            setState(() {
              if (s!) {
                _idAcudiente = a.id;
              } else {
                _idAcudiente = '';
              }
            });
          },
          title: Row(children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset('assets/foto2.jpeg',
                    width: 120, height: 100, fit: BoxFit.cover)),
            Flexible(
                child: Container(
                    margin: const EdgeInsets.only(left: 5),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(a.get('Nombre')),
                          Text('CC: ${a.get('Num_doc')}'),
                          Text('Parentesco: ${a.get('parentesco')}'),
                          Text('Placas: ${a.get('Placas')}'),
                          Text('Telefono: ${a.get('telefono')}'),
                        ]))),
          ]),
        ));
  }

  CollectionReference<Map<String, dynamic>> students =
      FirebaseFirestore.instance.collection('estudiantes');

  String _idAcudiente = '';
}
