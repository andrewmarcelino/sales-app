import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loader_overlay/loader_overlay.dart';
import '../../utils/ApiController.dart';
import '../controllers/DashboardController.dart';
import '../models/Penjualan.dart';
import '../models/Sales.dart';
import '../../widgets/MonthSelect.dart';
import 'package:charts_flutter_new/flutter.dart' as charts;

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard';

  final DashboardController _dashboardController = Get.find();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      useDefaultLoading: true,
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0.0,
          bottomOpacity: 0.0,
          title: const Text('Dashboard Sales'),
        ),
        body: SafeArea(
          child: Obx(() => _dashboardController.initialLoading.value
              ? const Center(child: CircularProgressIndicator())
              : _buildScreen(context)),
        ),
      ),
    );
  }

  Widget _buildScreen(BuildContext context) {
    Sales? salesInfo = _dashboardController.getSalesInfo;
    List<charts.Series<Penjualan, String>>? chartData =
        _dashboardController.getChartData;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
              padding: const EdgeInsets.all(16),
              child: Center(
                  child: Row(
                children: [
                  CircleAvatar(
                      radius: 24,
                      backgroundImage:
                          NetworkImage('${ApiController.apiUrl}${salesInfo?.profileImage ?? "-"}')),
                  Container(
                    padding: const EdgeInsets.only(left: 24),
                    child: Center(
                      child: Text(salesInfo?.name ?? "-"),
                    ),
                  ),
                ],
              ))),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
          child: Card(
            child: InkWell(
              onTap: () {
                if (salesInfo != null) {
                  Get.dialog(const MonthSelect(), useSafeArea: true);
                }
              },
              child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Center(
                      child: Text(
                          'Filter By: ${_dashboardController.getMonthName ?? "-"}'))),
            ),
          ),
        ),
        Expanded(
          child: _dashboardController.getListPenjualanByMonth.isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 24.0, horizontal: 16),
                  child: charts.BarChart(chartData!, animate: true),
                )
              : const Text("No Data"),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
          child: OutlinedButton(
            onPressed: () {
              _dashboardController.navigateToPenjualanList();
            },
            child: const SizedBox(
                width: double.infinity,
                child: Center(child: Text("Lihat List Penjualan"))),
          ),
        ),
        Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
          child: ElevatedButton(
            onPressed: () {
              _dashboardController.exportToExcel(context);
            },
            child: const SizedBox(
                width: double.infinity,
                child: Center(child: Text("Export Data ke Excel"))),
          ),
        ),
      ],
    );
  }
}
