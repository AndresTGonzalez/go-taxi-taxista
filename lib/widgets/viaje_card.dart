// ignore_for_file: sort_child_properties_last

import 'package:app_distribuidas_taxi/models/Solicitud.dart';
import 'package:app_distribuidas_taxi/providers/card_provider.dart';
import 'package:app_distribuidas_taxi/screens/viaje_en_curso.screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViajeCard extends StatelessWidget {
  final Solicitud solicitud;

  const ViajeCard({super.key, required this.solicitud});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: _CardContent(solicitud: solicitud),
      create: (context) => CardProvider(solicitud.id!),
    );
  }
}

class _CardContent extends StatelessWidget {
  const _CardContent({
    super.key,
    required this.solicitud,
  });

  final Solicitud solicitud;

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);
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
                solicitud.estado!.toUpperCase(),
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
                '${solicitud.callePrincipal!} y ${solicitud.calleSecundaria!}',
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
                solicitud.referencia!,
                style: TextStyle(
                    fontFamily: 'Archivo-Medium',
                    color: Color(0xff202020),
                    fontSize: 14),
              ),
            ),
            Container(
              width: double.infinity,
              alignment: Alignment.centerLeft,
              height: 15,
              // color: Colors.red,
              margin: EdgeInsets.only(left: 20, top: 10, right: 20),
              child: Text(
                solicitud.informacionAdicional!,
                style: TextStyle(
                    fontFamily: 'Archivo-Medium',
                    color: Color(0xff202020),
                    fontSize: 14),
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
                        onPressed: () async {
                          if (await cardProvider.aceptarSolicitud()) {
                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ViajeEnCursoScreen(
                                    solicitud: solicitud,
                                  ),
                                ));
                          } else {
                            print('error');
                          }
                          // Navigator.pushReplacement(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: (context) => ViajeEnCursoScreen(),
                          //     ));
                        },
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
                        onPressed: () async {
                          if (await cardProvider.rechazarSolicitud()) {
                            Navigator.popAndPushNamed(context, 'home');
                          }
                        },
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
