import 'package:flutter/material.dart';

void main() => runApp(recomendation());

class recomendation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crop Guide',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: CropListScreen(),
    );
  }
}

class CropListScreen extends StatelessWidget {
  final List<String> crops = ['Tomatoes', 'Cucumbers', 'Peppers', 'Lettuce'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop List'),
      ),
      body: ListView.builder(
        itemCount: crops.length,
        itemBuilder: (BuildContext context, int index) {
          String crop = crops[index];
          return ListTile(
            title: Text(crop),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CropGuideScreen(cropName: crop),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CropGuideScreen extends StatelessWidget {
  final String cropName;

  CropGuideScreen({required this.cropName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Guide'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Guide for $cropName',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Here are some recommendations for growing $cropName in a greenhouse:',
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '1. Temperature: $cropName thrives in temperatures between 60-75 degrees Fahrenheit. Ensure that the greenhouse is adequately ventilated to regulate the temperature and prevent overheating.\n',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '2. Humidity: Maintain humidity levels between 50-70%. This can be achieved through the use of misting systems and humidifiers.\n',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '3. Lighting: Provide $cropName with 12-16 hours of light per day, depending on the growth stage. Use high-quality LED grow lights for optimal results.\n',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '4. Watering: Water $cropName regularly, keeping the soil moist but not waterlogged. Use a well-draining soil mix to prevent root rot.\n',
                style: TextStyle(fontSize: 16.0),
              ),
              Text(
                '5. Fertilizer: Use a balanced fertilizer formulated for $cropName, following the instructions on the package.\n',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
