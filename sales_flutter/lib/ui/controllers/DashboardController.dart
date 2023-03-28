import 'dart:io';

import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:excel/excel.dart';
import 'package:flutter/cupertino.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';
import 'package:sales_flutter/ui/models/Sales.dart';
import 'package:sales_flutter/utils/ApiController.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

import '../models/Penjualan.dart';
import '../screens/PenjualanListScreen.dart';
import 'PenjualanListController.dart';

class DashboardController extends GetxController {
  Sales? salesInfo;
  Sales? get getSalesInfo => salesInfo;

  late List<Penjualan> _listPenjualanByMonth;
  List<Penjualan> get getListPenjualanByMonth => _listPenjualanByMonth;

  String? _monthName = "Januari";
  String? get getMonthName => _monthName;

  List<charts.Series<Penjualan, String>>? _chartData;
  List<charts.Series<Penjualan, String>>? get getChartData => _chartData;

  var initialLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    getApiData();
  }

  setMonthName(String monthName) {
    _monthName = monthName;
  }

  setSelectedMonth(int month) async {
    await getPenjualanDataByMonth(month);
  }

  getPenjualanDataByMonth(int month) async {
    initialLoading(true);
    //Ambil info penjualan
    var resInfo = await ApiController.getPenjualanDataByMonth(1, month);
    if (resInfo['Penjualan'] != null) {
      List<Penjualan> data = [];
      resInfo['Penjualan'].forEach((v) {
        data.add(Penjualan.fromJson(v));
      });

      _listPenjualanByMonth = data;

      //Masukin ke chart
      _chartData = [
        charts.Series(
            id: "dataPenjualan",
            data: _listPenjualanByMonth,
            domainFn: (Penjualan timeline, _) =>
                timeline.createdAt.day.toString(),
            measureFn: (Penjualan timeline, _) => timeline.penjualan)
      ];
    } else {
      _listPenjualanByMonth = [];
    }
    initialLoading(false);
  }

  getApiData() async {
    //Set Loading state
    initialLoading(true);

    //Ambil data Sales
    var resList = await ApiController.getSalesInfo(1);
    if (resList != null) {
      salesInfo = Sales.fromJson(resList);
    }

    await getPenjualanDataByMonth(1);

    initialLoading(false);
  }

  exportToExcel(BuildContext context) async {
    context.loaderOverlay.show();
    var excel = Excel.createExcel();

    var sheet = excel['Sheet1'];

    //set title header
    var cell = sheet.cell(CellIndex.indexByString("A1"));
    cell.value = "Bulan";

    var cell2 = sheet.cell(CellIndex.indexByString("B1"));
    cell2.value = "Total";

    var cell3 = sheet.cell(CellIndex.indexByString("C1"));
    cell3.value = "Komisi Diterima";

    for (int i = 0; i < salesInfo!.listTotalPenjualan!.length; i++) {
      List<dynamic> data = [
        salesInfo!.listTotalPenjualan![i].monthName,
        salesInfo!.listTotalPenjualan![i].totalPenjualan,
        salesInfo!.listTotalPenjualan![i].komisi,
      ];
      sheet.insertRowIterables(data, i + 1);
    }

    List<int>? fileBytes = excel.save();

    if (fileBytes != null) {
      Directory? tempDir = await DownloadsPathProvider.downloadsDirectory;
      String tempPath = tempDir!.path;

      File(join('$tempPath/Export.xlsx'))
        ..createSync(recursive: true)
        ..writeAsBytesSync(fileBytes);
      context.loaderOverlay.hide();
      await OpenFile.open('$tempPath/Export.xlsx');
    }
    context.loaderOverlay.hide();
  }

  navigateToPenjualanList() {
    Get.toNamed(PenjualanListScreen.routeName, arguments: salesInfo);
    Get.put(PenjualanListController());
  }
}
