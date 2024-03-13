import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class SignupRepository {
  final Map<String, String> _jsonContentHeader = {
    HttpHeaders.contentTypeHeader: 'application/json'
  };
  Future<Map<dynamic, dynamic>> signupApi(
      {required String username,
        required String email,
        required String password
      }) async {
    var response = await http.post(Uri.parse('http://10.0.2.2:3000/api/auth/signup'),
        body: json.encode(
            {'username': username, 'email': email, 'password': password}),
        headers: _jsonContentHeader
    );
    var errorResponse = json.decode(response.body);
    if (response.statusCode == 201) {
      return {"successful": json.decode(response.body)};
    }
    return {"errorMessage": errorResponse['message']};
  }
}
