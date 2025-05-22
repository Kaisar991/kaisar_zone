class Project {
  final String title;
  final String imageUrl;
  final String description;
  final String type;       // Misalnya: Fashion, Commercial, Editorial
  final int year;          // Tahun project
  final int rating;        // 1–5 bintang

  Project({
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.type,
    required this.year,
    required this.rating,
  });
}
