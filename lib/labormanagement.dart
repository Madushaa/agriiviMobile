import 'package:flutter/material.dart';

    class GreenhouseFarmManagementApp extends StatelessWidget {
      const GreenhouseFarmManagementApp({Key? key}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Greenhouse Farm Management App',
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          home: const HomePage(),
        );
      }
    }

    class HomePage extends StatelessWidget {
      const HomePage({Key? key}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Greenhouse Farm Management'),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Harvest',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const HarvestWidget(),
                const SizedBox(height: 20),
                const Text(
                  'Crops',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const CropsWidget(),
                const SizedBox(height: 20),
                const Text(
                  'Fertilizer',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                const FertilizerWidget(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      }
    }

    class HarvestWidget extends StatelessWidget {
      const HarvestWidget({Key? key}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Total Harvest',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '500 kg',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Last Harvest',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'June 30, 2021',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        );
      }
    }

    class CropsWidget extends StatelessWidget {
      const CropsWidget({Key? key}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Active Crops',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Tomatoes, lettuce',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Upcoming Crops',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'Peppers',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        );
      }
    }

    class FertilizerWidget extends StatelessWidget {
      const FertilizerWidget({Key? key}) : super(key: key);

      @override
      Widget build(BuildContext context) {
        return Card(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Total Fertilizer Used',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  '50 kg',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Last Fertilizer Used',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  'June 28, 2021',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        );
      }
    }
    