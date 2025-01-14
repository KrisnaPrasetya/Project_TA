import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:project_ta/modules/hompage/widgets/user_details.dart';

class CustomHeader extends StatelessWidget {
  const CustomHeader({super.key});

  final _secureStorage = const FlutterSecureStorage();

  Future<String> _loadName() async {
    String? name = await _secureStorage.read(key: 'name');
    return name ?? 'User'; 
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.60,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF1DE9B6), Color(0xFF64FFDA)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(24),
          bottomRight: Radius.circular(24),
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 50,
            left: 16,
            right: 16,
            child: UserDetailsWidget(),
          ),
          Positioned(
            top: 120,
            left: 16,
            right: 16,
            child: Container(
              height: 160,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Lottie.asset('assets/lottie/maskot.json'),
                  Expanded(
                    child: FutureBuilder<String>(
                      future: _loadName(),
                      builder: (context, snapshot) {
                        String name =
                            snapshot.connectionState == ConnectionState.waiting
                                ? '...'
                                : (snapshot.data ?? 'User');
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi, $name',
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            const Text(
                              'Langkah kecil hari ini bisa jadi kesuksesan besar esok.',
                              style: TextStyle(fontSize: 12),
                            ),
                            const Text(
                              'Yuk, mulai belajar! 💡',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 12),
                            ),
                          ],
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 300,
            left: 42,
            right: 42,
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              height: 40,
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
              child: const Text(
                'Persentase Hasil Belajar',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Container(
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
