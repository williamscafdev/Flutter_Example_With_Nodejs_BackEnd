class ResponseProcess {
  ResponseProcess({
    required this.status,
    required this.response,
  });

  final bool? status;
  final String? response;

  factory ResponseProcess.fromJson(Map<String, dynamic> json) =>
      ResponseProcess(
        status: json["status"],
        response: json["response"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "response": response,
      };
}
