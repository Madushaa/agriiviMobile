import 'package:flutter/material.dart';

class GreenhouseROI extends StatefulWidget {
  @override
  _GreenhouseROIState createState() => _GreenhouseROIState();
}

class _GreenhouseROIState extends State<GreenhouseROI> {
  final TextEditingController _initialInvestmentController =
      TextEditingController();
  final TextEditingController _annualRevenueController =
      TextEditingController();
  final TextEditingController _annualExpensesController =
      TextEditingController();
  final TextEditingController _numberOfYearsController =
      TextEditingController();

  double _roi = 0.0;
  double _totalRevenue = 0.0;
  double _totalExpenses = 0.0;
  double _totalProfit = 0.0;

  void _calculateROI() {
    double initialInvestment =
        double.tryParse(_initialInvestmentController.text) ?? 0;
    double annualRevenue = double.tryParse(_annualRevenueController.text) ?? 0;
    double annualExpenses =
        double.tryParse(_annualExpensesController.text) ?? 0;
    int numberOfYears = int.tryParse(_numberOfYearsController.text) ?? 1;

    double revenueIncrease = 0.0;
    double expensesIncrease = 0.0;
    double roi = 0.0;
    double totalRevenue = 0.0;
    double totalExpenses = 0.0;
    double totalProfit = 0.0;

    for (int i = 0; i < numberOfYears; i++) {
      totalRevenue += annualRevenue + revenueIncrease;
      totalExpenses += annualExpenses + expensesIncrease;
      totalProfit = totalRevenue - totalExpenses;
      roi = totalProfit / initialInvestment;

      revenueIncrease += (annualRevenue * 0.05); // increase revenue by 5% each year
      expensesIncrease += (annualExpenses * 0.02); // increase expenses by 2% each year
    }

    setState(() {
      _roi = roi;
      _totalRevenue = totalRevenue;
      _totalExpenses = totalExpenses;
      _totalProfit = totalProfit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Greenhouse ROI Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _initialInvestmentController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Initial Investment',
              ),
            ),
            TextField(
              controller: _annualRevenueController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Annual Revenue',
              ),
            ),
            TextField(
              controller: _annualExpensesController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Annual Expenses',
              ),
            ),
            TextField(
              controller: _numberOfYearsController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Number of Years',
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              child: Text('Calculate ROI'),
              onPressed: _calculateROI,
            ),
            SizedBox(height: 16.0),
            Text('Total Revenue: ${_totalRevenue.toStringAsFixed(2)}'),
            Text('Total Expenses: ${_totalExpenses.toStringAsFixed(2)}'),
            Text('Total Profit: ${_totalProfit.toStringAsFixed(2)}'),
            Text('ROI: ${_roi.toStringAsFixed(2)}'),
          ],
        ),
      ),
    );
  }
}
