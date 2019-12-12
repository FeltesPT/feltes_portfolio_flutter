import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';

class APIHelper {
  final String baseURL = kIsWeb
      ? 'https://cors-anywhere.herokuapp.com/https://feltes.herokuapp.com/api/'
      : 'https://feltes.herokuapp.com/api/';

  Future getMyInfo() async {
    return getDataFrom('info');
  }

  Future getPortfolio() async {
    return getDataFrom('portfolio');
  }

  Future getDataFrom(String endpoint) async {
    String url = baseURL + endpoint;

    Response response = await get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print("Failed to get $endpoint - Error Code: ${response.statusCode}");
    }
  }
}
