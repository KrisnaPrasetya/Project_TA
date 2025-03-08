// referensi_model.dart
class ReferensiModel {
  final String judul;
  final String penulis;
  final String tahun;
  final String penerbit;
  final String url;
  final String deskripsi;

  ReferensiModel({
    required this.judul,
    this.penulis = '',
    this.tahun = '',
    this.penerbit = '',
    this.url = '',
    this.deskripsi = '',
  });

  // Factory method untuk membuat objek dari JSON (jika Anda akan menggunakan API)
  factory ReferensiModel.fromJson(Map<String, dynamic> json) {
    return ReferensiModel(
      judul: json['judul'] ?? '',
      penulis: json['penulis'] ?? '',
      tahun: json['tahun'] ?? '',
      penerbit: json['penerbit'] ?? '',
      url: json['url'] ?? '',
      deskripsi: json['deskripsi'] ?? '',
    );
  }

  // Method untuk konversi objek ke JSON (jika diperlukan)
  Map<String, dynamic> toJson() {
    return {
      'judul': judul,
      'penulis': penulis,
      'tahun': tahun,
      'penerbit': penerbit,
      'url': url,
      'deskripsi': deskripsi,
    };
  }
}