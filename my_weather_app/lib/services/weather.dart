import '../services/location.dart';
import 'package:clima/services/networking.dart';

Location location = Location();
String apiKey = 'af076e2f48a58f364ba200901c9f8917';
String openWeatherApiUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getLocationWeather() async {
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper('$openWeatherApiUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    dynamic decodedResponse = await networkHelper.getWeatherData();

    return decodedResponse;
  }

  Future<dynamic> getCityWeather(String cityName) async {
    var url = '$openWeatherApiUrl?q=$cityName&appid=$apiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url);

    dynamic decodedResponse = await networkHelper.getWeatherData();
    return decodedResponse;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
