import 'package:meta/meta.dart' show required;

class RequestTokenModel {
  RequestTokenModel({
    @required this.ok,
    @required this.token,
    @required this.createAt,
    @required this.expire,
    @required this.mensaje,
  });

  final bool ok;
  final String token;
  final DateTime createAt;
  final int expire;
  final String mensaje;

  factory RequestTokenModel.fromJson(Map<String, dynamic> json) =>
      RequestTokenModel(
        ok: json["ok"],
        token: json["token"],
        createAt: DateTime.parse(json["createAt"]),
        expire: json["expire"],
        mensaje: json["mensaje"],
      );

  Map<String, dynamic> toJson() => {
        "ok": ok,
        "token": token,
        "createAt": createAt.toIso8601String(),
        "expire": expire,
        "mensaje": mensaje,
      };
}
