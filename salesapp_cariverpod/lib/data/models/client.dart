class Client {
  Client({
    required this.companyId,
    required this.branchOfficeId,
    required this.codClient,
    required this.ruc,
    required this.bussinesName,
    required this.email,
    required this.phone,
    required this.direction,
    required this.directionFiscal,
    required this.modulo,
    required this.orderAt,
    required this.latitude,
    required this.longitude,
    required this.distance,
    required this.subGiro,
    required this.giro,
    required this.listPrice,
    required this.perceptionFlag,
    required this.state,
    required this.createAt,
  });

  final int? companyId;
  final int? branchOfficeId;
  final int? codClient;
  final String? ruc;
  final String? bussinesName;
  final String? email;
  final String? phone;
  final String? direction;
  final String? directionFiscal;
  final String? modulo;
  final String? orderAt;
  final String? latitude;
  final String? longitude;
  final String? distance;
  final int? subGiro;
  final int? giro;
  final int? listPrice;
  final int? perceptionFlag;
  final String? state;
  final DateTime? createAt;

  factory Client.fromJson(Map<String, dynamic> json) => Client(
        companyId: json["CompanyId"],
        branchOfficeId: json["BranchOfficeId"],
        codClient: json["CodClient"],
        ruc: json["Ruc"],
        bussinesName: json["BussinesName"],
        email: json["Email"],
        phone: json["Phone"],
        direction: json["Direction"],
        directionFiscal: json["DirectionFiscal"],
        modulo: json["Modulo"],
        orderAt: json["Order_at"],
        latitude: json["Latitude"],
        longitude: json["Longitude"],
        distance: json["Distance"],
        subGiro: json["SubGiro"],
        giro: json["Giro"],
        listPrice: json["ListPrice"],
        perceptionFlag: json["PerceptionFlag"],
        state: json["State"],
        createAt: DateTime.parse(json["Create_at"]),
      );

  Map<String, dynamic> toJson() => {
        "CompanyId": companyId,
        "BranchOfficeId": branchOfficeId,
        "CodClient": codClient,
        "Ruc": ruc,
        "BussinesName": bussinesName,
        "Email": email,
        "Phone": phone,
        "Direction": direction,
        "DirectionFiscal": directionFiscal,
        "Modulo": modulo,
        "Order_at": orderAt,
        "Latitude": latitude,
        "Longitude": longitude,
        "Distance": distance,
        "SubGiro": subGiro,
        "Giro": giro,
        "ListPrice": listPrice,
        "PerceptionFlag": perceptionFlag,
        "State": state,
        "Create_at": createAt!.toIso8601String(),
      };
}
