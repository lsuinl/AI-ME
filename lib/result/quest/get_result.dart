import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../common/model/error_model.dart';

String urls="";

Future<dynamic>  GetResult() async {
    http.Response response = await http.get(
      Uri.parse('$urls/api/reply'),
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