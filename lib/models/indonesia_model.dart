import 'package:flutter/foundation.dart';

class Indonesia {
  final String name;
  final int positif;
  final int sembuh;
  final int meninggal;

  Indonesia({
    @required this.name,
    @required this.positif,
    @required this.sembuh,
    @required this.meninggal,
  });

  factory Indonesia.fromJson(Map<String, dynamic> json) {
    return Indonesia(
      name: json['name'] as String,
      positif: json['positif'] as int,
      sembuh: json['sembuh'] as int,
      meninggal: json['meninggal'] as int,
    );
  }
}
