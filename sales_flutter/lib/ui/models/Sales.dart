class Sales {
  late int id;
  late String name;
  late String profileImage;
  List<PenjualanBulanan>? listTotalPenjualan;

  Sales(
      {required this.id,
      required this.name,
      required this.profileImage,
      this.listTotalPenjualan});

  Sales.fromJson(Map<String, dynamic> json) {
    if (json['Penjualan'] != null) {
      List<PenjualanBulanan> data = [];
      json['Penjualan'].forEach((v) {
        data.add(PenjualanBulanan.fromJson(v));
      });
      listTotalPenjualan = data;
    }
    id = json['Id'] is int ? json['Id'] : int.parse(json['Id']);
    name = json['Name'];
    profileImage = json['ProfileImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (listTotalPenjualan != null) {
      data['Penjualan'] = listTotalPenjualan!.map((v) => v.toJson()).toList();
    }
    data['Id'] = id;
    data['Name'] = name;
    data['ProfileImage'] = profileImage;
    return data;
  }
}

class PenjualanBulanan {
  late int monthCount;
  late String monthName;
  late int totalPenjualan;
  late int komisi;

  PenjualanBulanan(
      {required this.monthCount,
      required this.monthName,
      required this.totalPenjualan,
      required this.komisi});

  PenjualanBulanan.fromJson(Map<String, dynamic> json) {
    monthCount = json['MonthCount'];
    monthName = json['BulanPenjualan'];
    totalPenjualan = int.parse(json['TotalPenjualan']);
    komisi = json['Komisi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MonthCount'] = monthCount;
    data['BulanPenjualan'] = monthName;
    data['TotalPenjualan'] = totalPenjualan;
    data['Komisi'] = komisi;
    return data;
  }
}
