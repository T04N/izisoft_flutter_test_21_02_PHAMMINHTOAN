import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:izisoft_test/ui/pages/profile/profile_controller.dart';
import 'package:izisoft_test/ui/pages/profile/widgets/profile_option.dart';

class ProfileScreen extends StatelessWidget {
  final ProfileController _controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    _controller.fetchUser("1"); 

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
        centerTitle: true,
        title: Text("Profile",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Obx(() {
        if (_controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        }

        final user = _controller.user.value;
        if (user == null) {
          return Center(child: Text("User not found"));
        }

        return Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(user.avatar ?? "https://source.unsplash.com/100x100/?face"),
                  ),
                  Positioned(
                    bottom: 0,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.white,
                      child: Icon(Icons.camera_alt, size: 18, color: Colors.green),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 10),
            Text(user.name ?? "Unknown",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            Text(user.email ?? "No email", style: TextStyle(color: Colors.grey)),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ProfileOption(icon: Icons.person, title: "My Profile"),
                  Divider(thickness: 0.2),
                  ProfileOption(icon: Icons.credit_card, title: "Donation"),
                  Divider(thickness: 0.2),
                  ProfileOption(icon: Icons.location_on, title: "Address"),
                  Divider(thickness: 0.2),
                  ProfileOption(icon: Icons.email, title: "Contact / Email"),
                  Divider(thickness: 0.2),
                  ProfileOption(icon: Icons.notifications, title: "Notification"),
                  Divider(thickness: 0.2),
                  ProfileOption(icon: Icons.settings, title: "Setting"),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
