import 'package:app_distribuidas_taxi/models/taxista.dart';
import 'package:flutter/material.dart';

class Sesion {
  static Taxista taxista = Taxista(
      usuario: '',
      contrasenia: '',
      nombre: '',
      apellido: '',
      cooperativa: '',
      estado: '');

  static crearSesion(String usuario) {
    taxista.usuario = usuario;
  }
}
