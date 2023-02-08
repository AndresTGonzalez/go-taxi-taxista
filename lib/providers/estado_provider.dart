import 'dart:convert';
import 'dart:math';

import 'package:app_distribuidas_taxi/providers/login_form_provider.dart';
import 'package:app_distribuidas_taxi/util/IP.dart';
import 'package:app_distribuidas_taxi/util/control.dart';
import 'package:app_distribuidas_taxi/util/sesion.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class EstadoProvider extends ChangeNotifier {
  final String _baseUrl = IP.ip;

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  LoginFormProvider login = LoginFormProvider();

  Future<bool> estadoOcupado() async {
    // print(login.taxista);
    print(Sesion.taxista.usuario);
    final url = Uri.http(_baseUrl, '/api/taxistas/${Sesion.taxista.usuario}');
    final resp = await http.put(url,
        body: jsonEncode({"estado": "Ocupado"}),
        headers: {"Content-Type": "application/json"});
    // print(login.taxista?.usuario);
    if (resp.statusCode == 200) {
      Sesion.taxista.estado = 'Ocupado';
      return true;
    } else {
      return false;
    }
  }

  Future<bool> estadoDisponible() async {
    // print(login.taxista);
    print(Sesion.taxista.usuario);
    final url = Uri.http(_baseUrl, '/api/taxistas/${Sesion.taxista.usuario}');
    final resp = await http.put(url,
        body: jsonEncode({"estado": "Disponible"}),
        headers: {"Content-Type": "application/json"});
    // print(login.taxista?.usuario);
    if (resp.statusCode == 200) {
      Sesion.taxista.estado = 'Disponible';
      return true;
    } else {
      return false;
    }
  }

  Future<bool> entrada() async {
    // print(login.taxista);
    print(Sesion.taxista.usuario);
    final url = Uri.http(_baseUrl, '/api/control');
    final resp = await http.post(url,
        body: jsonEncode({"taxista": Sesion.taxista.usuario}),
        headers: {"Content-Type": "application/json"});
    // print(login.taxista?.usuario);
    if (resp.statusCode == 200) {
      // Sesion.taxista.estado = 'Disponible';
      // print(resp.body);
      var id = jsonDecode(resp.body)['id'];
      // print(id);
      Control.idControl = id;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> salida() async {
    // print(login.taxista);
    print(Sesion.taxista.usuario);
    final url = Uri.http(_baseUrl, '/api/control/${Control.idControl}');
    final resp = await http.put(url,
        body: jsonEncode({"estado": "Disponible"}),
        headers: {"Content-Type": "application/json"});
    // print(login.taxista?.usuario);
    if (resp.statusCode == 200) {
      // Sesion.taxista.estado = 'Disponible';
      Control.idControl = -1;
      print(Control.idControl);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }
}
