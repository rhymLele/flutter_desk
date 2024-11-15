class Student {
  final String id;
  final String name;
  final double mathScore;
  final double physicsScore;
  final double chemistryScore;
  final double averageScore;
  final String imageUrl; // Đường dẫn đến ảnh

  Student({
    required this.id,
    required this.name,
    required this.mathScore,
    required this.physicsScore,
    required this.chemistryScore,
    required this.averageScore,
    required this.imageUrl,
  });
}