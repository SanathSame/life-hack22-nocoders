class ScoreModel {
  final int score;
  final String name;
  final String image;

  ScoreModel({required this.score, required this.name, required this.image});

  static ScoreModel fromJson(Map<String, dynamic> json) {
    return ScoreModel(
      name: json["name"],
      image: "",
      score: json["score"],
    );
  }
}
