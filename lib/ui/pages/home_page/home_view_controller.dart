import 'package:get/get.dart';

class HomeViewModel extends GetxController {
  var selectedCategory = "Disaster".obs;

  void changeCategory(String category) {
    selectedCategory.value = category;
  }





}

