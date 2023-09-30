import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../common/model/error_model.dart';

String urls = "";

Future<int> PostAnswer(String content,String questionId) async {
  http.Response response = await http.post(
    Uri.parse('$urls/chat/answer'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      "answer": content,
      "questionId":questionId
    }),
  );
  dynamic body =  jsonDecode(utf8.decode(response.bodyBytes));
  ResponseErrorModel responsemodel = ResponseErrorModel.fromJson(body);
  return responsemodel.statusCode;//에러반환
}
