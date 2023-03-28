class Penjualan {
  late int id;
  late int penjualan;
  late DateTime createdAt;

  Penjualan(
      {required this.id, required this.penjualan, required this.createdAt});

  Penjualan.fromJson(Map<String, dynamic> json) {
    id = json['IdPenjualan'] is int ? json['IdPenjualan'] : int.parse(json['IdPenjualan']);
    penjualan = json['Penjualan'] is int ? json['Penjualan'] : int.parse(json['Penjualan']);
    createdAt = DateTime.parse(json['CreatedAt']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['IdPenjualan'] = id;
    data['Penjualan'] = penjualan;
    data['CreatedAt'] = createdAt.toString();
    return data;
  }
}
