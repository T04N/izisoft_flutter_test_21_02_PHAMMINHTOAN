import 'package:dio/dio.dart';
import 'package:izisoft_test/data/responses/user_reponse.dart';

import '../../data_sources/remote/api_service.dart';

class UserRepository {
  Future<UserResponse?> getUserById(String id) async {
    try {
      final response = await ApiManager().service.getUserById(id);
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
