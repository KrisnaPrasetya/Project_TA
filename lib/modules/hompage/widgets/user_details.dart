import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:project_ta/core/routes/app_routes.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({super.key});

  // Instance of secure storage
  final _secureStorage = const FlutterSecureStorage();

  // Method to load avatar path
  Future<String> _loadAvatar() async {
    String? avatarPath = await _secureStorage.read(key: 'avatar');
    return avatarPath ?? ''; // Return empty string if no avatar is set
  }

  // Method to load name
  Future<String> _loadName() async {
    String? name = await _secureStorage.read(key: 'name');
    return name ?? 'User'; // Return "User" if no name is set
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(AppRoutes.profile),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        height: 60,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            // Profile Icon with FutureBuilder
            FutureBuilder<String>(
              future: _loadAvatar(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  );
                } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
                  return CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage(snapshot.data!),
                  );
                } else {
                  return const CircleAvatar(
                    radius: 20,
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person, color: Colors.black),
                  );
                }
              },
            ),
            const SizedBox(width: 12),
            // User Information with FutureBuilder
            FutureBuilder<String>(
              future: _loadName(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Text(
                    'Loading...',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else if (snapshot.hasData) {
                  return Text(
                    snapshot.data!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else {
                  return const Text(
                    'User',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
              },
            ),
            const Spacer(),
            // Badge
            Container(
              padding: const EdgeInsets.all(8),
              decoration: const BoxDecoration(
                color: Colors.amber,
                shape: BoxShape.circle,
              ),
              child: const Text(
                '2',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
