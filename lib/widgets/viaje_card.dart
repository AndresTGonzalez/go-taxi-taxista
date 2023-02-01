// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class ViajeCard extends StatelessWidget {
  const ViajeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        alignment: Alignment.centerLeft,
        // padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              height: 25,
              // color: Colors.red,
              margin: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                'En camino',
                style: TextStyle(
                    fontFamily: 'Archivo-Bold',
                    color: Color(0xff202020),
                    fontSize: 20),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              height: 15,
              // color: Colors.red,
              margin: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Text(
                'Av. Bolivariana y Cervantes',
                style: TextStyle(
                    fontFamily: 'Archivo-Medium',
                    color: Color(0xff202020),
                    fontSize: 15),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              height: 15,
              // color: Colors.red,
              margin: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Text(
                'Diagonal a Mavesa',
                style: TextStyle(
                    fontFamily: 'Archivo-Medium',
                    color: Color(0xff202020),
                    fontSize: 15),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              height: 15,
              // color: Colors.red,
              margin: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Text(
                'Cambio de billete de 20',
                style: TextStyle(
                    fontFamily: 'Archivo-Medium',
                    color: Color(0xff202020),
                    fontSize: 15),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              // color: Colors.red,
              margin: EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Row(
                  children: [
                    Container(
                      width: 150,
                      height: 100,
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(horizontal: 11),
                      child: MaterialButton(
                        color: Color(0xff62A87C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        disabledColor: Colors.grey,
                        elevation: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            'Aceptar',
                            style: const TextStyle(
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                    Container(
                      width: 150,
                      height: 100,
                      color: Colors.white,
                      margin: EdgeInsets.symmetric(horizontal: 1),
                      child: MaterialButton(
                        color: Color(0xffFF1D15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        disabledColor: Colors.grey,
                        elevation: 0,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          width: double.infinity,
                          alignment: Alignment.center,
                          child: Text(
                            'Rechazar',
                            style: const TextStyle(
                              fontFamily: 'Archivo',
                              fontWeight: FontWeight.w700,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        margin: EdgeInsets.only(top: 15, bottom: 25),
        width: double.infinity,
        height: 200,
        // color: Colors.red,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 5),
                blurRadius: 10,
              )
            ]),
      ),
    );
  }
}
