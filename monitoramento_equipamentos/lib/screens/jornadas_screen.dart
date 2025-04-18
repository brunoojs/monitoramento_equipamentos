import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'jornada_detail_screen.dart';

class JornadasScreen extends StatelessWidget {
  const JornadasScreen({Key? key}) : super(key: key);

  void _goToJornadaDetail(BuildContext context, String placaId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => JornadaDetailScreen(jornadaId: placaId)),
    );
  }

  void _goToMapFullscreen(BuildContext context) {
    Navigator.pushNamed(context, '/full-map');
  }

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> placas = [
      {"id": "1", "placa": "ABC-1234"},
      {"id": "2", "placa": "XYZ-5678"},
      {"id": "3", "placa": "JKL-9012"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Jornadas'),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                child: FlutterMap(
                  options: MapOptions(
                    initialCenter: LatLng(-23.5505, -46.6333),
                    initialZoom: 10.0,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      userAgentPackageName: 'com.example.app',
                    ),
                  ],
                ),
              ),
              Positioned(
                right: 8,
                top: 8,
                child: IconButton(
                  icon: Icon(Icons.fullscreen, color: Colors.black87),
                  onPressed: () => _goToMapFullscreen(context),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Placas',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: placas.length,
              itemBuilder: (context, index) {
                final placa = placas[index];
                return Card(
                  child: ListTile(
                    title: Text(placa['placa'] ?? ''),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () => _goToJornadaDetail(context, placa['id']!),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
