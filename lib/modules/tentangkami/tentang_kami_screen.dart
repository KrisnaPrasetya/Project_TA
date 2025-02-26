import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/tentangkami/controller/tentang_kami_controller.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AboutUsController>(
      init: AboutUsController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tentang Kami'),
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 20),
                _buildTeamSection(controller),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        children: [
          const Text(
            'Tim Kami',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Kenali anggota tim yang berdedikasi untuk memberikan layanan terbaik',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTeamSection(AboutUsController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          ...controller.teamMembers
              .map((member) => _buildTeamMemberCard(member)),
        ],
      ),
    );
  }

  Widget _buildTeamMemberCard(TeamMember member) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage(member.imagePath),
          ),
          const SizedBox(height: 15),
          Text(
            member.name,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            member.position,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            member.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialIcon(Icons.email),
              const SizedBox(width: 15),
              _buildSocialIcon(Icons.facebook),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Get.theme.primaryColor.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Get.theme.primaryColor,
        size: 20,
      ),
    );
  }
}
