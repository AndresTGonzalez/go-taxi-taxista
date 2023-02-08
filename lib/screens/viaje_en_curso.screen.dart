import 'package:app_distribuidas_taxi/models/Solicitud.dart';
import 'package:app_distribuidas_taxi/providers/card_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViajeEnCursoScreen extends StatelessWidget {
  final Solicitud? solicitud;

  const ViajeEnCursoScreen({super.key, required this.solicitud});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: _Content(),
      create: (context) => CardProvider(solicitud?.id),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final cardProvider = Provider.of<CardProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.centerLeft,
                // color: Colors.red,
                margin:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 25),
                child: const Text(
                  'Viaje en curso',
                  style: TextStyle(
                      fontSize: 35,
                      fontFamily: 'Archivo-Bold',
                      fontWeight: FontWeight.w700),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Image.asset('images/taxi.png'),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: 150,
                height: 50,
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 1),
                child: MaterialButton(
                  color: const Color(0xffFF1D15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  disabledColor: Colors.grey,
                  elevation: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: const Text(
                      'Terminar Viaje',
                      style: TextStyle(
                        fontFamily: 'Archivo',
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  onPressed: () async {
                    if (await cardProvider.terminarSolicitud()) {
                      // ignore: use_build_context_synchronously
                      Navigator.popAndPushNamed(context, 'home');
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
