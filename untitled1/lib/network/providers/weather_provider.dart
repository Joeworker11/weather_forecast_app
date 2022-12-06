import 'package:untitled1/models/weather_result.dart';
import 'package:untitled1/network/network_provider.dart';

class WeatherProvider extends NetworkProvider {
  Future<WeatherResult?> getCityCurrentWeather(String cityName) async {            //future, tehát olyan változó, ami még a jövőben változhat - a városnév lehívásakor
    try {                                                                           // sorban lehívja a weboldal címet, az apikeyt-t és az adott nyelvet amit elrendeltünk előre
      String requestUrl = '$url/weather?q=$cityName$unit&appid=$apiKey$lang';
      print(requestUrl);
      var response = await httpClient.get(
        Uri.parse(requestUrl),

      );
      if (response.statusCode != 200) {                                            // ha az állapot "200" azaz nem elérhető akkor null értékkel tér vissza
        print("wrong statusCode: ${response.statusCode} as ${response.body}");
        return null;
      }
      print("Response: ${response.body}");                                         // ha minden oké jöjjön vissza mindennel amit bekértünk
      return createWeatherResultFromString(response.body);
    } catch (err) {
      print("Error ${err.toString()}");
      return null;
    }
  }
}
