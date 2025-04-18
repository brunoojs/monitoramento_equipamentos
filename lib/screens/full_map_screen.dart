import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class FullMapScreen extends StatelessWidget {
  const FullMapScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mapa Completo')),
      body: FlutterMap(
        options: MapOptions(
          initialCenter: LatLng(-23.5505, -46.6333),
          initialZoom: 10.0,
        ),
        children: [
          TileLayer(
            urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
            userAgentPackageName: 'com.example.monitoramento',
          ),
        ],
      ),
    );
  }
}
