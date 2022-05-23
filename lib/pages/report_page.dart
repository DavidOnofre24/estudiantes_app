import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Reporte')),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(children: [
            Row(children: const [
              Text('Fecha:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('18/03/2022')
            ]),
            Row(children: const [
              Text('Hora:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('10:30 pm')
            ]),
            Row(children: const [
              Text('Estudiante:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('David Onofre Gutierrez')
            ]),
            Row(children: const [
              Text('Documento:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('102019312')
            ]),
            Row(children: const [
              Text('Profesor encargado:',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Daniela Imbachi')
            ]),
            Row(children: const [
              Text('Solicitud:', style: TextStyle(fontWeight: FontWeight.bold)),
              Text('Acudiente excepción')
            ]),
            Container(
                margin: const EdgeInsets.only(bottom: 10, top: 30),
                child: TextFormField(
                    style: const TextStyle(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese un valor';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      hintText: 'Nombre Acudiente',
                    ))),
            Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                    style: const TextStyle(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese un valor';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      hintText: 'Numero documento',
                    ))),
            Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: TextFormField(
                    style: const TextStyle(),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Ingrese un valor';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      hintText: 'Placa',
                    ))),
            MaterialButton(
                padding: const EdgeInsets.symmetric(horizontal: 37),
                color: Colors.blue,
                onPressed: () {
                  Navigator.of(context).pushNamed('students');
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                child: const Text('Enviar reporte',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold)))
          ]),
        ));
  }
}
