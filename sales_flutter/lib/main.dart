import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'ui/controllers/DashboardController.dart';
import 'ui/screens/DashboardScreen.dart';
import 'ui/screens/PenjualanListScreen.dart';

void main() async {
  Get.put(DashboardController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard Sales',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: DashboardScreen.routeName,
      getPages: [
        GetPage(
          name: DashboardScreen.routeName,
          page: () => DashboardScreen(),
        ),
        GetPage(
          name: PenjualanListScreen.routeName,
          page: () => PenjualanListScreen(),
        ),
      ],
    );
  }
}
