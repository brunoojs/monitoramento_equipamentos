import 'package:flutter/material.dart';

class JornadaDetailScreen extends StatelessWidget {
  final String jornadaId;

  const JornadaDetailScreen({Key? key, required this.jornadaId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> dados = {
      "motorista": "João da Silva",
      "numeroViagem": "VJ-2024-001",
      "dataSaida": "10/04/2025",
      "dataChegada": "12/04/2025",
      "destino": "São Paulo - SP",
      "media": "68",
      "despesas": "R\$ 1.250,00",
      "frete": "R\$ 3.000,00",
      "total": "R\$ 1.750,00",
    };

    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes da Jornada'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Dados da Placa',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            _buildInfoRow('Motorista:', dados['motorista']),
            _buildInfoRow('Número da viagem:', dados['numeroViagem']),
            _buildInfoRow('Data de saída:', dados['dataSaida']),
            _buildInfoRow('Data de chegada:', dados['dataChegada']),
            _buildInfoRow('Destino:', dados['destino']),
            _buildInfoRow('Média:', '${dados['media']} km/h'),
            _buildInfoRow('Despesas:', dados['despesas']),
            _buildInfoRow('Frete:', dados['frete']),
            Divider(height: 32),
            _buildInfoRow(
              'Total da viagem:',
              dados['total'],
              isTotal: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                fontSize: isTotal ? 18 : 16,
              )),
          Text(value,
              style: TextStyle(
                fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
                fontSize: isTotal ? 18 : 16,
              )),
        ],
      ),
    );
  }
}
