import 'package:app_distribuidas_taxi/providers/providers.dart';
import 'package:app_distribuidas_taxi/util/sesion.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Estado extends StatelessWidget {
  const Estado({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: _EstadoBody(),
      create: (context) => EstadoProvider(),
    );
  }
}

class _EstadoBody extends StatelessWidget {
  const _EstadoBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final estadoProvider = Provider.of<EstadoProvider>(context);
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
                '¿Cuál es tu estado?',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 220,
              // color: Colors.red,
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 220,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.white,
                    child: MaterialButton(
                      onPressed: Sesion.taxista.estado == 'Disponible'
                          ? null
                          : () async {
                              if (await estadoProvider.estadoDisponible()) {
                                estadoProvider.isLoading = true;
                              } else {
                                estadoProvider.isLoading = false;
                              }
                            },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledColor: Colors.grey,
                      elevation: 0,
                      color: Color(0xff62A87C),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          'Disponible',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Archivo',
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.42,
                    height: 220,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.white,
                    child: MaterialButton(
                      onPressed: Sesion.taxista.estado == 'Ocupado'
                          ? null
                          : () async {
                              if (await estadoProvider.estadoOcupado()) {
                                estadoProvider.isLoading = true;
                              } else {
                                estadoProvider.isLoading = false;
                              }
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
                          'Ocupado',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Archivo',
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              alignment: Alignment.centerLeft,
              // color: Colors.red,
              child: Text(
                '¿Tu jornada?',
                style: TextStyle(
                    fontSize: 30,
                    fontFamily: 'Archivo',
                    fontWeight: FontWeight.w700),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 15),
              height: 220,
              // color: Colors.red,
              alignment: Alignment.center,
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: 220,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.white,
                    child: MaterialButton(
                      onPressed: () {},
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledColor: Colors.grey,
                      elevation: 0,
                      color: Color(0xff62A87C),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        width: double.infinity,
                        alignment: Alignment.center,
                        child: Text(
                          'Entrada',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Archivo',
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.42,
                    height: 220,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.white,
                    child: MaterialButton(
                      onPressed: () {},
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
                          'Salida',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Archivo',
                              fontSize: 20,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
