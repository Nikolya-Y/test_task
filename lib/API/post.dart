import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../pathfinding/pathfinding.dart';
import '../screens/result.dart';
import 'jsonToString.dart';
import '../screens/home.dart';

void postGet(validUrl) async {
  final httpPackageUrl = Uri.parse(validUrl);
  final httpPackageInfo = await http.read(httpPackageUrl);
  // final httpPackageJson = json.decode(httpPackageInfo) as Map<String, dynamic>;
  // progressBarGetProgress(validUrl);
  decode(httpPackageInfo);
}

class Data {
  final String id;
  final List<dynamic> field;
  final Map<String, dynamic> start;
  final Map<String, dynamic> end;

  Data(
      {required this.id,
      required this.field,
      required this.start,
      required this.end});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        id: json['id'] as String,
        field: json['field'] as List<dynamic>,
        start: json['start'] as Map<String, dynamic>,
        end: json['end'] as Map<String, dynamic>);
  }
}

class PathFindingData {
  final bool error;
  final String message;
  final List<Data> data;

  PathFindingData(
      {required this.error, required this.message, required this.data});

  factory PathFindingData.fromJson(Map<String, dynamic> json) {
    return PathFindingData(
        error: json['error'] as bool,
        message: json['message'] as String,
        data: (json['data'] as List<dynamic>)
            .map(
              (dynamic e) => Data.fromJson(e as Map<String, dynamic>),
            )
            .toList());
  }
}

var gridWidgetData;
getDataResult() {
  return gridWidgetData;
}

void decode(httpPackageInfo) {
  final json = jsonDecode('[$httpPackageInfo]') as List<dynamic>;
  final pathFindingData = json
      .map((e) => PathFindingData.fromJson(e as Map<String, dynamic>))
      .toList();
  gridWidgetData = convertPathFindingDataListToGridDataList(pathFindingData);
}
