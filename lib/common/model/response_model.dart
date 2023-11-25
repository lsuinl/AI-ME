class ResponseModel {
  final int statusCode;
  final dynamic data;

  ResponseModel({
    required this.statusCode,
    required this.data,
  });

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
        statusCode: json["statusCode"],
        data: json["data"],
    );
  }
}