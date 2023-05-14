import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

void main() => runApp(chemicalpage());

class chemicalRecord {
  final String name;
  final DateTime date;
  final int pesticide;
  final int fungicide;
  final int amountobtainedg;
  final int amountobtainedml;
  final int unitprice;
  final int amount;

  chemicalRecord(this.name, this.date, this.pesticide, this.fungicide,
      this.amountobtainedg, this.amountobtainedml, this.unitprice, this.amount);
}

class chemicalpage extends StatefulWidget {
  const chemicalpage({super.key});

  @override
  State<chemicalpage> createState() => _chemicalpageState();
}

class _chemicalpageState extends State<chemicalpage> {
  final _nameController = TextEditingController();
  final _pesticideController = TextEditingController();
  final _fungicideController = TextEditingController();
  final _amountobtainedgController = TextEditingController();
  final _amountobtainedmlController = TextEditingController();
  final _unitpriceController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  List<chemicalRecord> _records = [];

  void _addRecord() {
    final name = _nameController.text;
    final pesticide = int.parse(_pesticideController.text);
    final fungicide = int.parse(_fungicideController.text);
    final amountobtainedg = int.parse(_amountobtainedgController.text);
    final amountobtainedml = int.parse(_amountobtainedmlController.text);
     final unitprice = int.parse(_unitpriceController.text);
     final amount = int.parse(_amountController.text);
    final record = chemicalRecord(
        name, _selectedDate, pesticide, fungicide, amountobtainedg, amountobtainedml,unitprice,amount);

    setState(() {
      _records.add(record);
    });

    _nameController.clear();
    _pesticideController.clear();
    _fungicideController.clear();
    _amountobtainedgController.clear();
    _amountobtainedmlController.clear();
    _unitpriceController.clear();
    _amountController.clear();
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
            'Chemical Management',
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
                    InputDecoration(labelText: 'Name of the chemical'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _pesticideController,
                decoration: InputDecoration(labelText: 'Pesticide'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _fungicideController,
                decoration:
                    InputDecoration(labelText: 'Fungicide'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _amountobtainedgController,
                decoration: InputDecoration(labelText: 'Amount obtained (g)'),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 16),
              TextField(
                controller: _amountobtainedmlController,
                decoration: InputDecoration(labelText: 'Amount obtained (ml)'),
                keyboardType: TextInputType.number,
              ),
               SizedBox(height: 16),
              TextField(
                controller: _unitpriceController,
                decoration: InputDecoration(labelText: 'Unit Price'),
                keyboardType: TextInputType.number,
              ),
               SizedBox(height: 16),
              TextField(
                controller: _amountController,
                decoration: InputDecoration(labelText: 'Amount'),
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
                          'Pesticide: ${record.pesticide}, Date: ${record.date.toString()}, Fungicide: ${record.fungicide}, Unitprice: ${record.unitprice}'),
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
