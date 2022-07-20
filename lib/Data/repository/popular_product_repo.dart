import 'package:flutter_application_2/Data/api/api_client.dart' as api;
import 'package:flutter_application_2/utils/appConstants.dart';
import 'package:get/get_connect.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import '../../data/api/api_client.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;
  PopularProductRepo({required this.apiClient});

  Future<Response> getPopularProductlist() async {
    return await apiClient.getData(AppConstants.POPULAR_PRODUCT_URI);
  }
}
