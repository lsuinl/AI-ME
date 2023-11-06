import 'package:ai_me/common/model/error_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

String urls="";

Future<dynamic>  GetQuestion() async {
  http.Response response = await http.get(
      Uri.parse('$urls/chat/question'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      }
  );
  dynamic body =  jsonDecode(utf8.decode(response.bodyBytes));
  if(response.statusCode==200){
    print(body['data']);
    return body['data'];
  }
  ResponseErrorModel responsemodel = ResponseErrorModel.fromJson(body);
  return responsemodel.statusCode;//에러반환
}