import 'dart:convert';

class CoffeeModel {
  final int id;
  final String blend_name;
  final String origin;

  CoffeeModel({
    required this.id,
    required this.blend_name,
    required this.origin
  });

  factory CoffeeModel.fromJson(Map<String, dynamic> json) => CoffeeModel(
        origin: json["origin"] ?? '(No origin provided)',
        blend_name: json["blend_name"] ?? '(No blend name provided)',
        id: json["id"],
      );
}
