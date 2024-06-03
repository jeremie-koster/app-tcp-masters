import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../models/result.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String input = await rootBundle.loadString("assets/result.json");
  Map<String, dynamic> data_decoded = jsonDecode(input);
  print("Loser score is : ${data_decoded['loser_score']}");
  print("Loser is : ${data_decoded['loser_id']}");
}

Future<List<Result>> loadResults() async {
  final String jsonString = await rootBundle.loadString("assets/result.json");
  final List<dynamic> jsonResponse = jsonDecode(jsonString);
  return jsonResponse.map((result) => Result.fromJson(result)).toList();
}
