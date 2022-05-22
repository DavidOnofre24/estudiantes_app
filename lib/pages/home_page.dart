import 'package:estudiantes_app/pages/student_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Inicio'), actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed('notifications');
              },
              icon: const Icon(Icons.notifications_rounded))
        ]),
        body: Column(children: [
          const Center(
              child:
                  Icon(Icons.qr_code_2, size: 300, color: Colors.blueAccent)),
          Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              child: MaterialButton(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  color: Colors.blue,
                  onPressed: () async {
                    String idStudent = await FlutterBarcodeScanner.scanBarcode(
                        '#3D8BEF', 'Cancelar', false, ScanMode.QR);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                StudentDetail(documentId: idStudent)));
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text('Escanear codigo QR',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold)))),
          MaterialButton(
              padding: const EdgeInsets.symmetric(horizontal: 37),
              color: Colors.blue,
              onPressed: () {
                Navigator.of(context).pushNamed('students');
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: const Text('Busqueda manual',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)))
        ]));
  }
}
