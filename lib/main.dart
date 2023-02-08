import 'package:app_distribuidas_taxi/screens/home_screen.dart';
import 'package:app_distribuidas_taxi/screens/registro_screen.dart';
import 'package:app_distribuidas_taxi/screens/screens.dart';
import 'package:app_distribuidas_taxi/screens/viaje_en_curso.screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Go Taxi - Conductor',
      initialRoute: 'login',
      routes: {
        'login': (context) => LoginScreen(),
        'home': (context) => HomeScreen(),
        'registro': (context) => Registro(),
        'viaje': (context) => ViajeEnCursoScreen(
              solicitud: null,
            ),
      },
    );
  }
}
