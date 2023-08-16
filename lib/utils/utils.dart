import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/weatherModel/DataModel.dart';
import '../model/weatherModel/NewDataModel.dart';


class Services{
  Future<DataModel> getData(context) async {
    late DataModel data;
    try {
      final response = await http.get(
        Uri.parse('https://api.oceandrivers.com:443/v1.0/getWeatherDisplay/cnarenal'),
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        data = DataModel.fromJson(item);
        print(item);// Mapping json response to our data model
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurred'+e.toString());
    }
    return data;
  }
  Future<NewDataModel> newGetData(context,double latitude, double longitude) async {
    // String baseUrl = 'https://api.openweathermap.org'; // Replace with your API base URL
    // String endpoint = 'data/2.5/weather?$latitude&$longitude&appid='; // Replace with the specific endpoint for your API
    // String apiKey = '4b49cd614f4f3045ada360780d96d038'; // Replace with your API key (if required)
    late NewDataModel data;
    try {
      final response = await http.get(
        Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=4b49cd614f4f3045ada360780d96d038'),
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        data = NewDataModel.fromJson(item);
        print(item);// Mapping json response to our data model
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurred'+e.toString());
    }
    return data;
  }
  Future<NewDataModel> searchData(context,String city) async {
    // String baseUrl = 'https://api.openweathermap.org'; // Replace with your API base URL
    // String endpoint = 'data/2.5/weather?$latitude&$longitude&appid='; // Replace with the specific endpoint for your API
    // String apiKey = '4b49cd614f4f3045ada360780d96d038'; // Replace with your API key (if required)
    late NewDataModel data;
    try {
      final response = await http.get(
        Uri.parse('http://api.openweathermap.org/data/2.5/weather?q=$city&APPID=037031c6198089fab3aab64739afbb11'),
      );
      if (response.statusCode == 200) {
        final item = json.decode(response.body);
        data = NewDataModel.fromJson(item);
        print(item);// Mapping json response to our data model
      } else {
        print('Error Occurred');
      }
    } catch (e) {
      print('Error Occurred'+e.toString());
    }
    return data;
  }
}