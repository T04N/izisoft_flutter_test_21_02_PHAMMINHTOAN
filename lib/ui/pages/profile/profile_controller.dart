import 'package:get/get.dart';
import 'package:izisoft_test/data/repositories/user/user_repository.dart';
import 'package:izisoft_test/data/responses/campaign_detail_response.dart';
import 'package:izisoft_test/data/responses/user_reponse.dart';

import '../../../data/repositories/campain/campaign_repository.dart';

class ProfileController extends GetxController {
  final UserRepository _campaignRepository = UserRepository();

  var user = Rxn<UserResponse>();
  var isLoading = false.obs;

  void fetchUser(String id) async {
    try {
      isLoading.value = true;
      final result = await _campaignRepository.getUserById(id);
      if (result != null) {
        user.value = result;
      }
    } finally {
      isLoading.value = false;
    }
  }
}