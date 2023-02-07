// To parse this JSON data, do
//
//     final taxista = taxistaFromJson(jsonString);

import 'dart:convert';

List<Taxista> taxistaFromJson(String str) =>
    List<Taxista>.from(json.decode(str).map((x) => Taxista.fromJson(x)));

String taxistaToJson(List<Taxista> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Taxista {
  Taxista({
    required this.usuario,
    required this.contrasenia,
    required this.nombre,
    required this.apellido,
    required this.cooperativa,
    required this.estado,
  });

  String usuario;
  String contrasenia;
  String nombre;
  String apellido;
  String cooperativa;
  String estado;

  factory Taxista.fromJson(Map<String, dynamic> json) => Taxista(
        usuario: json["usuario"],
        contrasenia: json["contrasenia"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        cooperativa: json["cooperativa"],
        estado: json["estado"],
      );

  Map<String, dynamic> toJson() => {
        '"usuario"': '"$usuario"',
        '"contrasenia"': '"$contrasenia"',
        '"nombre"': '"$nombre"',
        '"apellido"': '"$apellido"',
        '"cooperativa"': '"$cooperativa"',
        '"estado"': '"$estado"',
      };
}
