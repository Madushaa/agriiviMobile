import 'package:flutter/material.dart';

class HarvestPlanningScreen extends StatefulWidget {
  const HarvestPlanningScreen({Key? key}) : super(key: key);

  @override
  _HarvestPlanningScreenState createState() => _HarvestPlanningScreenState();
}

class _HarvestPlanningScreenState extends State<HarvestPlanningScreen> {
  final TextEditingController _plantingDateController = TextEditingController();
  final TextEditingController _daysToHarvestController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  int? _estimatedYield;
  String? _cropType;
  String? _location;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Harvest Planning'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _plantingDateController,
              decoration: InputDecoration(
                labelText: 'Planting Date',
              ),
              onTap: () async {
                final DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime.now().subtract(const Duration(days: 365)),
                  lastDate: DateTime.now().add(const Duration(days: 365)),
                );
                if (pickedDate != null) {
                  _plantingDateController.text =
                      pickedDate.toIso8601String().split('T')[0];
                }
              },
            ),
            TextFormField(
              controller: _daysToHarvestController,
              decoration: InputDecoration(
                labelText: 'Days to Harvest',
              ),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Crop Type',
              ),
              onChanged: (value) {
                setState(() {
                  _cropType = value;
                });
              },
            ),
            TextFormField(
              controller: _locationController,
              decoration: InputDecoration(
                labelText: 'Location',
              ),
              onChanged: (value) {
                setState(() {
                  _location = value;
                });
              },
            ),
            ElevatedButton(
              onPressed: _calculateYield,
              child: Text('Calculate Estimated Yield'),
            ),
            if (_estimatedYield != null)
              Text('Estimated Yield: $_estimatedYield kg'),
            if (_cropType != null)
              Text('Crop Type: $_cropType'),
            if (_location != null)
              Text('Location: $_location'),
          ],
        ),
      ),
    );
  }

  void _calculateYield() {
    final plantingDate = DateTime.parse(_plantingDateController.text);
    final daysToHarvest = int.tryParse(_daysToHarvestController.text) ?? 0;
    final expectedHarvestDate = plantingDate.add(Duration(days: daysToHarvest));

    setState(() {
      // Estimate yield based on some logic
      _estimatedYield = (daysToHarvest * 10) + 50;
    });

    // Show a snackbar with the expected harvest date
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Expected harvest date: ${expectedHarvestDate.toIso8601String().split('T')[0]}'),
    ));
  }
}
