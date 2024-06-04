import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../models/result.dart';

Future<List<Result>> loadResults() async {
  final String jsonString = await rootBundle.loadString("assets/result.json");
  final List<dynamic> jsonResponse = jsonDecode(jsonString);
  return jsonResponse.map((result) => Result.fromJson(result)).toList();
}
