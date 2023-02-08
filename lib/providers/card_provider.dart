import 'dart:convert';

import 'package:flutter/material.dart';

import '../util/IP.dart';
import '../util/sesion.dart';

import 'package:http/http.dart' as http;

class CardProvider extends ChangeNotifier {
  final String _baseUrl = IP.ip;

  final int? id;

  CardProvider(this.id);

  Future<bool> aceptarSolicitud() async {
    // print(login.taxista);
    // print(Sesion.taxista.usuario);
    final url = Uri.http(_baseUrl, '/api/carreras/$id');
    // print(id);
    final resp = await http.post(url);
    // print(login.taxista?.usuario);
    // print(resp.body);
    if (resp.statusCode == 200) {
      // Sesion.taxista.estado = 'Disponible';
      return true;
    } else {
      return false;
    }
  }

  Future<bool> rechazarSolicitud() async {
    // print(login.taxista);
    // print(Sesion.taxista.usuario);
    final url = Uri.http(_baseUrl, '/api/carreras/$id');
    // print(id);
    final resp = await http.put(url);
    // print(login.taxista?.usuario);
    // print(resp.body);
    if (resp.statusCode == 200) {
      // Sesion.taxista.estado = 'Disponible';
      return true;
    } else {
      return false;
    }
  }

  Future<bool> terminarSolicitud() async {
    // print(login.taxista);
    // print(Sesion.taxista.usuario);
    final url = Uri.http(_baseUrl, '/api/carreras/$id');
    // print(id);
    final resp = await http.get(url);
    // print(login.taxista?.usuario);
    // print(resp.body);
    if (resp.statusCode == 200) {
      // Sesion.taxista.estado = 'Disponible';
      return true;
    } else {
      return false;
    }
  }
}
