import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/PenjualanListController.dart';
import '../models/Penjualan.dart';

class PenjualanListScreen extends StatelessWidget {
  static const routeName = '/penjualanList';

  final PenjualanListController _penjualanListController = Get.find();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  PenjualanListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        bottomOpacity: 0.0,
        title: const Text('List Penjualan'),
      ),
      body: SafeArea(
        child: Obx(() => _penjualanListController.initialLoading.value
            ? const Center(child: CircularProgressIndicator())
            : _buildScreen()),
      ),
    );
  }

  Widget _buildScreen() {
    List<Penjualan> _penjualanList = _penjualanListController.getPenjualanList;
    return ListView.builder(
      itemBuilder: (context, index) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 4),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Penjualan Tanggal ${_penjualanList[index].createdAt.day}-${_penjualanList[index].createdAt.month}-${_penjualanList[index].createdAt.year}'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                      'Jumlah: Rp${_penjualanList[index].penjualan.toString()}',
                      style: Get.textTheme.headline6),
                ),
              ],
            ),
          ),
        );
      },
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: _penjualanList.length,
    );
  }
}
