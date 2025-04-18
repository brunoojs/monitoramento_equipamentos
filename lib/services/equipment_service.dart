import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/equipment.dart';

class EquipmentService {
  static Future<List<Equipment>> loadEquipments() async {
    final jsonString = await rootBundle.loadString('assets/data/equipment.json');
    final List<dynamic> jsonList = json.decode(jsonString);
    return jsonList.map((json) => Equipment.fromJson(json)).toList();
  }
}
