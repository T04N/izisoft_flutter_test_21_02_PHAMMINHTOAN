import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izisoft_test/config/theme/app_colors.dart';
import 'package:izisoft_test/ui/pages/campaign/campaign_screen.dart';
import 'package:izisoft_test/ui/pages/home_page/home_page.dart';
import 'package:izisoft_test/ui/pages/profile/profile_screen.dart';
import 'main_view_model.dart';

class MainView extends StatelessWidget {
  final MainViewModel viewModel = Get.put(MainViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => IndexedStack(
        index: viewModel.currentIndex.value,
        children: [
          HomeView(),
          Center(child: Text("Search Screen")),
          CampaignScreen(),
          ProfileScreen(),
        ],
      )),
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: viewModel.currentIndex.value,
        onTap: viewModel.changeTab,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "null",activeIcon: Icon(Icons.home, color: AppColors.primary,)),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: "null",activeIcon: Icon(Icons.search, color: AppColors.primary,)),
          BottomNavigationBarItem(icon: Icon(Icons.notification_important_outlined,),label: "null",activeIcon: Icon(Icons.notifications, color: AppColors.primary,)),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: "",activeIcon: Icon(Icons.person, color: AppColors.primary,   )),
        ],
      )),
    );
  }
}