class DatesModel {
  DateTime? maximum;
  DateTime? minimum;

  DatesModel({required this.maximum, required this.minimum});

  factory DatesModel.fromJson(Map<String, dynamic> json) => DatesModel(
    minimum: DateTime.parse(json["minimum"] ?? DateTime.now().toString()),
    maximum: DateTime.parse(json["maximum"] ?? DateTime.now().toString()),
  );

  Map<String, dynamic> toJson() => {
    "maximum": "${maximum!.year.toString().padLeft(4, '0')}-${maximum!.month.toString().padLeft(2, '0')}-${maximum!.day.toString().padLeft(2, '0')}",
    "minimum": "${minimum!.year.toString().padLeft(4, '0')}-${minimum!.month.toString().padLeft(2, '0')}-${minimum!.day.toString().padLeft(2, '0')}",
  };
}