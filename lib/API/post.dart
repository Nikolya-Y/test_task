import 'package:json_annotation/json_annotation.dart';

// part 'post.g.dart';

@JsonSerializable()
class NetMap {
  final String id;
  final List field;
  final Map start;
  final Map end;

  NetMap(this.id, this.field, this.start, this.end);
}






// import 'dart:convert';
// import 'dart:io';

// import 'package:flutter/material.dart';
// class ApiClient {
//   final client = HttpClient();

//   void getPosts() async {
//     final url = Uri.parse('https://flutter.webspark.dev/flutter/api');
//     final request = await client.getUrl(url);
//     final response = await request.close();
//     final jsonString = await response.transform(utf8.decoder).toList();
//     debugPrint(jsonString as String?);
//   }
// }
