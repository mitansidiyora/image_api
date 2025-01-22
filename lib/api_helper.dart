import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

class APIHelper {
  APIHelper._();

  static APIHelper apiHelper = APIHelper._();

  Future<void> postImage({required File image}) async {
    String uri = 'https://api.imgur.com/3/image';

    Map data = {
      'image': image.path,
    };

    http.Response res = await http.post(
      Uri.parse(uri),
      headers: {
        'Authorization': 'Client-ID 6c797d33094cc49',
      },
      body: jsonEncode(data),
    );

    log("Status Code : ${res.statusCode}");
    var ans = jsonDecode(res.body);
    log("Data : $ans");
  }
}
