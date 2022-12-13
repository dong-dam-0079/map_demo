import 'package:get/get.dart';
import 'package:map_demo/mock/mock_data.dart';
import 'package:map_demo/model/place_model.dart';

class MapController extends GetxController {
  final RxList<PlaceModel> places = <PlaceModel>[].obs;

  final RxBool isLoading = false.obs;

  Future<void> loadPlace() async {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2));
    // Load data from server
    places.value = MockData.listPlaces;

    isLoading.value = false;
  }
}
