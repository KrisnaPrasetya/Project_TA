// referensi_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_ta/modules/sumberreferensi/controller/referensi_controller.dart';

class ReferensiScreen extends StatelessWidget {
  const ReferensiScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ReferensiController>(
      init: ReferensiController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(left: 12),
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            title: const Text(
              'Referensi dan Sumber',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            elevation: 0,
            backgroundColor: Theme.of(context).primaryColor,
            leadingWidth: 30,
          ),
          body: controller.isLoading.value
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.referensiList.length,
                  itemBuilder: (context, index) {
                    final item = controller.referensiList[index];
                    return Card(
                      margin: const EdgeInsets.only(bottom: 16),
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(18),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Menambahkan ikon untuk membedakan tipe referensi
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  index == 0 ? Icons.book : Icons.videocam,
                                  color: index == 0
                                      ? Colors.brown.shade700
                                      : Colors.red.shade700,
                                  size: 24,
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: Text(
                                    item.judul,
                                    style: const TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            // Jika tipe Buku (index 0), tampilkan penulis
                            if (index == 0 && item.penulis.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: [
                                      const TextSpan(
                                        text: 'Penulis: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                      TextSpan(
                                        text: item.penulis,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (item.tahun.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: [
                                      const TextSpan(
                                        text: 'Tahun: ',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                      TextSpan(
                                        text: item.tahun,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            // Untuk buku tampilkan penerbit, untuk video tampilkan channel
                            if (item.penerbit.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: [
                                      TextSpan(
                                        text: index == 0
                                            ? 'Penerbit: '
                                            : 'Channel: ',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14,
                                        ),
                                      ),
                                      TextSpan(
                                        text: item.penerbit,
                                        style: const TextStyle(fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            // Menampilkan tipe sumber (Buku atau Video)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: [
                                    const TextSpan(
                                      text: 'Tipe: ',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                      ),
                                    ),
                                    TextSpan(
                                      text: index == 0 ? 'Buku' : 'Video',
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: index == 0
                                            ? Colors.brown.shade700
                                            : Colors.red.shade700,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            if (item.url.isNotEmpty) ...[
                              const SizedBox(height: 12),
                              ElevatedButton.icon(
                                onPressed: () => controller.launchURL(item.url),
                                icon: Icon(
                                  index == 0
                                      ? Icons.menu_book
                                      : Icons.play_circle_outline,
                                  color: Colors.white,
                                ),
                                label: Text(
                                  index == 0
                                      ? 'Buka Referensi Buku'
                                      : 'Tonton Video',
                                  style: const TextStyle(color: Colors.white),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: index == 0
                                      ? Colors.brown.shade600
                                      : Colors.red.shade600,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              ),
                            ],
                            if (item.deskripsi.isNotEmpty) ...[
                              const SizedBox(height: 8),
                              Text(
                                'Deskripsi: ${item.deskripsi}',
                                style: const TextStyle(fontSize: 14),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
        );
      },
    );
  }
}
