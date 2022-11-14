import 'package:http/http.dart' as http;
import 'dart:convert';

Future<double> getPrice(String id) async {
  try {
    var url = "api.coingecko.com/api/v3/coins/" + id;
    var response = await http.get(Uri.https(url));
    var json = jsonDecode(response.body);
    print(json);
    var value = json['market_data']['current_price']['usd'].toString();
    return double.parse(value);
  } catch (e) {
    print(e.toString());
    //throw error
    throw Exception('Failed to get price');
  }
}
