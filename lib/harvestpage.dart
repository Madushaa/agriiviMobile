import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

void main() => runApp(harvestpage());

class harvestRecord {
  final String name;
  final double morning;
  final DateTime date;
  final double evening;
  final double total;
  final double outshape;
  final double gradeA;
  final double gradeB;

  harvestRecord(this.name, this.morning, this.date, this.evening, this.total,
      this.outshape, this.gradeA, this.gradeB);
}

class harvestpage extends StatefulWidget {
  const harvestpage({super.key});

  @override
  State<harvestpage> createState() => _harvestpageState();
}

class _harvestpageState extends State<harvestpage> {
  final _nameController = TextEditingController();
  final _morningController = TextEditingController();
  final _eveningController = TextEditingController();
  final _totalController = TextEditingController();
  final _outshapeController = TextEditingController();
  final _gradeAController = TextEditingController();
  final _gradeBController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  List<harvestRecord> _records = [];

  void _addRecord() {
    final name = _nameController.text;
    final morning = double.parse(_morningController.text);
    final evening = double.parse(_eveningController.text);
    final total = double.parse(_totalController.text);
    final outshape = double.parse(_outshapeController.text);
    final gradeA = double.parse(_gradeAController.text);
    final gradeB = double.parse(_gradeBController.text);
    final record = harvestRecord(
        name, morning, _selectedDate, evening, total, outshape, gradeA, gradeB);

    setState(() {
      _records.add(record);
    });

    _nameController.clear();
    _morningController.clear();
    _eveningController.clear();
    _totalController.clear();
    _outshapeController.clear();
    _gradeAController.clear();
    _gradeBController.clear();
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
            'Harvest Management',
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
                decoration: InputDecoration(labelText: 'Morning Harvest KG'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _morningController,
                decoration: InputDecoration(labelText: 'Evening Harvest KG'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _eveningController,
                decoration: InputDecoration(labelText: 'Evening Harvest KG'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _totalController,
                decoration: InputDecoration(labelText: 'Total Harvest KG'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _outshapeController,
                decoration: InputDecoration(labelText: 'Out Shape KG'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _gradeAController,
                decoration: InputDecoration(labelText: 'Grade A Harvest'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _gradeBController,
                decoration: InputDecoration(labelText: 'Grade B Harvest'),
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
                      primary: Colors.green, 
                    ),
                    child: Text('Select Date'),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _addRecord,
                child: Text('Add Record'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green, 
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
                          'Morning: ${record.morning}, Date: ${record.date.toString()}, Evening: ${record.evening}, Outshape: ${record.outshape}, GradeA: ${record.gradeA}, GradeB: ${record.gradeB}'),
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
