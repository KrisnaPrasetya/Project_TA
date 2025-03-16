import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:project_ta/modules/materipagescreen/widgets/interactive/guide.dart';
import 'package:vector_math/vector_math.dart' as vm;
import 'package:get/get.dart';

// Controller untuk mengelola state guide untuk objek 3D
// Catatan: Kelas ini juga didefinisikan di file InteractiveCube.dart
// Untuk produksi, seharusnya dipisahkan ke file tersendiri untuk menghindari duplikasi

class Balok {
  final double panjang;
  final double lebar;
  final double tinggi;
  final Color color;

  const Balok({
    this.panjang = 100,
    this.lebar = 60,
    this.tinggi = 80,
    this.color = Colors.cyan,
  });

  List<vm.Vector3> get vertices {
    return [
      vm.Vector3(-panjang / 2, -lebar / 2, -tinggi / 2), // 0: depan-kiri-bawah
      vm.Vector3(panjang / 2, -lebar / 2, -tinggi / 2), // 1: depan-kanan-bawah
      vm.Vector3(panjang / 2, lebar / 2, -tinggi / 2), // 2: depan-kanan-atas
      vm.Vector3(-panjang / 2, lebar / 2, -tinggi / 2), // 3: depan-kiri-atas
      vm.Vector3(
          -panjang / 2, -lebar / 2, tinggi / 2), // 4: belakang-kiri-bawah
      vm.Vector3(
          panjang / 2, -lebar / 2, tinggi / 2), // 5: belakang-kanan-bawah
      vm.Vector3(panjang / 2, lebar / 2, tinggi / 2), // 6: belakang-kanan-atas
      vm.Vector3(-panjang / 2, lebar / 2, tinggi / 2), // 7: belakang-kiri-atas
    ];
  }

  // Daftar semua edge (rusuk) balok
  List<List<int>> get edges => [
        [0, 1], [1, 2], [2, 3], [3, 0], // Depan (Front face)
        [4, 5], [5, 6], [6, 7], [7, 4], // Belakang (Back face)
        [0, 4], [1, 5], [2, 6], [3, 7], // Sisi penghubung
      ];

  // Daftar sisi-sisi balok (face)
  List<List<int>> get faces => [
        [0, 1, 2, 3], // Depan (Front face) - z negatif
        [5, 4, 7, 6], // Belakang (Back face) - z positif
        [4, 5, 1, 0], // Bawah (Bottom face) - y negatif
        [3, 2, 6, 7], // Atas (Top face) - y positif
        [4, 0, 3, 7], // Kiri (Left face) - x negatif
        [1, 5, 6, 2], // Kanan (Right face) - x positif
      ];

  // Edge untuk setiap face, diurutkan sesuai dengan urutan faces di atas
  List<List<int>> get faceEdges => [
        [0, 1, 2, 3], // Edge untuk face depan
        [4, 5, 6, 7], // Edge untuk face belakang
        [8, 9, 0, 4], // Edge untuk face bawah
        [2, 6, 10, 11], // Edge untuk face atas
        [8, 3, 11, 7], // Edge untuk face kiri
        [1, 9, 5, 10], // Edge untuk face kanan
      ];

  List<vm.Vector3> transform(vm.Matrix4 matrix) {
    return vertices
        .map((vertex) => matrix.transform3(vm.Vector3.copy(vertex)))
        .toList();
  }
}

class BalokPainter extends CustomPainter {
  final List<vm.Vector3> vertices;
  final List<List<int>> edges;
  final List<List<int>> faceIndices;
  final List<List<int>> faceEdges;
  final Color color;
  final double cameraDistance;

