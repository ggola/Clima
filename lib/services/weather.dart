import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const kApiKey = '100877f73ffcfc2a4f84d786ef5d3c5e';
const kOpenWeatherMapUrl = 'http://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String url = '$kOpenWeatherMapUrl?q=$cityName&appid=$kApiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();
    String url =
        '$kOpenWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$kApiKey&units=metric';
    NetworkHelper networkHelper = NetworkHelper(url: url);
    var weatherData = await networkHelper.getData();
    return weatherData;
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

  String getDirection(int degrees) {
    if (degrees <= 30) {
      return 'N';
    } else if (degrees <= 60) {
      return 'N-E';
    } else if (degrees <= 120) {
      return 'E';
    } else if (degrees <= 150) {
      return 'S-E';
    } else if (degrees <= 210) {
      return 'S';
    } else if (degrees <= 240) {
      return 'S-W';
    } else if (degrees <= 300) {
      return 'W';
    } else if (degrees <= 330) {
      return 'N-W';
    } else {
      return 'N';
    }
  }
}
