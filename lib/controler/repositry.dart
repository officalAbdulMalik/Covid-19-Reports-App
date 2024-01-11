import 'dart:convert';
import 'dart:io';
import 'package:covid19/model/country_state_model.dart';
import 'package:http/http.dart' as http;

import '../model/AppModel.dart';
import 'controler.dart';

class AppRepo {
  static List data = [];

  static String baseUrl = 'https://disease.sh/v3/covid-19/';
  static String worldstate = '${baseUrl}all';
  String countrystate = 'https://disease.sh/v3/covid-19/countries';

  static Future<int> fetchWorldState() async {
    try {
      final response = await http.get(Uri.parse(worldstate));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        print(response.statusCode);
        print(response.body);
        CountryControler.model = AppModel.fromJson(data);
        return response.statusCode;
      } else {
        throw Exception('Error');
      }
    } on SocketException catch (e) {
      return 501;
    }
  }

  Future<int> fethCountryState() async {
    final response = await http.get(Uri.parse(countrystate));
    var data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response.body);
      CountryControler.model = CountryStateModel.fromJson(data) as AppModel;
      return response.statusCode;
    } else {
      throw Exception('Error');
    }
  }
}
