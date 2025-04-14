class CarModel {
  factory CarModel.fromJson(Map<String, dynamic> json) {
    return CarModel(
      number: json["number"],
      prepaid: json["prepaid"],
      driverName: json["driverName"],
      phoneNumber: json["phoneNumber"],
      carColor: json["carColor"],
      carModel: json["carModel"],
      signTime: json["signTime"],
      isPaid: json["isPaid"],
    );
  }
  CarModel({
    required this.number,
    required this.prepaid,
    required this.driverName,
    required this.phoneNumber,
    required this.carColor,
    required this.carModel,
    required this.signTime,
    required this.isPaid,
  });

  final String? number;
  final int? prepaid;
  final String? driverName;
  final String? phoneNumber;
  final String? carColor;
  final String? carModel;
  final DateTime? signTime;
  final bool? isPaid;

  CarModel copyWith({
    String? number,
    int? prepaid,
    String? driverName,
    String? phoneNumber,
    String? carColor,
    String? carModel,
    DateTime? signTime,
    bool? isPaid,
  }) {
    return CarModel(
      number: number ?? this.number,
      prepaid: prepaid ?? this.prepaid,
      driverName: driverName ?? this.driverName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      carColor: carColor ?? this.carColor,
      carModel: carModel ?? this.carModel,
      signTime: signTime ?? this.signTime,
      isPaid: isPaid ?? this.isPaid,
    );
  }

  Map<String, dynamic> toJson() => {
    "number": number,
    "prepaid": prepaid,
    "driverName": driverName,
    "phoneNumber": phoneNumber,
    "carColor": carColor,
    "carModel": carModel,
    "signTime": signTime,
    "isPaid": isPaid,
  };

  @override
  String toString() {
    return "$number, $prepaid, $driverName, $phoneNumber, $carColor, $carModel, $signTime, $isPaid, ";
  }
}
