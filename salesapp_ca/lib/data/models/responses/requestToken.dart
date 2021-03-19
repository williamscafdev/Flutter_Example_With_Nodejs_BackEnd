class RequestToken {
  RequestToken({
    required this.status,
    required this.token,
    required this.createAt,
    required this.expire,
  });

  final bool status;
  final String token;
  final DateTime createAt;
  final int expire;

  factory RequestToken.fromJson(Map<String, dynamic> json) => RequestToken(
        status: json["status"],
        token: json["token"],
        createAt: DateTime.parse(json["createAt"]),
        expire: json["expire"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "createAt": createAt.toIso8601String(),
        "expire": expire,
      };
}
