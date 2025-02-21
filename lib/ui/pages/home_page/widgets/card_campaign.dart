import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/theme/app_colors.dart';

Widget buildCampaignCard(String imageUrl, String title, String daysLeft) {
  return Container(
    width: 160,
    margin: EdgeInsets.only(right: 15),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Stack(
            children: [
              Image.network(imageUrl, width: 400, fit: BoxFit.cover),
              Positioned(
                bottom: 5,
                left: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                  child: Text(daysLeft, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ),
              Positioned(
                top: 5,
                right: 10,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5)),
                  child: Icon(Icons.bookmark_add_outlined),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Text(title, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
        Container(
          width: double.infinity,
          height: 8,
          decoration: BoxDecoration(
            color: AppColors.borderColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: LinearProgressIndicator(
              value: 0.48,
              backgroundColor: AppColors.borderColor,
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.secondary),
            ),
          ),
        )
      ],
    ),
  );
}