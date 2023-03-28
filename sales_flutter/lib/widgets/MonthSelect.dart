import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sales_flutter/ui/controllers/DashboardController.dart';

import '../utils/Constants.dart';

class MonthSelect extends StatelessWidget {
  const MonthSelect({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, int> monthList = ContantVariables.monthList;
    return Dialog(
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(monthList.keys.elementAt(index)),
            shape:
                const Border(bottom: BorderSide(color: Colors.grey, width: .5)),
            onTap: () {
              DashboardController dashboardController = Get.find();
              dashboardController
                  .setMonthName(monthList.keys.elementAt(index));
              dashboardController
                  .setSelectedMonth(monthList.values.elementAt(index));
              Get.back();
            },
          );
        },
        itemCount: monthList.length,
      ),
    );
  }
}
