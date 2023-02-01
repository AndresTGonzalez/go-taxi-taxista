import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/providers.dart';
import '../ui/ui.dart';

class Registro extends StatelessWidget {
  const Registro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              _logo(),
              Container(
                width: double.infinity,
                height: 20,
                // color: Colors.red,
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 0),
                child: Text(
                  'Aplicación de conductor',
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.w700),
                ),
              ),
              _title(),
              _formContainer()
            ],
          ),
        ),
      ),
    );
  }

  Container _title() {
    return Container(
      width: double.infinity,
      height: 50,
      alignment: Alignment.centerLeft,
      // color: Colors.red,
      margin: const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
      child: const Text(
        'Regístrate',
        style: TextStyle(
            fontSize: 35,
            fontFamily: 'Archivo-Bold',
            fontWeight: FontWeight.w700),
      ),
    );
  }

  Container _formContainer() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      child: ChangeNotifierProvider(
        create: (context) => LoginFormProvider(),
        child: _LoginForm(),
      ),
    );
  }

  Container _logo() {
    return Container(
      // color: Colors.red,
      alignment: Alignment.bottomLeft,
      // height: 75,
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: Image.asset(
        'images/logo.png',
        width: 250,
        alignment: Alignment.bottomLeft,
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  const _LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              autocorrect: false,
              // onChanged: (value) => ,
              validator: (value) {
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = RegExp(pattern);

                return regExp.hasMatch(value ?? '')
                    ? null
                    : 'Correo electrónico incorrecto';
              },
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                loginForm.email = value;
              },
              decoration: InputDecorations.authInputDecoration(
                color: Color(0xff202020),
                hintText: 'jhon.doe@gmail.com',
                labelText: 'Correo electrónico',
                prefixIcon: Icons.alternate_email,
              ),
            ),
            _formSizeBox(),
            TextFormField(
              autocorrect: false,
              validator: (value) {
                if (value != null && value.length >= 6) {
                  return null;
                } else {
                  return 'Contraseña mínima de 6 caracteres';
                }
              },
              onChanged: (value) => loginForm.password = value,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '***********',
                  labelText: 'Contraseña',
                  color: Color(0xff202020),
                  prefixIcon: Icons.lock),
            ),
            _formSizeBox(),
            TextFormField(
              autocorrect: false,
              validator: (value) {
                if (value != null && value.length >= 6) {
                  return null;
                } else {
                  return 'Contraseña mínima de 6 caracteres';
                }
              },
              onChanged: (value) => loginForm.password = value,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorations.authInputDecoration(
                  hintText: '***********',
                  labelText: 'Repita la contraseña',
                  color: Color(0xff202020),
                  prefixIcon: Icons.lock),
            ),
            _formSizeBox(),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, 'login');
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              disabledColor: Colors.grey,
              elevation: 0,
              color: Color(0xffFFF000),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text(
                  'Registrarse',
                  style: TextStyle(
                    fontFamily: 'Archivo-Medium',
                    fontSize: 15,
                    color: Color(0xff202020),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox _formSizeBox() {
    return const SizedBox(
      height: 30,
      width: double.infinity,
    );
  }
}
