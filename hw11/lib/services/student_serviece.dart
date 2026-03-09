import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/student.dart';

class StudentServiece {

  String url = "data/student.json";

  Future<List<Student>> getAllStudent ()  async {
    final String res = await rootBundle.loadString(url);
    List data = jsonDecode(res);
    return data.map((item) => Student.fromJson(item)).toList();
  }
}