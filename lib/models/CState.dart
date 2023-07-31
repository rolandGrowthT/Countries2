import 'cityV0.dart';
class CState {
  final String idState;
  final String stateName;
  final String stateCode;
  final List<CityVO> cityVO;

  CState({
    required this.idState,
    required this.stateName,
    required this.stateCode,
    required this.cityVO,
  });

  factory CState.fromJson(Map<String, dynamic> json) {
    return CState(
      idState: json['idState'],
      stateName: json['stateName'],
      stateCode: json['stateCode'],
      cityVO: List<CityVO>.from(
        json['cityVOList'].map((cityJson) => CityVO.fromJson(cityJson)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'idState': idState,
      'stateName': stateName,
      'stateCode': stateCode,
      'cityVOList': cityVO.map((city) => city.toJson()).toList(),
    };
  }
}
