import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izisoft_test/ui/pages/campaign/campaign_screen.dart';
import 'package:izisoft_test/ui/pages/home_page/widgets/card_campaign.dart';

import '../../../config/theme/app_colors.dart';
import '../campaign/campaign_controller.dart';
import 'home_view_controller.dart';

class HomeView extends StatelessWidget {
  final HomeViewModel viewModel = Get.put(HomeViewModel());
  final CampaignController campaignController = Get.put(CampaignController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Home", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        leading: Icon(Icons.menu),
        actions: [
          CircleAvatar(
            backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
          ),
          SizedBox(width: 15),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Thanh tìm kiếm
            TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                hintText: "Search...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 2),
                ),
              ),
            ),

            SizedBox(height: 12),

            // Banner
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(Icons.favorite, color: Colors.redAccent, size: 30),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      "Make The World More Meaningful",
                      style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Category
            Text("Category", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ["Education", "Disaster", "Medical"]
                  .map((category) => GestureDetector(
                onTap: () => viewModel.changeCategory(category),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
                  decoration: BoxDecoration(
                    color: viewModel.selectedCategory.value == category ? Colors.blueGrey : Colors.grey[300],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(color: viewModel.selectedCategory.value == category ? Colors.white : Colors.black),
                  ),
                ),
              ))
                  .toList(),
            )),

            SizedBox(height: 20),

            // Trending Campaign
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Trending Campaign", style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text("See More", style: TextStyle(color: Colors.black87)),
              ],
            ),

            SizedBox(height: 10),

            Expanded(
              child: Obx(() {
                if (campaignController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                }

                if (campaignController.campaignList.value == null) {
                  return Center(child: Text("No campaigns available"));
                }

                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: campaignController.campaignList.value.length ?? 0,
                  itemBuilder: (context, index) {
                    var campaign = campaignController.campaignList.value![index];
                    return GestureDetector(onTap: (){

                      CampaignController controller = Get.find();
                      controller.fetchCampaign(campaign.id, onSuccess: (){
                        Get.to(CampaignScreen(id: campaign.id.toString() ));
                      });
                    },
                      child: buildCampaignCard(
                        campaign.thumbnail,
                        campaign.title,
                        "${(campaign.endTime - campaign.startTime) ~/ (24 * 60 * 60)} days left",
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }


}