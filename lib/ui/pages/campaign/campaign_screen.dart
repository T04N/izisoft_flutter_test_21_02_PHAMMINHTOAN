import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/theme/app_colors.dart';
import 'campaign_controller.dart';

class CampaignScreen extends StatelessWidget {
  final CampaignController controller = Get.put(CampaignController());
  final String id;

  CampaignScreen({this.id = "1"});

  @override
  Widget build(BuildContext context) {
    controller.fetchCampaign(id, onSuccess: () {});

    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final campaign = controller.campaign.value;
        if (campaign == null) {
          return Center(child: Text("No campaign data available"));
        }

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Image.network(
                        campaign.thumbnail,
                        height: 500,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 20,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: IconButton(
                        icon: Icon(Icons.arrow_back, color: Colors.black),
                        onPressed: () => Get.back(),
                      ),
                    ),
                  ),
                ],
              ),

              // Nội dung dự án
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      campaign.title,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),

                    SizedBox(height: 10),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Target: \$${campaign.amountTarget}",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        Text(
                          "${((campaign.currentAmount / campaign.amountTarget) * 100).toStringAsFixed(0)}%",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),

                    SizedBox(height: 5),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: LinearProgressIndicator(
                        value: campaign.currentAmount / campaign.amountTarget,
                        minHeight: 8,
                        backgroundColor: Colors.grey[300],
                        color: AppColors.primary,
                      ),
                    ),

                    SizedBox(height: 15),

                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(campaign.author.avatar),
                          radius: 20,
                        ),
                        SizedBox(width: 10),
                        Text(
                          campaign.author.name,
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                            color: AppColors.bacgroundGreen,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text("Medical", style: TextStyle(color: Colors.green)),
                        )
                      ],
                    ),

                    SizedBox(height: 15),

                    Text(
                      "Every human needs healthy food, from kids to older people. Everyone wants to eat delicious and healthy food, but the elderly need compatible options...",
                      style: TextStyle(color: Colors.grey[600]),
                    ),

                    SizedBox(height: 15),

                    Row(
                      children: [
                        for (var i = 0; i < campaign.backers.length; i++)
                          if (i < 4)
                            Padding(
                              padding: EdgeInsets.only(right: 5),
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(campaign.backers[i].avatar),
                                radius: 15,
                              ),
                            ),
                        Text("+${campaign.backers.length} backers", style: TextStyle(fontSize: 14)),
                      ],
                    ),

                    SizedBox(height: 20),

                    // Nút hỗ trợ dự án
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.primary,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.symmetric(vertical: 15),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                        child: Text("BACK THIS PROJECT", style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}