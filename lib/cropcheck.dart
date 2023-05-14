import 'package:flutter/material.dart';

class Checklist extends StatefulWidget {
  @override
  _ChecklistState createState() => _ChecklistState();
}

class _ChecklistState extends State {
  int spiderMites = 0;
  int whiteflies = 0;
  int thrips = 0;
  int aphids = 0;
   int warms = 0;
   int burnspot = 0;
   int ants = 0;
   int mealybugs = 0;
  List warnings = [];
  String cropStatus = '';

  void handleChecklistSubmit() {
    setState(() {
      List warningsArray = [];
      int totalInsects = spiderMites + whiteflies + thrips + aphids + warms + burnspot + ants + mealybugs;

      if (totalInsects > 10) {
        warningsArray.add('High insect infestation level detected.');
      }

      if (spiderMites > 5) {
        warningsArray.add('High spider mite population detected.');
      }

      if (whiteflies > 5) {
        warningsArray.add('High whitefly population detected.');
      }

      if (thrips > 5) {
        warningsArray.add('High thrip population detected.');
      }

      if (aphids > 5) {
        warningsArray.add('High aphid population detected.');
      }
      
       if (warms > 5) {
        warningsArray.add('High warms population detected.');
      }
      
       if (burnspot > 5) {
        warningsArray.add('High burnspot leaves detected.');
      }
      
       if (ants > 5) {
        warningsArray.add('High ants population detected.');
      }
      
       if (mealybugs > 5) {
        warningsArray.add('High mealybugs detected.');
      }

      warnings = warningsArray;

      if (totalInsects == 0) {
        cropStatus = 'No insect infestation detected. Crop is healthy.';
      } else if (totalInsects <= 5) {
        cropStatus = 'Low insect infestation level detected. Crop is mildly affected.';
      } else if (totalInsects <= 10) {
        cropStatus = 'Moderate insect infestation level detected. Crop is moderately affected.';
      } else {
        cropStatus = 'High insect infestation level detected. Crop is severely affected.';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Checklist'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Spider Mites',
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                spiderMites = int.parse(value);
              });
            },
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Whiteflies',
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                whiteflies = int.parse(value);
              });
            },
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Thrips',
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                thrips = int.parse(value);
              });
            },
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Aphids',
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                aphids = int.parse(value);
              });
            },
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'warms',
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                warms = int.parse(value);
              });
            },
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'BurnSpots',
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                burnspot = int.parse(value);
              });
            },
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'ants',
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                ants = int.parse(value);
              });
            },
          ),
          SizedBox(height: 16),
          TextField(
            decoration: InputDecoration(
              hintText: 'Mealybugs',
            ),
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                mealybugs = int.parse(value);
              });
            },
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: handleChecklistSubmit,
            child: Text('Submit'),
          ),
          warnings.length > 0
              ? Column(
                  children: [
                    Text(
                      'Warnings:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Column(
                      children: warnings
                          .map((warning) => Text(warning))
                          .toList(),
                    ),
                  ],
                )
              : SizedBox.shrink(),
          cropStatus != ''
              ? Column(
                  children: [
                    Text(
                      'Crop Status:',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    Text(cropStatus),
                  ],
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
