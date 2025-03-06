import 'dart:math';
import 'package:vector_math/vector_math.dart' as vm;
import 'package:flutter/material.dart';

class Cube {
  final double size;
  final Color color;

  const Cube({
    this.size = 100,
    this.color = Colors.cyan,
  });

  List<vm.Vector3> get vertices {
    return [
      vm.Vector3(-size / 2, -size / 2, -size / 2), // 0: front-bottom-left
      vm.Vector3(size / 2, -size / 2, -size / 2), // 1: front-bottom-right
      vm.Vector3(size / 2, size / 2, -size / 2), // 2: front-top-right
      vm.Vector3(-size / 2, size / 2, -size / 2), // 3: front-top-left
      vm.Vector3(-size / 2, -size / 2, size / 2), // 4: back-bottom-left
      vm.Vector3(size / 2, -size / 2, size / 2), // 5: back-bottom-right
      vm.Vector3(size / 2, size / 2, size / 2), // 6: back-top-right
      vm.Vector3(-size / 2, size / 2, size / 2), // 7: back-top-left
    ];
  }

  List<List<int>> get edges => [
        [0, 1], [1, 2], [2, 3], [3, 0], // Front face
        [4, 5], [5, 6], [6, 7], [7, 4], // Back face
        [0, 4], [1, 5], [2, 6], [3, 7], // Connecting edges
      ];

  List<List<int>> get faces => [
        [0, 1, 2, 3], // Front face
        [5, 4, 7, 6], // Back face
        [4, 5, 1, 0], // Bottom face
        [3, 2, 6, 7], // Top face
        [4, 0, 3, 7], // Left face
        [1, 5, 6, 2], // Right face
      ];

  List<List<int>> get faceEdges => [
        [0, 1, 2, 3],
        [4, 5, 6, 7],
        [8, 9, 0, 4],
        [2, 6, 10, 11],
        [8, 3, 11, 7],
        [1, 9, 5, 10],
      ];

  List<vm.Vector3> transform(vm.Matrix4 matrix) {
    return vertices
        .map((vertex) => matrix.transform3(vm.Vector3.copy(vertex)))
        .toList();
  }
}

class CubePainter extends CustomPainter {
  final List<vm.Vector3> vertices;
  final List<List<int>> edges;
  final List<List<int>> faceIndices;
  final List<List<int>> faceEdges;
  final Color color;
  final double cameraDistance;

  CubePainter({
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
    final viewVector = vm.Vector3(0, 0, -1);

    List<bool> faceVisible = List.filled(faceIndices.length, false);
    Set<int> visibleEdgeIndices = {};

    for (int i = 0; i < faceIndices.length; i++) {
      List<int> face = faceIndices[i];
      final v0 = vertices[face[0]];
      final v1 = vertices[face[1]];
      final v2 = vertices[face[2]];

      final edge1 = v1 - v0;
      final edge2 = v2 - v0;
      final normal = edge1.cross(edge2).normalized();
      faceVisible[i] = normal.dot(viewVector) < 0;

      if (faceVisible[i]) {
        for (int edgeIdx in faceEdges[i]) {
          visibleEdgeIndices.add(edgeIdx);
        }
      }
    }

    List<MapEntry<int, double>> sortedFaces = [];
    for (int i = 0; i < faceIndices.length; i++) {
      if (faceVisible[i]) {
        double sumZ = 0;
        for (int vertexIdx in faceIndices[i]) {
          sumZ += vertices[vertexIdx].z;
        }
        sortedFaces.add(MapEntry(i, sumZ / faceIndices[i].length));
      }
    }

    sortedFaces.sort((a, b) => b.value.compareTo(a.value));

    for (var entry in sortedFaces) {
      int faceIdx = entry.key;
      List<int> face = faceIndices[faceIdx];

      final path = Path();
      final startPoint = _project(vertices[face[0]], center);
      path.moveTo(startPoint.dx, startPoint.dy);

      for (int i = 1; i < face.length; i++) {
        final point = _project(vertices[face[i]], center);
        path.lineTo(point.dx, point.dy);
      }
      path.close();

      final fillPaint = Paint()
        ..color = color
        ..style = PaintingStyle.fill;

      canvas.drawPath(path, fillPaint);
    }

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

class CubeViewer extends StatefulWidget {
  const CubeViewer({super.key});

  @override
  State<CubeViewer> createState() => _CubeViewerState();
}

class _CubeViewerState extends State<CubeViewer> {
  double angleX = 0;
  double angleY = 0;
  double angleZ = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            color: Colors.white,
            child: CustomPaint(
              painter: CubePainter(
                vertices: _getTransformedVertices(),
                edges: Cube().edges,
                faceIndices: Cube().faces,
                faceEdges: Cube().faceEdges,
                color: Colors.cyan.shade300,
              ),
            ),
          ),
        ),
        _buildSlider('X', angleX, (v) => setState(() => angleX = v)),
        _buildSlider('Y', angleY, (v) => setState(() => angleY = v)),
        _buildSlider('Z', angleZ, (v) => setState(() => angleZ = v)),
      ],
    );
  }

  List<vm.Vector3> _getTransformedVertices() {
    final matrix = vm.Matrix4.identity();
    matrix.rotateX(angleX);
    matrix.rotateY(angleY);
    matrix.rotateZ(angleZ);
    return Cube().transform(matrix);
  }

  Widget _buildSlider(
      String axis, double value, ValueChanged<double> onChanged) {
    return Slider(
      min: 0,
      max: 2 * pi,
      value: value,
      label: axis,
      divisions: 100,
      onChanged: onChanged,
    );
  }
}

class CubeVisualizer extends StatelessWidget {
  final double angleX;
  final double angleY;
  final double angleZ;
  final Cube cube;

  const CubeVisualizer({
    super.key,
    this.angleX = 0,
    this.angleY = 0,
    this.angleZ = 0,
    this.cube = const Cube(),
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: CubePainter(
        vertices: _getTransformedVertices(),
        edges: cube.edges,
        faceIndices: cube.faces,
        faceEdges: cube.faceEdges,
        color: cube.color,
      ),
      size: const Size(double.infinity, double.infinity),
    );
  }

  List<vm.Vector3> _getTransformedVertices() {
    final matrix = vm.Matrix4.identity();
    matrix.rotateX(angleX);
    matrix.rotateY(angleY);
    matrix.rotateZ(angleZ);
    return cube.transform(matrix);
  }
}

class InteractiveCube extends StatefulWidget {
  const InteractiveCube({super.key});

  @override
  _InteractiveCubeState createState() => _InteractiveCubeState();
}

class _InteractiveCubeState extends State<InteractiveCube> {
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
        child: CubeVisualizer(
            angleX: angleX,
            angleY: angleY,
            cube: const Cube(
              size: 80,
              color: Colors.red,
            )),
      ),
    );
  }
}
