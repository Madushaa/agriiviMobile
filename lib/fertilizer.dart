import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

void main() => runApp(fertilizerpage());

class fertilizerRecord {
  final String name;
  final DateTime date;
  final int quantity;
  final int activeplants;
  final int amountobtained;
  final int unitprice;

  fertilizerRecord(this.name, this.date, this.quantity, this.activeplants,
      this.amountobtained, this.unitprice);
}

class fertilizerpage extends StatefulWidget {
  const fertilizerpage({super.key});

  @override
  State<fertilizerpage> createState() => _fertilizerpageState();
}

class _fertilizerpageState extends State<fertilizerpage> {
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _activeplantsController = TextEditingController();
  final _amountobtainedController = TextEditingController();
  final _unitpriceController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  List<fertilizerRecord> _records = [];

  void _addRecord() {
    final name = _nameController.text;
    final quantity = int.parse(_quantityController.text);
    final activeplants = int.parse(_quantityController.text);
    final amountobtained = int.parse(_quantityController.text);
    final unitprice = int.parse(_quantityController.text);
    final record = fertilizerRecord(
        name, _selectedDate, quantity, activeplants, amountobtained, unitprice);

    setState(() {
      _records.add(record);
    });

    _nameController.clear();
    _quantityController.clear();
    _activeplantsController.clear();
    _amountobtainedController.clear();
    _unitpriceController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff37a139),
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),
          leading: Icon(
            Icons.menu,
            color: Colors.black,
          ),
          title: Text(
            'Fertilizer Management',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nameController,
                decoration:
                    InputDecoration(labelText: 'Name of the Fertilizer'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _activeplantsController,
                decoration:
                    InputDecoration(labelText: 'Number of Active Plants'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _amountobtainedController,
                decoration: InputDecoration(labelText: 'Amount obtained'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _unitpriceController,
                decoration: InputDecoration(labelText: 'Unit Price'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Text('Date: ${_selectedDate.toString()}'),
                  SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () async {
                      final date = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (date != null) {
                        setState(() {
                          _selectedDate = date;
                        });
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green, //Change the background color here
                    ),
                    child: Text('Select Date'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Container(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _addRecord,
                  child: Text('Add Record'),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green, // background color
                    textStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Colors.green)),
                    padding: EdgeInsets.all(15.0),
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text('Records (${_records.length}):'),
              Expanded(
                child: ListView.builder(
                  itemCount: _records.length,
                  itemBuilder: (context, index) {
                    final record = _records[index];
                    return ListTile(
                      title: Text(record.name),
                      subtitle: Text(
                          'Quantity: ${record.quantity}, Date: ${record.date.toString()}, Active Plants: ${record.activeplants}, Unit Price: ${record.unitprice}'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
