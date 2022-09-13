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
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
