import 'package:flutter/material.dart';
    import 'package:flutter_local_notifications/flutter_local_notifications.dart';

    class NotificationScreen extends StatelessWidget {
      final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
          FlutterLocalNotificationsPlugin();

      Future<void> _showNotification(String title, String message) async {
        const AndroidNotificationDetails androidPlatformChannelSpecifics =
            AndroidNotificationDetails(
          'channel id',
          'channel name',
          
          importance: Importance.max,
          priority: Priority.high,
          showWhen: false,
        );
        const NotificationDetails platformChannelSpecifics =
            NotificationDetails(android: androidPlatformChannelSpecifics);
        await flutterLocalNotificationsPlugin.show(
          0,
          title,
          message,
          platformChannelSpecifics,
        );
      }

      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          home: Scaffold(
            appBar: AppBar(
              title: Text('Notifications'),
            ),
            body: Center(
              child: ElevatedButton(
                onPressed: () {
                  _showNotification(
                      'Crop Emergency Alert', 'There is a crop emergency. Please take necessary actions.');
                },
                child: Text('Show Notification'),
              ),
            ),
          ),
        );
      }
    }