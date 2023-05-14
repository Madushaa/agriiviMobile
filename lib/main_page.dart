import 'package:agriivi/addTask.dart';
import 'package:agriivi/alert.dart';
import 'package:agriivi/chat.dart';
import 'package:agriivi/chemicalpage.dart';
import 'package:agriivi/cop.dart';
import 'package:agriivi/cropcheck.dart';
import 'package:agriivi/dataVisualize.dart';
import 'package:agriivi/fertilizer.dart';
import 'package:agriivi/harvestpage.dart';
import 'package:agriivi/harvestplan.dart';
import 'package:agriivi/harvestplaning.dart';
import 'package:agriivi/irrigation.dart';
import 'package:agriivi/labormanagement.dart';
import 'package:agriivi/login.dart';
import 'package:agriivi/planthealth.dart';
import 'package:agriivi/recomendation.dart';
import 'package:agriivi/roi.dart';
import 'package:agriivi/seedsTrack.dart';
import 'package:agriivi/signup.dart';
import 'package:agriivi/targetincome.dart';
import 'package:agriivi/whetherAlert.dart';
import 'package:flutter/material.dart';



class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 36, 205, 92),
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Agriivi",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            color: Colors.black,
            onPressed: () {
              // Handle search icon press
            },
          ),
          IconButton(
            icon: Icon(Icons.login),
            color: Colors.black,
            onPressed: () {
              Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginPage()),
          );
            },
          ),
             IconButton(
        icon: Icon(Icons.person_add),
        color: Colors.black,
        onPressed: () {
          // Navigate to the signup page
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignupPage()),
          );
        },
      ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Enter Chemical Records"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => chemicalpage()),
                );
              },
            ),
           SizedBox(height: 16),
ElevatedButton.icon(
  icon: Icon(Icons.calculate_rounded),
  label: Text(
    "Enter Harvest Records",
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => harvestpage()),
    );
  },
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 36, 205, 92)),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide.none,
      ),
    ),
    elevation: MaterialStateProperty.all(5),
    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
    overlayColor: MaterialStateProperty.all(
      Colors.white.withOpacity(0.2),
    ),
  ),
),
           SizedBox(height: 16),
ElevatedButton.icon(
  icon: Icon(Icons.calculate_rounded),
  label: Text(
    "Enter Fertilizer Records",
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => fertilizerpage()),
    );
  },
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 60, 179, 113)),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide.none,
      ),
    ),
    elevation: MaterialStateProperty.all(5),
    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
    overlayColor: MaterialStateProperty.all(
      Colors.white.withOpacity(0.2),
    ),
  ),
),
           SizedBox(height: 16),
ElevatedButton.icon(
  icon: Icon(Icons.calculate_rounded),
  label: Text(
    "Pest Management",
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Checklist()),
    );
  },
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 60, 179, 113)),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide.none,
      ),
    ),
    elevation: MaterialStateProperty.all(5),
    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
    overlayColor: MaterialStateProperty.all(
      Colors.white.withOpacity(0.2),
    ),
  ),
),

SizedBox(height: 16),
ElevatedButton.icon(
  icon: Icon(Icons.calculate_rounded),
  label: Text(
    "Calculate Cost Of Production",
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductionCostCalculator()),
    );
  },
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 60, 179, 113)),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide.none,
      ),
    ),
    elevation: MaterialStateProperty.all(5),
    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
    overlayColor: MaterialStateProperty.all(
      Colors.white.withOpacity(0.2),
    ),
  ),
),
SizedBox(height: 16),
ElevatedButton.icon(
  icon: Icon(Icons.calculate_rounded),
  label: Text(
    "Calculate Target Income",
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => TargetIncome()),
    );
  },
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 60, 179, 113)),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide.none,
      ),
    ),
    elevation: MaterialStateProperty.all(5),
    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
    overlayColor: MaterialStateProperty.all(
      Colors.white.withOpacity(0.2),
    ),
  ),
),
SizedBox(height: 16),
ElevatedButton.icon(
  icon: Icon(Icons.calculate_rounded),
  label: Text(
    "Calculate ROI",
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GreenhouseROI()),
    );
  },
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 60, 179, 113)),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide.none,
      ),
    ),
    elevation: MaterialStateProperty.all(5),
    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
    overlayColor: MaterialStateProperty.all(
      Colors.white.withOpacity(0.2),
    ),
  ),
),
SizedBox(height: 16),
ElevatedButton.icon(
  icon: Icon(Icons.calculate_rounded),
  label: Text(
    "Seeds Management",
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SeedTrackingScreen()),
    );
  },
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 60, 179, 113)),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide.none,
      ),
    ),
    elevation: MaterialStateProperty.all(5),
    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
    overlayColor: MaterialStateProperty.all(
      Colors.white.withOpacity(0.2),
    ),
  ),
),

SizedBox(height: 16),
ElevatedButton.icon(
  icon: Icon(Icons.calculate_rounded),
  label: Text(
    "Check Plant Health",
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PlantHealthScreen()),
    );
  },
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 60, 179, 113)),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide.none,
      ),
    ),
    elevation: MaterialStateProperty.all(5),
    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
    overlayColor: MaterialStateProperty.all(
      Colors.white.withOpacity(0.2),
    ),
  ),
),







            SizedBox(height: 16),
ElevatedButton.icon(
  icon: Icon(Icons.calculate_rounded),
  label: Text(
    "Crop Guide",
    style: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.bold,
    ),
  ),
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => recomendation()),
    );
  },
  style: ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Color.fromARGB(255, 60, 179, 113)),
    foregroundColor: MaterialStateProperty.all(Colors.white),
    textStyle: MaterialStateProperty.all(
      TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
      ),
    ),
    shape: MaterialStateProperty.all(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide.none,
      ),
    ),
    elevation: MaterialStateProperty.all(5),
    minimumSize: MaterialStateProperty.all(Size(double.infinity, 50)),
    overlayColor: MaterialStateProperty.all(
      Colors.white.withOpacity(0.2),
    ),
  ),
),




          ],
        ),
      ),
    );
  }
}













