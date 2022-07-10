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

var leaderBoard = [
  ScoreModel(score: 730, name: "Sheng Xuan Hui", image: ""),
  ScoreModel(score: 640, name: "Liew Si Wen", image: ""),
  ScoreModel(score: 567, name: "Ho Rui Min", image: ""),
  ScoreModel(score: 534, name: "Lew En Hui", image: ""),
  ScoreModel(score: 345, name: "Huang Kok Meng", image: ""),
  ScoreModel(score: 234, name: "Cheng Jia De", image: "")
];
