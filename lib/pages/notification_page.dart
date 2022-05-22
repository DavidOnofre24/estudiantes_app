import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Notificaciones')),
        body: Column(children: [const SizedBox(height: 20), _notification()]));
  }

  Widget _notification() {
    return SizedBox(
        width: double.infinity,
        child: Card(
            color: Colors.blue[200],
            margin: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: Column(children: [
                Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(children: const [
                      Text('Fecha:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('10/05/2000')
                    ])),
                Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(children: const [
                      Text('Estudiante:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('David Onofre Gutierrez')
                    ])),
                Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(children: const [
                      Text('Documento:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('1002931002')
                    ])),
                Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(children: const [
                      Text('Profesor encargado:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Daniela Imbachi')
                    ])),
                Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(children: const [
                      Text('Solicitud:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Acudiente Excepcion')
                    ])),
                Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(children: const [
                      Text('Nombre:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Jose Antonio')
                    ])),
                Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(children: const [
                      Text('Documento Acudiente:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('1022032091')
                    ])),
                Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(children: const [
                      Text('Placa:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('IRY10F')
                    ])),
                Container(
                    margin: const EdgeInsets.only(bottom: 5),
                    child: Row(children: const [
                      Text('Reporte:',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text('Permitido')
                    ])),
              ]),
            )));
  }
}
