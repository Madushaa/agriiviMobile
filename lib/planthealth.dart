import 'package:flutter/material.dart';

class PlantHealthScreen extends StatefulWidget {
  const PlantHealthScreen({Key? key}) : super(key: key);

  @override
  _PlantHealthScreenState createState() => _PlantHealthScreenState();
}

class _PlantHealthScreenState extends State<PlantHealthScreen> {
  double _temperature = 0.0;
  double _humidity = 0.0;
  double _soilMoisture = 0.0;

  String _warningMsg = '';
  String _statusMsg = '';

  void _updateTemperature(double value) {
    setState(() {
      _temperature = value;
      if (value < 10 || value > 90) {
        _warningMsg = 'Temperature is outside the optimal range (10-90)';
      } else {
        _warningMsg = '';
      }
    });
  }

  void _updateHumidity(double value) {
    setState(() {
      _humidity = value;
      if (value < 20 || value > 80) {
        _warningMsg = 'Humidity is outside the optimal range (20-80)';
      } else {
        _warningMsg = '';
      }
    });
  }

  void _updateSoilMoisture(double value) {
    setState(() {
      _soilMoisture = value;
      if (value < 30 || value > 70) {
        _warningMsg = 'Soil moisture is outside the optimal range (30-70)';
      } else {
        _warningMsg = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Plant Health Tracking'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Temperature: ${_temperature.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 24),
            ),
            Slider(
              value: _temperature,
              min: 0,
              max: 100,
              divisions: 10,
              onChanged: _updateTemperature,
            ),
            Text(
              'Humidity: ${_humidity.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 24),
            ),
            Slider(
              value: _humidity,
              min: 0,
              max: 100,
              divisions: 10,
              onChanged: _updateHumidity,
            ),
            Text(
              'Soil Moisture: ${_soilMoisture.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 24),
            ),
            Slider(
              value: _soilMoisture,
              min: 0,
              max: 100,
              divisions: 10,
              onChanged: _updateSoilMoisture,
            ),
            if (_warningMsg.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 16.0),
                child: Text(
                  _warningMsg,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                'Plant health status: ${_warningMsg.isNotEmpty ? "Not optimal" : "Optimal"}',
                style: TextStyle(
                  color: _warningMsg.isNotEmpty ? Colors.red : Colors.green,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
