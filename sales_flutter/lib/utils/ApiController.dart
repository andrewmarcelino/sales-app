import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiController {
  //TODO: CHANGE TO SERVER IP
  static String apiUrl = 'http://192.168.1.23/sales-app/api';

  static dynamic getSalesInfo(int id) async {
    try {
      http.Response response =
          await http.get(Uri.tryParse('$apiUrl/getSalesData.php?IdSales=$id')!);
      if (response.statusCode == 200) {
        ///decode data
        var result = jsonDecode(response.body);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      log('Error while getting data is $e');
    }
  }

  static dynamic getPenjualanData(int id) async {
    try {
      http.Response response = await http
          .get(Uri.tryParse('$apiUrl/getPenjualanList.php?IdSales=$id')!);
      if (response.statusCode == 200) {
        ///decode data
        var result = jsonDecode(response.body);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      log('Error while getting data is $e');
    }
  }

  static dynamic getPenjualanDataByMonth(int id, int monthCount) async {
    try {
      http.Response response = await http.get(Uri.tryParse(
          '$apiUrl/getPenjualanDataByMonth.php?IdSales=$id&Month=$monthCount')!);
      if (response.statusCode == 200) {
        ///decode data
        var result = jsonDecode(response.body);
        return result;
      } else {
        return null;
      }
    } catch (e) {
      log('Error while getting data is $e');
    }
  }
}
