import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_learning/model/weatherModel/NewDataModel.dart';
import 'package:flutter_learning/utils/utils.dart';
import 'package:geolocator/geolocator.dart';

import '../model/weatherModel/DataModel.dart';
import 'package:http/http.dart' as http;
class CountProvider with ChangeNotifier {


  int _count = 10;
  int get count =>  _count;

  void setCount (){
    _count++;
    notifyListeners();
  }
  void  getAllData() async {
    try {
      final response = await http
          .get(Uri.parse("https://api.oceandrivers.com:443/v1.0/getWeatherDisplay/cnarenal"));
      if (response.statusCode == 200) {
         print(response.body);
        notifyListeners();
      } else {
        print("else");
      }
    } catch (e) {
      log(e.toString());
    }
    notifyListeners();


  }

  DataModel? data;

  Future<DataModel?> getPostData(BuildContext context) async {
    try {
      data = await Services().getData(context);
      notifyListeners();
      return data;
    } catch (e) {
      return null;
    }
  }

  NewDataModel? data1 ;

  Future<NewDataModel?> newGetPostData(BuildContext context, lat, long) async {

   await Future.delayed(Duration (seconds: 10) , (){});
    try {
      data1 = await Services().newGetData(context, lat, long);
      notifyListeners();
      return data1;
    } catch (e) {
      return null;
    }
  }
  NewDataModel? data2 ;
  Future<NewDataModel?> newGetSearchData(BuildContext context, city) async {

    await Future.delayed(Duration (seconds: 3) , (){});
    try {
      data2 = await Services().searchData(context, city);
      notifyListeners();
      return data2;
    } catch (e) {
      return null;
    }
  }

  Future getUserLocation() async {
    double latitude;
    double longitude;
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
      latitude = position.latitude;
      longitude = position.longitude;


    } catch (e) {
      if (kDebugMode) {
        print('Error: $e');
      }
    }
    notifyListeners();
  }

}