import 'package:flutter/material.dart';

class SeedTrackingScreen extends StatefulWidget {
  @override
  _SeedTrackingScreenState createState() => _SeedTrackingScreenState();
}

class _SeedTrackingScreenState extends State<SeedTrackingScreen> {
  final TextEditingController _seedTypeController = TextEditingController();
  final TextEditingController _batchNumberController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  List<SeedTracking> _seeds = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Seed Tracking'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Add new seed batch',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _seedTypeController,
                  decoration: InputDecoration(
                    labelText: 'Seed type',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _batchNumberController,
                  decoration: InputDecoration(
                    labelText: 'Batch number',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: _quantityController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Quantity',
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      final seed = SeedTracking(
                        seedType: _seedTypeController.text,
                        batchNumber: _batchNumberController.text,
                        quantity: int.parse(_quantityController.text),
                        dateAdded: DateTime.now(),
                      );
                      _seeds.add(seed);
                      _seedTypeController.clear();
                      _batchNumberController.clear();
                      _quantityController.clear();
                    });
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _seeds.length,
              itemBuilder: (context, index) {
                final seed = _seeds[index];
                return ListTile(
                  title: Text(seed.seedType),
                  subtitle: Text('Batch #: ${seed.batchNumber}, Qty: ${seed.quantity}'),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        _seeds.removeAt(index);
                      });
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SeedTracking {
  final String seedType;
  final String batchNumber;
  final int quantity;
  final DateTime dateAdded;

  SeedTracking({
    required this.seedType,
    required this.batchNumber,
    required this.quantity,
    required this.dateAdded,
  });
}
