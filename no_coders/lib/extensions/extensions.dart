extension MapExtension on Map {
  int compareTo(Map anotherMap) {
    if (this["confidenceInClass"] < anotherMap["confidenceInClass"]) return 1;
    if (this["confidenceInClass"] > anotherMap["confidenceInClass"]) return -1;

    return 0;
  }
}

extension StringExtension on String {
  String capitalise() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
