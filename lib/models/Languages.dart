class Language {
  final String idLanguage;
  final String languageCode;
  final String languageDescription;

  Language({
    required this.idLanguage,
    required this.languageCode,
    required this.languageDescription,
  });

  factory Language.fromJson(Map<String, dynamic> json) {
    return Language(
      idLanguage: json['idLanguage'],
      languageCode: json['languageCode'],
      languageDescription: json['languageDescription'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'idLanguage': idLanguage,
      'languageCode': languageCode,
      'languageDescription': languageDescription,
    };
  }
}
