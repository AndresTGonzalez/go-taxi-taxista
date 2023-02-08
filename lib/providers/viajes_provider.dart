import 'dart:convert';

import 'package:app_distribuidas_taxi/models/Solicitud.dart';
import 'package:app_distribuidas_taxi/util/IP.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import '../util/sesion.dart';

class ViajesProvider extends ChangeNotifier {
  final String _baseUrl = IP.ip;
  final List viajes = [];
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  ViajesProvider() {
    loadViajes();
  }

  Future loadViajes() async {
    final url =
        Uri.http(_baseUrl, '/api/solicitudes/${Sesion.taxista.usuario}');
    final resp = await http.get(url);
    if (resp.statusCode == 200) {
      var sol = jsonDecode(resp.body);
      for (sol in sol) {
        viajes.add(Solicitud.fromJson(sol));
      }
    }
    notifyListeners();
  }

  //TODO: Funcion para aceptar

  //TODO: Funcion para rechazar
}
