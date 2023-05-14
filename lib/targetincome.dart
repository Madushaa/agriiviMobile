import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

void main() => runApp(TargetIncome());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Income Calculator',
      home: TargetIncome(),
    );
  }
}

class TargetIncome extends StatefulWidget {
  const TargetIncome({super.key});

  @override
  State<TargetIncome> createState() => _TargetIncomeState();
}

class _TargetIncomeState extends State<TargetIncome> {
  late int plants = 0;
  late int perProductHarvest = 0;
  late int harvestPerDay = 0;
  late int harvestingDays = 0;
  late int totalHarvest = 0;
  late int targetIncome = 0;

  void calculateTargetIncome() {
    int income = perProductHarvest * harvestPerDay * harvestingDays * totalHarvest;
    setState(() {
      targetIncome = income;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Number of plants:',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  plants = int.parse(value);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Harvest per product (kg):',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  perProductHarvest = int.parse(value);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Harvest per day (kg):',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  harvestPerDay = int.parse(value);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Harvesting days:',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  harvestingDays = int.parse(value);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Total harvest per cycle (kg):',
              ),
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  totalHarvest = int.parse(value);
                });
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: calculateTargetIncome,
              child: Text('Calculate Target Income'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Target Income:',
              ),
              keyboardType: TextInputType.number,
              readOnly: true,
              controller: TextEditingController(text: targetIncome.toString()),
            ),
          ),
        ],
      ),
    );
  }
}
