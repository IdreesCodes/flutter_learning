/// TWD : 233.0
/// HUMIDEX : 41.2
/// TWS : 7.6
/// LOCALTIME : 2
/// HUMIDITY_IN : 100.0
/// WINDCHILL : 27.8
/// TEMP_IN : 49.0
/// ICON_NOW : "5"
/// ICON_FOR : "5"
/// TEMPERATURE : 27.8
/// TWS_GUST : 7.0
/// RAIN : 0.0
/// PRESSURE : 1009.1
/// LONGITUDE : 2.733
/// ACTIVE : "ON"
/// PRESSURE_TR : 0.7
/// RAIN_MONTH : 0.2
/// RAIN_DAY : 0.0
/// HUMIDITY : 90.0
/// TIME_STRING : "24-7-2023 09:13:32"
/// TIME : 1690182812000
/// LATITUDE : 39.5
/// WEATHER_DES : "Humid"

class DataModel {
  DataModel({
      num? twd, 
      num? humidex, 
      num? tws, 
      num? localtime, 
      num? humidityin, 
      num? windchill, 
      num? tempin, 
      String? iconnow, 
      String? iconfor, 
      num? temperature, 
      num? twsgust, 
      num? rain, 
      num? pressure, 
      num? longitude, 
      String? active, 
      num? pressuretr, 
      num? rainmonth, 
      num? rainday, 
      num? humidity, 
      String? timestring, 
      num? time, 
      num? latitude, 
      String? weatherdes,}){
    _twd = twd;
    _humidex = humidex;
    _tws = tws;
    _localtime = localtime;
    _humidityin = humidityin;
    _windchill = windchill;
    _tempin = tempin;
    _iconnow = iconnow;
    _iconfor = iconfor;
    _temperature = temperature;
    _twsgust = twsgust;
    _rain = rain;
    _pressure = pressure;
    _longitude = longitude;
    _active = active;
    _pressuretr = pressuretr;
    _rainmonth = rainmonth;
    _rainday = rainday;
    _humidity = humidity;
    _timestring = timestring;
    _time = time;
    _latitude = latitude;
    _weatherdes = weatherdes;
}

  DataModel.fromJson(dynamic json) {
    _twd = json['TWD'];
    _humidex = json['HUMIDEX'];
    _tws = json['TWS'];
    _localtime = json['LOCALTIME'];
    _humidityin = json['HUMIDITY_IN'];
    _windchill = json['WINDCHILL'];
    _tempin = json['TEMP_IN'];
    _iconnow = json['ICON_NOW'];
    _iconfor = json['ICON_FOR'];
    _temperature = json['TEMPERATURE'];
    _twsgust = json['TWS_GUST'];
    _rain = json['RAIN'];
    _pressure = json['PRESSURE'];
    _longitude = json['LONGITUDE'];
    _active = json['ACTIVE'];
    _pressuretr = json['PRESSURE_TR'];
    _rainmonth = json['RAIN_MONTH'];
    _rainday = json['RAIN_DAY'];
    _humidity = json['HUMIDITY'];
    _timestring = json['TIME_STRING'];
    _time = json['TIME'];
    _latitude = json['LATITUDE'];
    _weatherdes = json['WEATHER_DES'];
  }
  num? _twd;
  num? _humidex;
  num? _tws;
  num? _localtime;
  num? _humidityin;
  num? _windchill;
  num? _tempin;
  String? _iconnow;
  String? _iconfor;
  num? _temperature;
  num? _twsgust;
  num? _rain;
  num? _pressure;
  num? _longitude;
  String? _active;
  num? _pressuretr;
  num? _rainmonth;
  num? _rainday;
  num? _humidity;
  String? _timestring;
  num? _time;
  num? _latitude;
  String? _weatherdes;
DataModel copyWith({  num? twd,
  num? humidex,
  num? tws,
  num? localtime,
  num? humidityin,
  num? windchill,
  num? tempin,
  String? iconnow,
  String? iconfor,
  num? temperature,
  num? twsgust,
  num? rain,
  num? pressure,
  num? longitude,
  String? active,
  num? pressuretr,
  num? rainmonth,
  num? rainday,
  num? humidity,
  String? timestring,
  num? time,
  num? latitude,
  String? weatherdes,
}) => DataModel(  twd: twd ?? _twd,
  humidex: humidex ?? _humidex,
  tws: tws ?? _tws,
  localtime: localtime ?? _localtime,
  humidityin: humidityin ?? _humidityin,
  windchill: windchill ?? _windchill,
  tempin: tempin ?? _tempin,
  iconnow: iconnow ?? _iconnow,
  iconfor: iconfor ?? _iconfor,
  temperature: temperature ?? _temperature,
  twsgust: twsgust ?? _twsgust,
  rain: rain ?? _rain,
  pressure: pressure ?? _pressure,
  longitude: longitude ?? _longitude,
  active: active ?? _active,
  pressuretr: pressuretr ?? _pressuretr,
  rainmonth: rainmonth ?? _rainmonth,
  rainday: rainday ?? _rainday,
  humidity: humidity ?? _humidity,
  timestring: timestring ?? _timestring,
  time: time ?? _time,
  latitude: latitude ?? _latitude,
  weatherdes: weatherdes ?? _weatherdes,
);
  num? get twd => _twd;
  num? get humidex => _humidex;
  num? get tws => _tws;
  num? get localtime => _localtime;
  num? get humidityin => _humidityin;
  num? get windchill => _windchill;
  num? get tempin => _tempin;
  String? get iconnow => _iconnow;
  String? get iconfor => _iconfor;
  num? get temperature => _temperature;
  num? get twsgust => _twsgust;
  num? get rain => _rain;
  num? get pressure => _pressure;
  num? get longitude => _longitude;
  String? get active => _active;
  num? get pressuretr => _pressuretr;
  num? get rainmonth => _rainmonth;
  num? get rainday => _rainday;
  num? get humidity => _humidity;
  String? get timestring => _timestring;
  num? get time => _time;
  num? get latitude => _latitude;
  String? get weatherdes => _weatherdes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['TWD'] = _twd;
    map['HUMIDEX'] = _humidex;
    map['TWS'] = _tws;
    map['LOCALTIME'] = _localtime;
    map['HUMIDITY_IN'] = _humidityin;
    map['WINDCHILL'] = _windchill;
    map['TEMP_IN'] = _tempin;
    map['ICON_NOW'] = _iconnow;
    map['ICON_FOR'] = _iconfor;
    map['TEMPERATURE'] = _temperature;
    map['TWS_GUST'] = _twsgust;
    map['RAIN'] = _rain;
    map['PRESSURE'] = _pressure;
    map['LONGITUDE'] = _longitude;
    map['ACTIVE'] = _active;
    map['PRESSURE_TR'] = _pressuretr;
    map['RAIN_MONTH'] = _rainmonth;
    map['RAIN_DAY'] = _rainday;
    map['HUMIDITY'] = _humidity;
    map['TIME_STRING'] = _timestring;
    map['TIME'] = _time;
    map['LATITUDE'] = _latitude;
    map['WEATHER_DES'] = _weatherdes;
    return map;
  }

}