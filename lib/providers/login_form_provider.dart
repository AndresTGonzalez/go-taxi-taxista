import 'dart:convert';

import 'package:app_distribuidas_taxi/models/taxista.dart';
import 'package:app_distribuidas_taxi/util/IP.dart';
import 'package:app_distribuidas_taxi/util/sesion.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final String _baseUrl = IP.ip;

  String email = '';
  String password = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    print('$email - $password');
    return formKey.currentState?.validate() ?? false;
  }

  Future<bool> login(Taxista taxista) async {
    final url = Uri.http(_baseUrl, '/api/taxistas/${taxista.usuario}');
    final resp = await http.post(url,
        body: jsonEncode({"contrasenia": taxista.contrasenia}),
        headers: {"Content-Type": "application/json"});
    if (resp.statusCode == 404) {
      return false;
    } else {
      Sesion.crearSesion(taxista.usuario);
      final aux = jsonDecode(resp.body);
      Sesion.taxista.estado = aux['estado'];
      return true;
    }
  }
}
