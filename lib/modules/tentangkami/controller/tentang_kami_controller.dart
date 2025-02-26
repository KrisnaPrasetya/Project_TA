import 'package:get/get.dart';

class TeamMember {
  final String name;
  final String position;
  // final String description;
  final String imagePath;

  TeamMember({
    required this.name,
    required this.position,
    // required this.description,
    required this.imagePath,
  });
}

class AboutUsController extends GetxController {
  final List<TeamMember> teamMembers = [
    TeamMember(
      name: 'NI NYOMAN SUPUWININGSIH, S.T., M.Kom',
      position: 'Pembimbing 1',
      // description:
      // 'Putri memiliki pengalaman lebih dari 10 tahun dalam bidang teknologi dan inovasi. Ia mendirikan perusahaan ini dengan visi untuk memberikan solusi yang dapat menjawab kebutuhan masyarakat.',
      imagePath: 'assets/images/profile1.jpg',
    ),
    TeamMember(
      name: 'Dr. DEVIANA, S.Pd., M.Pd',
      position: 'Pembimbing 2',
      // description:
      // 'Seorang ahli teknologi dengan latar belakang di bidang AI dan Machine Learning. Budi bertanggung jawab atas pengembangan teknologi dan inovasi produk perusahaan.',
      imagePath: 'assets/images/profile2.jpg',
    ),
    TeamMember(
      name: 'Kadek Aries Yudhia Krisna Prasetya',
      position: 'Pembuat',
      // description:
      // 'Anisa adalah seorang desainer UI/UX berpengalaman yang memastikan bahwa setiap produk kami tidak hanya fungsional tetapi juga menyenangkan untuk digunakan.',
      imagePath: 'assets/images/profile3.jpg',
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    // Initialize your variables or call methods here
  }

  @override
  void onReady() {
    super.onReady();
    // Called after the widget is rendered on screen
  }

  @override
  void onClose() {
    super.onClose();
    // Clean up resources here
  }
}
