import 'dart:convert';

import 'package:http/http.dart';

class APIHelper {
  final String baseURL = 'https://feltes.herokuapp.com/api/';

  Future getMyInfo() async {
    String url = baseURL + 'info';

    Response response = await get(url);

    if (response.statusCode == 200) {
      String data = response.body;

      return jsonDecode(data);
    } else {
      print("Failed to get MyInfo - Error Code: ${response.statusCode}");
    }
  }
}
