import 'package:http/http.dart'as http;
import 'dart:convert';

class Network {
  final String url;
  Network(this.url);

//futre 타입으로 Pasing 데이터를 리턴함
   Future<dynamic> getJsonData() async {
     // chlwhd최종적으로 호출단계에서 파싱된 제이슨 값을 리턴해주어야 한다.
     http.Response response = await http.get(url); // uri를 통해 데이터를 다 가져올 때 까지 기다려야함(future response타입)
     if (response.statusCode == 200) {
       String jsonData = response.body;
       var parsingData = jsonDecode(jsonData);
       return parsingData;
     }
   }
}