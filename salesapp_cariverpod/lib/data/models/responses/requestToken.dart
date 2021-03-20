class RequestToken {
  RequestToken({
    required this.status,
    this.token,
    this.createAt,
    this.expire,
    this.message,
  });

  final bool status;
  final String? token;
  final DateTime? createAt;
  final int? expire;
  final String? message;

  factory RequestToken.fromJson(Map<String, dynamic> json) => RequestToken(
        status: json["status"],
        token: json["token"],
        createAt: json["createAt"] == null
            ? json["createAt"]
            : DateTime.parse(json["createAt"]),
        expire: json["expire"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "createAt": createAt!.toIso8601String(),
        "expire": expire,
        "message": message,
      };
}
