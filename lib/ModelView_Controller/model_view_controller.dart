import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Models/model_class.dart';
class BarChartController extends GetxController {
  var barChartData = BarChartDataModel(days: []).obs;
  var isLoading = true.obs;
  // endpoint where this data is available...
  final String endpoint = "https://ezitech-c2c75-default-rtdb.firebaseio.com/.json";

  @override
  void onInit() {
    super.onInit();
    fetchBarChartData();
  }

  Future<void> fetchBarChartData() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(endpoint));

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        print("#### Fetched data: $jsonData");
        if (jsonData != null) {
          barChartData.value = BarChartDataModel.fromJson(jsonData);
        } else {
          barChartData.value = BarChartDataModel(days: []);
        }
      } else {
        Get.snackbar("Error", "Failed to load data");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
