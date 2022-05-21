import 'package:flutter/material.dart';

class StudentDetail extends StatefulWidget {
  const StudentDetail({Key? key}) : super(key: key);

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
                  onPressed: () {})),
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
            Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Text('Nombre estudiante',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            Container(
                margin: const EdgeInsets.only(top: 20) +
                    const EdgeInsets.symmetric(horizontal: 10),
                child: Row(children: [
                  Flexible(
                      child: Container(
                          margin: const EdgeInsets.only(left: 5),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('Edad: 6 años'),
                                Text('RH: O+'),
                                Text('Numero documento: 1005876012'),
                                Text('Grupo: Primero B'),
                                Text('Salon: A12'),
                                Text('Sede: II'),
                              ]))),
                  ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.asset('assets/foto.jpeg',
                          width: 130, height: 170, fit: BoxFit.cover)),
                ])),
            Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                alignment: Alignment.topLeft,
                child: const Text('Acudientes',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold))),
            _acudentCard(0),
            _acudentCard(1),
            _acudentCard(2),
            const SizedBox(height: 100)
          ]),
        ));
  }

  Widget _acudentCard(int number) {
    return Container(
        margin: const EdgeInsets.only(top: 20) +
            const EdgeInsets.symmetric(horizontal: 10),
        child: CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          value: _value[number],
          onChanged: (a) {
            setState(() {
              _value.clear();
              _value.addAll([false, false, false]);
              _value[number] = a!;
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
                        children: const [
                          Text('Nombre Acudiente'),
                          Text('CC 102213102'),
                          Text('Parentesco: Padre'),
                          Text('Placas: AIE123'),
                          Text('Telefono: 323453123'),
                        ]))),
          ]),
        ));
  }

  final _value = [false, false, false];
}
