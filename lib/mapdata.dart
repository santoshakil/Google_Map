import 'dart:convert';

List<MapDataModel> mapDataModelFromJson(String str) => List<MapDataModel>.from(json.decode(str).map((x) => MapDataModel.fromJson(x)));

String mapDataModelToJson(List<MapDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MapDataModel {
    MapDataModel({
        this.id,
        this.jobtype,
        this.jobtitle,
        this.companyName,
        this.latitude,
        this.longitude,
    });

    String id;
    String jobtype;
    String jobtitle;
    String companyName;
    String latitude;
    String longitude;

    factory MapDataModel.fromJson(Map<String, dynamic> json) => MapDataModel(
        id: json["id"],
        jobtype: json["jobtype"],
        jobtitle: json["jobtitle"],
        companyName: json["companyName"],
        latitude: json["latitude"],
        longitude: json["longitude"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "jobtype": jobtype,
        "jobtitle": jobtitle,
        "companyName": companyName,
        "latitude": latitude,
        "longitude": longitude,
    };
}
