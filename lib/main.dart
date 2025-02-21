import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izisoft_test/ui/main_view.dart';

import 'data/data_sources/remote/api_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Đảm bảo các service được khởi tạo trước
  await ApiManager().initialize(); // Khởi tạo API Manager

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainView(),
    );
  }
}