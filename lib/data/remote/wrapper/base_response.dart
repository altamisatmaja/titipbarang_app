class BaseResponse {
  BaseResponse({
    this.message,
    this.status,
  });

  final String? message;
  final int? status;

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        message: json['message'],
        status: json['status'],
      );

  Map<String, dynamic> tojson() => {
        'message': message,
        'status': status,
      };
}
