// To parse this JSON data, do
//
//     final weatherResult = weatherResultFromMap(jsonString);

import 'dart:convert';

WeatherResult createWeatherResultFromString(String str) => WeatherResult.fromMap(json.decode(str));

//String weatherResultToMap(WeatherResult data) => json.encode(data.toMap());

class WeatherResult {                                                                          //weatherresult osztályon belüli összes lehívható adat változója
  WeatherResult({
    this.coord,
    this.weather,
    this.base,
    this.main,
    this.visibility,
    this.wind,
    this.clouds,
    this.dt,
    this.sys,
    this.timezone,
    this.id,
    this.name,
    this.cod,
  });

  final Coord ?coord;
  final List<Weather?> ?weather;
  final String ?base;
  final Main ?main;
  final int ?visibility;
  final Wind ?wind;
  final Clouds ?clouds;
  final int ?dt;
  final Sys ?sys;
  final int ?timezone;
  final int ?id;
  final String ?name;
  final int ?cod;

  factory WeatherResult.fromMap(Map<String, dynamic> json) => WeatherResult(                                     // objektum létrehozása json-ből
    coord: json["coord"] == null ? null : Coord.fromMap(json["coord"]),
    weather: json["weather"] == null ? null : List<Weather>.from(json["weather"].map((x) => Weather.fromMap(x))),
    base: json["base"] == null ? null : json["base"],
    main: json["main"] == null ? null : Main.fromMap(json["main"]),
    visibility: json["visibility"] == null ? null : json["visibility"],
    wind: json["wind"] == null ? null : Wind.fromMap(json["wind"]),
    clouds: json["clouds"] == null ? null : Clouds.fromMap(json["clouds"]),
    dt: json["dt"] == null ? null : json["dt"],
    sys: json["sys"] == null ? null : Sys.fromMap(json["sys"]),
    timezone: json["timezone"] == null ? null : json["timezone"],
    id: json["id"] == null ? null : json["id"],
    name: json["name"] ?? null,
    cod: json["cod"],
  );

  Map<String, dynamic> toMap() => {                                                                              // objektumból json generálása
    "coord": coord == null ? null : coord?.toMap(),
    "weather": weather == null ? null : List<dynamic>.from(weather?.map((x) => x?.toMap()) ?? []),
    "base": base == null ? null : base,
    "main": main == null ? null : main?.toMap(),
    "visibility": visibility == null ? null : visibility,
    "wind": wind == null ? null : wind?.toMap(),
    "clouds": clouds == null ? null : clouds?.toMap(),
    "dt": dt == null ? null : dt,
    "sys": sys == null ? null : sys?.toMap(),
    "timezone": timezone == null ? null : timezone,
    "id": id == null ? null : id,
    "name": name == null ? null : name,
    "cod": cod == null ? null : cod,
  };
}

class Clouds {                                                                                     // felhő osztály
  Clouds({
    this.all,
  });

  final int ?all;

  factory Clouds.fromMap(Map<String, dynamic> json) => Clouds(
    all: json["all"] == null ? null : json["all"],
  );

  Map<String, dynamic> toMap() => {
    "all": all == null ? null : all,
  };
}

class Coord {                                                                               // coord osztály
  Coord({
    this.lon,
    this.lat,
  });

  final double ?lon;
  final double ?lat;

  factory Coord.fromMap(Map<String, dynamic> json) => Coord(
    lon: json["lon"] == null ? null : json["lon"].toDouble(),
    lat: json["lat"] == null ? null : json["lat"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "lon": lon == null ? null : lon,
    "lat": lat == null ? null : lat,
  };
}

class Main {                                                                              //Fő osztályon belül: hőmérséklet, időérzet, min-és max hőmérséklet, nyomás, páratartalaom
  Main({
    this.temp,
    this.feelsLike,
    this.tempMin,
    this.tempMax,
    this.pressure,
    this.humidity,
  });

  final double ?temp;
  final double ?feelsLike;
  final double ?tempMin;
  final double ?tempMax;
  final int ?pressure;
  final int ?humidity;

  factory Main.fromMap(Map<String, dynamic> json) => Main(
    temp: json["temp"] == null ? null : json["temp"].toDouble(),
    feelsLike: json["feels_like"] == null ? null : json["feels_like"].toDouble(),
    tempMin: json["temp_min"] == null ? null : json["temp_min"].toDouble(),
    tempMax: json["temp_max"] == null ? null : json["temp_max"].toDouble(),
    pressure: json["pressure"] == null ? null : json["pressure"],
    humidity: json["humidity"] == null ? null : json["humidity"],
  );

  Map<String, dynamic> toMap() => {
    "temp": temp == null ? null : temp,
    "feels_like": feelsLike == null ? null : feelsLike,
    "temp_min": tempMin == null ? null : tempMin,
    "temp_max": tempMax == null ? null : tempMax,
    "pressure": pressure == null ? null : pressure,
    "humidity": humidity == null ? null : humidity,
  };
}

class Sys {                                                                          // típus, id, ország, napkelte, napnyugta
  Sys({
    this.type,
    this.id,
    this.country,
    this.sunrise,
    this.sunset,
  });

  final int ?type;
  final int ?id;
  final String ?country;
  final int ?sunrise;
  final int ?sunset;

  factory Sys.fromMap(Map<String, dynamic> json) => Sys(
    type: json["type"] == null ? null : json["type"],
    id: json["id"] == null ? null : json["id"],
    country: json["country"] == null ? null : json["country"],
    sunrise: json["sunrise"] == null ? null : json["sunrise"],
    sunset: json["sunset"] == null ? null : json["sunset"],
  );

  Map<String, dynamic> toMap() => {
    "type": type == null ? null : type,
    "id": id == null ? null : id,
    "country": country == null ? null : country,
    "sunrise": sunrise == null ? null : sunrise,
    "sunset": sunset == null ? null : sunset,
  };
}

class Weather {                                                                         // időjárás osztály: id, fő, leírás + az ikon
  Weather({
    this.id,
    this.main,
    this.description,
    this.icon,
  });

  final int? id;
  final String? main;
  final String? description;
  final String? icon;

  factory Weather.fromMap(Map<String, dynamic> json) => Weather(
    id: json["id"] == null ? null : json["id"],
    main: json["main"] == null ? null : json["main"],
    description: json["description"] == null ? null : json["description"],
    icon: json["icon"] == null ? null : json["icon"],
  );

  Map<String, dynamic> toMap() => {
    "id": id == null ? null : id,
    "main": main == null ? null : main,
    "description": description == null ? null : description,
    "icon": icon == null ? null : icon,
  };
}

class Wind {                                                                        // szél osztály: szélerősség, a fok, gust
  Wind({
    this.speed,
    this.deg,
    this.gust,
  });

  final double? speed;
  final int? deg;
  final double? gust;

  factory Wind.fromMap(Map<String, dynamic> json) => Wind(
    speed: json["speed"] == null ? null : json["speed"].toDouble(),
    deg: json["deg"] == null ? null : json["deg"],
    gust: json["gust"] == null ? null : json["gust"].toDouble(),
  );

  Map<String, dynamic> toMap() => {
    "speed": speed == null ? null : speed,
    "deg": deg == null ? null : deg,
    "gust": gust == null ? null : gust,
  };
}
