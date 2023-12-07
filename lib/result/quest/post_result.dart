import 'package:ai_me/common/model/response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../common/model/error_model.dart';
import '../../common/urls.dart';

Future<dynamic> PostResult(String mbti,String answer, List<Map<String, String>> detail_answer) async {
  print(detail_answer);
  http.Response response = await http.post(
    Uri.parse('$url/feedback'),
    headers: <String, String>{
      'Content-Type': 'application/json',
    },
    body: jsonEncode({
      "mbti": mbti,
      "common_answer":answer,
      "detail_answer":detail_answer
    }),
  );
  print(response.statusCode);
  dynamic body =  jsonDecode(utf8.decode(response.bodyBytes));
  if(response.statusCode==201){
    ResponseModel responsemodel = ResponseModel.fromJson(body);
    print(responsemodel.data['message'][0]);
    return responsemodel.data['mbti'];
  }
  else{
    ResponseErrorModel responsemodel = ResponseErrorModel.fromJson(body);
    print(responsemodel.statusCode);
    print(responsemodel.message);
    print(responsemodel.error);
    return responsemodel.statusCode;//에러반환
  }
}
