import 'dart:convert';

import 'package:gov/utils/Transaction.dart';
import 'package:http/http.dart' as http;

// const baseUrl = "http://localhost:9999/";

class Controller {
  Future<List<Transaction>> get(String api) async {
    var url = Uri.parse(api);
    var response = await http.get(url);
    if (response.statusCode == 200) {
      List<dynamic> decoded = json.decode(response.body);
      List<Transaction> transactions =
          decoded.map((json) => Transaction.fromJson(json)).toList();
      transactions.forEach((element) {
        print(element);
      });
      return transactions;
    } else {
      throw Exception('Failed to load transaction');
    }
  }
}
