import 'dart:convert';
import "package:http/http.dart";
import 'package:tracking/models/indonesia_model.dart';
import 'dart:async';

class GetIndonesia {
  final String apiUrl = "http://candraherdiansyah.herokuapp.com/api/indonesia";

  Future<List<Indonesia>> manggilIndonesiaData() async {
    Response res = await get(apiUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body)['data'];

      List<Indonesia> indonesiaData = body
          .map((dynamic indonesia) => Indonesia.fromJson(indonesia))
          .toList();
      return indonesiaData;
    } else {
      throw "data not found";
    }
  }
}
