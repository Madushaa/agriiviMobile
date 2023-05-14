import 'package:flutter/material.dart';

class ProductionCostCalculator extends StatefulWidget {
  @override
  _ProductionCostCalculatorState createState() => _ProductionCostCalculatorState();
}

class _ProductionCostCalculatorState extends State {
  TextEditingController _startDateController = TextEditingController();
  TextEditingController _daysController = TextEditingController();
  TextEditingController _chemicalUsageController = TextEditingController();
  TextEditingController _fertilizerUsageController = TextEditingController();
  TextEditingController _serviceCostController = TextEditingController();
  TextEditingController _transportCostController = TextEditingController();
  TextEditingController _harvestCostController = TextEditingController();
  TextEditingController _rentCostController = TextEditingController();

  double _totalCost = 0;

  void _calculateTotalCost() {
  double days = double.parse(_daysController.text);
  double chemicalUsage = double.parse(_chemicalUsageController.text);
  double fertilizerUsage = double.parse(_fertilizerUsageController.text);
  double serviceCost = double.parse(_serviceCostController.text);
  double transportCost = double.parse(_transportCostController.text);
  double harvestCost = double.parse(_harvestCostController.text);
  double rentCost = double.parse(_rentCostController.text);

  String chemicalUnit = "kg"; 
  String fertilizerUnit = "kg"; 
  String currency = "USD"; 

  double chemicalCostPerUnit = 5.0; 
  double fertilizerCostPerUnit = 3.0; 
  double serviceTaxRate = 0.10; 
  double transportTaxRate = 0.05; 
  double harvestTaxRate = 0.15; 
  double rentTaxRate = 0.20; 

  double totalChemicalCost = chemicalUsage * chemicalCostPerUnit;
  double totalFertilizerCost = fertilizerUsage * fertilizerCostPerUnit;
  double serviceTax = serviceCost * serviceTaxRate;
  double transportTax = transportCost * transportTaxRate;
  double harvestTax = harvestCost * harvestTaxRate;
  double rentTax = rentCost * rentTaxRate;

  double subTotal = (days * (totalChemicalCost + totalFertilizerCost)) + serviceCost + transportCost + harvestCost + rentCost;
  double tax = serviceTax + transportTax + harvestTax + rentTax;
  double totalCost = subTotal + tax;

  _totalCost = totalCost;

  setState(() {});
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Production Cost Calculator')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _startDateController,
              decoration: InputDecoration(labelText: 'Start Date of Crop'),
            ),
            TextField(
              controller: _daysController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Number of Days'),
            ),
            TextField(
              controller: _chemicalUsageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Chemical Usage'),
            ),
            TextField(
              controller: _fertilizerUsageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Fertilizer Usage'),
            ),
            TextField(
              controller: _serviceCostController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Service Cost'),
            ),
            TextField(
              controller: _transportCostController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Transport Cost'),
            ),
            TextField(
              controller: _harvestCostController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Harvest Cost'),
            ),
            TextField(
              controller: _rentCostController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Rent Cost'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _calculateTotalCost,
              child: Text('Calculate Total Cost'),
            ),
            SizedBox(height: 16.0),
            Text('Total Cost: \$$_totalCost'),
          ],
        ),
      ),
    );
  }
}