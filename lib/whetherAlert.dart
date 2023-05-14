import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherForecastScreen extends StatefulWidget {
  @override
  _WeatherForecastScreenState createState() => _WeatherForecastScreenState();
}

class _WeatherForecastScreenState extends State<WeatherForecastScreen> {
  var isLoading = false;
  var weatherData;
  var error;

  Future<void> getWeatherData() async {
    setState(() {
      isLoading = true;
      error = null;
    });

    final url =
        'https://api.openweathermap.org/data/2.5/weather?q=YOUR_CITY_NAME&appid=YOUR_API_KEY&units=metric';
    final response = await http.get(Uri.parse(url));

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      setState(() {
        weatherData = responseData;
      });
    } else {
      setState(() {
        error = 'Error fetching weather data';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Weather Forecast'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : error != null
              ? Center(
                  child: Text(error),
                )
              : Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Current Temperature: ${weatherData['main']['temp']}°C',
                        style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Minimum Temperature: ${weatherData['main']['temp_min']}°C',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Maximum Temperature: ${weatherData['main']['temp_max']}°C',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Humidity: ${weatherData['main']['humidity']}%',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Wind Speed: ${weatherData['wind']['speed']}m/s',
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        'Weather: ${weatherData['weather'][0]['description']}',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ],
                  ),
                ),
    );
  }
}
