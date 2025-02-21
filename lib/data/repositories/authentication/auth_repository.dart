// import 'package:dio/dio.dart';
//
// import '../../data_sources/remote/api_service.dart';
// import '../../responses/authentication_response.dart';
//
// class AuthRepository {
//   Future<AuthenticationResponse?> login(String username, String password) async {
//     try {
//       final response = await ApiManager().service.login(username, password);
//       return response;
//     } on DioError catch (e) {
//       if (e.response != null) {
//         print('Server Error: ${e.response?.data}');
//       } else {
//         print('Connection Error: ${e.message}');
//       }
//       return null;
//     } catch (e) {
//       print('Unknown Error: $e');
//       return null;
//     }
//   }
// }