  BalokPainter({
    required this.vertices,
    required this.edges,
    required this.faceIndices,
    required this.faceEdges,
    required this.color,
    this.cameraDistance = 500,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    // Menghitung arah pandang kamera
    final viewVector = vm.Vector3(0, 0, -1);

    // Menentukan face mana yang terlihat
    List<bool> faceVisible = List.filled(faceIndices.length, false);
    Set<int> visibleEdgeIndices = {};

    // 1. Tentukan sisi mana yang terlihat dari arah pandang
    for (int i = 0; i < faceIndices.length; i++) {
      List<int> face = faceIndices[i];

      // Menghitung normal dengan cross product
      final v0 = vertices[face[0]];
      final v1 = vertices[face[1]];
      final v2 = vertices[face[2]];

      final edge1 = v1 - v0;
      final edge2 = v2 - v0;
      final normal = edge1.cross(edge2).normalized();

      // Face menghadap kamera jika dot product positif
      final dotProduct = normal.dot(viewVector);
      faceVisible[i] = dotProduct < 0;

      // Jika face terlihat, tambahkan edge-nya ke set edge yang terlihat
      if (faceVisible[i]) {
        for (int edgeIdx in faceEdges[i]) {
          visibleEdgeIndices.add(edgeIdx);
        }
      }
    }

    // 2. Z-sort face yang terlihat untuk rendering dari belakang ke depan
    List<MapEntry<int, double>> sortedFaces = [];
    for (int i = 0; i < faceIndices.length; i++) {
      if (faceVisible[i]) {
        // Hitung kedalaman rata-rata untuk face
        double sumZ = 0;
        for (int vertexIdx in faceIndices[i]) {
          sumZ += vertices[vertexIdx].z;
        }
        double avgZ = sumZ / faceIndices[i].length;
        sortedFaces.add(MapEntry(i, avgZ));
      }
    }

    // Urutkan dari belakang (Z besar) ke depan (Z kecil)
    sortedFaces.sort((a, b) => b.value.compareTo(a.value));

    // 3. Gambar faces terlihat sesuai urutan Z
    for (var entry in sortedFaces) {
      int faceIdx = entry.key;
      List<int> face = faceIndices[faceIdx];

      // Buat path untuk face
      final path = Path();
      final startPoint = _project(vertices[face[0]], center);
      path.moveTo(startPoint.dx, startPoint.dy);

      for (int i = 1; i < face.length; i++) {
        final point = _project(vertices[face[i]], center);
        path.lineTo(point.dx, point.dy);
      }
      path.close();

      // Gambar face dengan warna yang ditentukan
      final fillPaint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;

      canvas.drawPath(path, fillPaint);
    }

    // 4. Gambar edge yang terlihat
    final edgePaint = Paint()
      ..color = Colors.black
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    for (int edgeIdx in visibleEdgeIndices) {
      List<int> edge = edges[edgeIdx];
      final start = _project(vertices[edge[0]], center);
      final end = _project(vertices[edge[1]], center);
      canvas.drawLine(start, end, edgePaint);
    }
  }

  Offset _project(vm.Vector3 vertex, Offset center) {
    final ratio = cameraDistance / (cameraDistance + vertex.z);
    return Offset(
      center.dx + vertex.x * ratio,
      center.dy + vertex.y * ratio,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class BalokVisualizer extends StatelessWidget {
  final double angleX;
  final double angleY;
  final double angleZ;
  final Balok balok;

  const BalokVisualizer({
    super.key,
    this.angleX = 0,
    this.angleY = 0,
    this.angleZ = 0,
    this.balok = const Balok(),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: BalokPainter(
        vertices: _getTransformedVertices(),
        edges: balok.edges,
        faceIndices: balok.faces,
        faceEdges: balok.faceEdges,
        color: balok.color,
      ),
      size: const Size(double.infinity, double.infinity),
    );
  }

  List<vm.Vector3> _getTransformedVertices() {
    final matrix = vm.Matrix4.identity();
    matrix.rotateX(angleX);
    matrix.rotateY(angleY);
    matrix.rotateZ(angleZ);
    return balok.transform(matrix);
  }
}

class InteractiveBalok extends StatefulWidget {
  const InteractiveBalok({super.key});

  @override
  _InteractiveBalokState createState() => _InteractiveBalokState();
}

class _InteractiveBalokState extends State<InteractiveBalok> {
  // Menyesuaikan sudut awal untuk gambar contoh
  double angleX = 0.5;
  double angleY = -0.5;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        setState(() {
          angleY += details.delta.dx * 0.01;
          angleX -= details.delta.dy * 0.01;
        });
      },
      child: Container(
        color: Colors.white,
        child: BalokVisualizer(
          angleX: angleX,
          angleY: angleY,
          balok: Balok(
            panjang: 120,
            lebar: 60,
            tinggi: 80,
            color: Colors.cyan.shade300,
          ),
        ),
      ),
    );
  }
}

// Wrapper widget untuk InteractiveBalok dengan guide
class InteractiveBalokWithGuide extends StatefulWidget {
  final bool showGuide;
  final String guideText;

  const InteractiveBalokWithGuide({
    Key? key,
    this.showGuide = false,
    this.guideText = 'Geser untuk memutar balok',
  }) : super(key: key);

  @override
  State<InteractiveBalokWithGuide> createState() =>
      _InteractiveBalokWithGuideState();
}

class _InteractiveBalokWithGuideState extends State<InteractiveBalokWithGuide> {
  late Interactive3DGuideController _guideController;
  bool _showGuide = false;

  @override
  void initState() {
    super.initState();
    // Lazy initialization controller
    _guideController = Get.put(Interactive3DGuideController(), permanent: true);

    // Cek apakah perlu menampilkan guide
    if (widget.showGuide && !_guideController.isGuideShown('balok')) {
      Future.delayed(Duration.zero, () {
        if (mounted) {
          setState(() {
            _showGuide = true;
          });
        }
      });
    }
  }

  void _hideGuide() {
    if (_showGuide) {
      setState(() {
        _showGuide = false;
      });
      _guideController.markGuideAsShown('balok');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Original InteractiveBalok widget
        InteractiveBalok(),

        // Guide Overlay
        if (_showGuide)
          GestureDetector(
            onTap: _hideGuide,
            onPanStart: (_) => _hideGuide(),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.7),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 110,
                      child: Lottie.asset(
                        'assets/lottie/swipe.json',
                        fit: BoxFit.contain,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        widget.guideText,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
