import 'package:dio/dio.dart';

import '../../data_sources/remote/api_service.dart';
import '../../responses/campaign_detail_response.dart';

class CampaignRepository {

  Future<List<CampaignResponse>?> getCampaignsList() async {
    try {
      final response = await ApiManager().service.getCampaignsList();
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        print('Server Error: ${e.response?.data}');
      } else {
        print('Connection Error: ${e.message}');
      }
      return null;
    } catch (e) {
      print('Unknown Error: $e');
      return null;
    }
  }


  Future<CampaignResponse?> getCampaignById(String id) async {
    try {
      final response = await ApiManager().service.getCampaignById(id);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        print('Server Error: ${e.response?.data}');
      } else {
        print('Connection Error: ${e.message}');
      }
      return null;
    } catch (e) {
      print('Unknown Error: $e');
      return null;
    }
  }
}
