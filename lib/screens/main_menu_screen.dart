import 'package:flutter/material.dart';
import 'package:monitoramento_equipamentos/screens/jornada_detail_screen.dart';
import 'package:monitoramento_equipamentos/screens/profile_screen.dart';
import 'package:monitoramento_equipamentos/screens/jornadas_screen.dart';


class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({Key? key}) : super(key: key);

  void _goToProfile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProfileScreen()),
    );
  }

  void _goToJornadaDetail(BuildContext context, String jornadaId) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => JornadaDetailScreen(jornadaId: '1')),
    );
  }

  void _goToJornadasComMapa(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => JornadasScreen()),
    );
  }


  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> jornadas = [
      {"id": "1", "nome": "Jornada 001"},
      {"id": "2", "nome": "Jornada 002"},
      {"id": "3", "nome": "Jornada 003"},
    ];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              'assets/images/logo.png',
              height: 40,
            ),
            IconButton(
              icon: Icon(Icons.account_circle, size: 30),
              onPressed: () => _goToProfile(context),
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Jornadas disponíveis',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            ElevatedButton.icon(
              onPressed: () => _goToJornadasComMapa(context),
              icon: Icon(Icons.map),
              label: Text('Visualizar Jornadas no Mapa'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: jornadas.length,
                itemBuilder: (context, index) {
                  final jornada = jornadas[index];
                  return Card(
                    child: ListTile(
                      title: Text(jornada['nome'] ?? ''),
                      trailing: Icon(Icons.arrow_forward_ios),
                      onTap: () => _goToJornadaDetail(context, jornada['id']!),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
