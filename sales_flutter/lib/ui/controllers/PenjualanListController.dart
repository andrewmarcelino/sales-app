import 'package:get/get.dart';

import '../../utils/ApiController.dart';
import '../models/Penjualan.dart';
import '../models/Sales.dart';

class PenjualanListController extends GetxController {
  Sales? _salesInfo;
  List<Penjualan> _penjualanList = [];
  List<Penjualan> get getPenjualanList => _penjualanList;

  var initialLoading = false.obs;

  void getSelectedSales() {
    if (Get.arguments != null) {
      _salesInfo = Get.arguments;
    }
  }

  getPenjualanData() async {
    if (_salesInfo != null) {
      initialLoading(true);
      //Ambil info penjualan
      var resInfo = await ApiController.getPenjualanData(_salesInfo!.id);
      if (resInfo['Penjualan'] != null) {
        List<Penjualan> data = [];
        resInfo['Penjualan'].forEach((v) {
          data.add(Penjualan.fromJson(v));
        });

        _penjualanList = data;
      } else {
        _penjualanList = [];
      }
      initialLoading(false);
    }
  }

  @override
  void onInit() {
    super.onInit();
    getSelectedSales();
    getPenjualanData();
  }
}
