// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xffF2F2F2),
        body: SafeArea(
            child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                    height: (MediaQuery.of(context).orientation ==
                            Orientation.portrait)
                        ? MediaQuery.of(context).size.height * 0.9
                        : null,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Center(
                              child: Container(
                                  width: 200,
                                  margin: const EdgeInsets.only(top: 40),
                                  child: Column(children: const [
                                    Image(
                                        image: AssetImage('assets/avatar.png')),
                                    SizedBox(height: 20),
                                    Text('Iniciar sesión',
                                        style: TextStyle(fontSize: 30))
                                  ]))),
                          _Form(),
                        ])))));
  }

  @override
  void initState() {
    FirebaseAuth.instance.signOut();
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        Navigator.of(context).pushNamedAndRemoveUntil('home', (route) => false);
      }
    });

    super.initState();
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 40),
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(children: [
          CustomInput(
            icon: Icons.email_outlined,
            placeholder: 'Correo electronico',
            keyboardType: TextInputType.emailAddress,
            textController: emailCtrl,
          ),
          CustomInput(
            icon: Icons.lock_outline,
            placeholder: 'Contraseña',
            keyboardType: TextInputType.emailAddress,
            textController: passwordCtrl,
            isPassword: true,
          ),
          BlueBotton(
              label: 'Ingresar',
              onPressed: () async {
                try {
                  await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: emailCtrl.text, password: passwordCtrl.text);
                } on FirebaseAuthException catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(e.message!),
                  ));
                }
              }),
          // Container(
          //   margin: const EdgeInsets.only(top: 10),
          //   child: GestureDetector(
          //       onTap: () {},
          //       child: Text('Registrarse',
          //           style: TextStyle(
          //               color: Colors.blue[600], fontWeight: FontWeight.bold))),
          // )
        ]));
  }
}

class BlueBotton extends StatelessWidget {
  final Function() onPressed;
  final String label;

  const BlueBotton({required this.onPressed, required this.label, Key? key})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        onPressed: onPressed,
        elevation: 2,
        highlightElevation: 5,
        color: Colors.blue,
        shape: const StadiumBorder(),
        child: SizedBox(
            width: double.infinity,
            height: 55,
            child: Center(
                child: Text(label,
                    style:
                        const TextStyle(color: Colors.white, fontSize: 17)))));
  }
}

class CustomInput extends StatelessWidget {
  final IconData icon;
  final String placeholder;
  final TextEditingController textController;
  final TextInputType keyboardType;
  final bool isPassword;

  const CustomInput(
      {Key? key,
      required this.icon,
      required this.placeholder,
      required this.textController,
      this.keyboardType = TextInputType.text,
      this.isPassword = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 20),
        padding: const EdgeInsets.only(top: 5, left: 5, bottom: 5, right: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 5),
                  blurRadius: 5),
            ]),
        child: TextField(
          controller: textController,
          autocorrect: false,
          keyboardType: keyboardType,
          obscureText: isPassword,
          decoration: InputDecoration(
              prefixIcon: Icon(icon),
              focusedBorder: InputBorder.none,
              border: InputBorder.none,
              hintText: placeholder),
        ));
  }
}
