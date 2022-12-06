import 'package:http/http.dart';

class NetworkProvider {                                                             // networkprovider osztály létrehozása
  final String apiKey = "aea12570bc96e4a5b54b91f651eaee15";                          // apikulcs amit használunk
  final String url = "https://api.openweathermap.org/data/2.5";                      // ezzel az URL-lel dolgozunk
  final String unit = "&units=metric";                                                // karakterek metrikus rendszerbe helyezve
  final String lang = "&lang=hu";                                                     // lang=hu - tehát magyar nyelven lesz
  Client httpClient = Client();                                                        // httpClient deklarálása
}
