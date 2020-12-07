import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_map_flutter_app/url.dart';
import 'package:http/http.dart' as http;
import 'package:google_map_flutter_app/mapdata.dart';

// class ApIManager {
//   Future<MapDataModel> getJobs() async {
//     var client = http.Client();
//     var newsModel;
//     try {
//       var response = await client.get(Strings.jobs_url);
//       if (response.statusCode == 200) {
//         var jsonString = response.body;
//         var jsonMap = json.decode(jsonString);
//         newsModel = MapDataModel.fromJson(jsonMap);
//         print(newsModel);
//       }
//     } catch (Exception) {
//       return newsModel;
//     }
//     return newsModel;
//   }
// }

Future<List<MapDataModel>> fetchjob() async{
  String url = "https://raw.githubusercontent.com/Kakon007/jobap/main/job.json";
  final response=await http.get(url);
  return mapDataModelFromJson(response.body);
}