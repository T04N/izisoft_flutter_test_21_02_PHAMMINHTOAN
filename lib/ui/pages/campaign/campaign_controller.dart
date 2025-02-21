import 'package:get/get.dart';
import 'package:izisoft_test/data/responses/campaign_detail_response.dart';

import '../../../data/repositories/campain/campaign_repository.dart';

class CampaignController extends GetxController {
  final CampaignRepository _campaignRepository = CampaignRepository();

  var campaign = Rxn<CampaignResponse>();
  var campaignList = <CampaignResponse>[].obs;

  var isLoading = false.obs;

@override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchCampaignList();
    print("object");
  }
  void fetchCampaignList() async {
    try {
      isLoading.value = true;
      final result = await _campaignRepository.getCampaignsList();
      if (result != null) {
        campaignList.value = result;
      }
    } finally {
      isLoading.value = false;
    }
  }


  void fetchCampaign(String id, {required Function? onSuccess}) async {
    try {
      isLoading.value = true;
      final result = await _campaignRepository.getCampaignById(id);
      if (result != null) {
        campaign.value = result;
        if(onSuccess!=null){
          onSuccess();
        }
      }
    } finally {
      isLoading.value = false;
    }
  }
}