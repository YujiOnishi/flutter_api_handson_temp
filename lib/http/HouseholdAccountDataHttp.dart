import 'dart:convert';

import 'package:api/model/HouseholdAccountData.dart';
import 'package:http/http.dart' as http;
import 'dart:math' as math;
import 'dart:convert' as convert;

class HouseholdAccountDataHttp {
  static Future<List<HouseholdAccountData>>
      getHouseholdAccountDataList() async {
    List<HouseholdAccountData> householdAccountData = [];
    var random = new math.Random();
    householdAccountData = [];

    Uri url = Uri.parse(
        'https://script.google.com/macros/s/AKfycbwqSD3jNHnUvG30N0CKJyLEwqTtdRCs9ewuVTHDAOqf3dzea7_L/exec');

    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      var data = jsonResponse['data'];

      data.forEach((var item) {
        int id = int.parse(item['id']);
        int type = int.parse(item['type']);
        String detail = item['detail'];
        int cost = int.parse(item['cost']);

        householdAccountData.add(HouseholdAccountData(id, type, detail, cost));
      });
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return householdAccountData;
  }

  static void saveHouseholdAccountData(HouseholdAccountData data) async {
    print("saveHouseholdAccountData------------------------");
    var url = Uri.parse(
        'https://script.google.com/macros/s/AKfycbwqSD3jNHnUvG30N0CKJyLEwqTtdRCs9ewuVTHDAOqf3dzea7_L/exec');

    final now = DateTime.now();
    int cost = data.money;
    int type = data.type;
    String detail = data.item;
    int amount = 0;

    //final request = json.encode({"date": "2021-08-18", "cost": "10010", "type": "1", "detail": "", "amount": "30000"});

    final request = json.encode({
      'date': now.toString(),
      'cost': cost.toString(),
      'type': type.toString(),
      'detail': detail,
      'amount': amount.toString()
    });
    final headers = {
      "Content-Type": "application/x-www-form-urlencoded"
    };

    var response = await http.post(url,
        body: request,
        headers: headers);
    if (response.statusCode == 200) {
      print("success----------------------------------------");
    } else {
      print("error----------------------------------------");
    }
  }
}
