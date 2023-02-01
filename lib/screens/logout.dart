import 'package:flutter/material.dart';

class Logout extends StatelessWidget {
  const Logout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              alignment: Alignment.centerLeft,
              // color: Colors.red,
              child: Text(
                'Tu cuenta',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              // color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.5,
              child: Image.asset('images/taxi.png'),
            ),
            SizedBox(
              height: 50,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25),
              child: MaterialButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, 'login');
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Color(0xffFF1D15),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: Text(
                    'Cerrar Sesión',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Archivo',
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
