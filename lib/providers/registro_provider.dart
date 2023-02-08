import 'dart:convert';

import 'package:app_distribuidas_taxi/models/taxista.dart';
import 'package:app_distribuidas_taxi/util/IP.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegistroProvider extends ChangeNotifier {
  final String _baseUrl = IP.ip;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String repeatPassword = '';
  String cooperativa = '';
  String nombre = '';
  String apellido = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  bool isValidForm() {
    // print('$email - $password');
    return formKey.currentState?.validate() ?? false;
  }

  createTaxista(Taxista taxista) async {
    final url = Uri.http(_baseUrl, '/api/taxistas');
    final resp = await http.post(url,
        body: jsonEncode({
          "usuario": taxista.usuario,
          "contrasenia": taxista.contrasenia,
          "nombre": taxista.nombre,
          "apellido": taxista.apellido,
          "cooperativa": taxista.cooperativa,
          "estado": taxista.estado
        }),
        headers: {"Content-Type": "application/json"});
    final decodedData = json.decode(resp.body);
    return decodedData;
  }
}
