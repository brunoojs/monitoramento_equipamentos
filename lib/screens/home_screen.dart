import 'package:flutter/material.dart';
import '../models/equipment.dart';
import '../services/equipment_service.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Equipment> equipments = [];

  @override
  void initState() {
    super.initState();
    loadEquipments();
  }

  Future<void> loadEquipments() async {
    final data = await EquipmentService.loadEquipments();
    setState(() {
      equipments = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Equipamentos'),
      ),
      body: ListView.builder(
        itemCount: equipments.length,
        itemBuilder: (context, index) {
          final equipment = equipments[index];
          return ListTile(
            title: Text(equipment.name),
            subtitle: Text('Status: ${equipment.status}'),
            trailing: Text('\$${equipment.hourlyValue}/h'),
          );
        },
      ),
    );
  }
}
