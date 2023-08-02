class Space {
  String spaceId;
  String propertyName;
  String spaceTitle;
  String spaceDescription;
  double spaceRating;
  int spacePrice;
  List<String> spaceImages;
  int cindex;

  Space({
    required this.spaceId,
    required this.propertyName,
    required this.spaceTitle,
    required this.spaceDescription,
    required this.spaceRating,
    required this.spacePrice,
    required this.spaceImages,
    this.cindex=0,
  });

  factory Space.fromJson(Map<String, dynamic> json) {
    return Space(
      spaceId: json['spaceId'],
      propertyName: json['propertyName'],
      spaceTitle: json['spaceTitle'],
      spaceDescription: json['spaceDescription'],
      spaceRating: json['spaceRating'].toDouble(),
      spacePrice: json['spacePrice'],
      spaceImages: List<String>.from(json['spaceImages']),
    );
  }
}