import 'package:flutter/material.dart';
import 'package:clima/services/weather.dart';
import 'package:clima/utilities/parameter_box.dart';

class WeatherInfo extends StatefulWidget {
  WeatherInfo({@required this.locationWeather});
  final locationWeather;
  @override
  _WeatherInfoState createState() => _WeatherInfoState();
}

class _WeatherInfoState extends State<WeatherInfo> {
  var temperature;
  var pressure;
  var humidity;
  var visibility;
  var windSpeed;
  String windDirection;
  String notAvailable = 'N/A';

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        return;
      }
      // Update UI
      var temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var press = weatherData['main']['pressure'];
      pressure = press.toInt();
      var humid = weatherData['main']['humidity'];
      humidity = humid.toInt();
      var visib = weatherData['visibility'];
      visibility = (visib / 1000).toInt();
      var speed = weatherData['wind']['speed'];
      windSpeed = speed;
      var degrees = weatherData['wind']['deg'];
      if (degrees != null) {
        windDirection = WeatherModel().getDirection(degrees.toInt());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/location_background.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.7), BlendMode.difference),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SafeArea(
              child: Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15.0, horizontal: 5.0),
                color: Colors.transparent,
                child: Column(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            ParameterBox(
                              name: 'TEMPERATURE',
                              value: (temperature != null)
                                  ? '$temperature°'
                                  : notAvailable,
                              color: Colors.teal.shade900.withOpacity(0.85),
                            ),
                            ParameterBox(
                              name: 'PRESSURE',
                              value: (pressure != null)
                                  ? '${pressure}mbar'
                                  : notAvailable,
                              color: Colors.brown.shade800.withOpacity(0.85),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            ParameterBox(
                              name: 'HUMIDITY',
                              value: (humidity != null)
                                  ? '$humidity%'
                                  : notAvailable,
                              color: Colors.purple.shade900.withOpacity(0.85),
                            ),
                            ParameterBox(
                              name: 'VISIBILITY',
                              value: (visibility != null)
                                  ? '${visibility}Km'
                                  : notAvailable,
                              color: Colors.green.shade900.withOpacity(0.85),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: <Widget>[
                            ParameterBox(
                              name: 'WIND SPEED',
                              value: (windSpeed != null)
                                  ? '${windSpeed}m/s'
                                  : notAvailable,
                              color: Colors.blue.shade900.withOpacity(0.85),
                            ),
                            ParameterBox(
                              name: 'DIRECTION',
                              value: (windDirection != null)
                                  ? windDirection
                                  : notAvailable,
                              color: Colors.pink.shade900.withOpacity(0.85),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
