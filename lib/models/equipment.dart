class Equipment {
  final String id;
  final String name;
  final String status;
  final double hourlyValue;

  Equipment({
    required this.id,
    required this.name,
    required this.status,
    required this.hourlyValue,
  });

  factory Equipment.fromJson(Map<String, dynamic> json) {
    return Equipment(
      id: json['equipmentId'] ?? '',
      name: json['equipmentName'] ?? '',
      status: json['statusName'] ?? '',
      hourlyValue: (json['hourlyValue'] ?? 0).toDouble(),
    );
  }
}
