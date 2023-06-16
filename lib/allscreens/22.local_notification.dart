import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Notifications extends StatelessWidget {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Location Notification Demo',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Location Notification Demo'),
        ),
        body: Center(
          child: TextButton(
            onPressed: () async {
              Position position = await Geolocator.getCurrentPosition(
                  desiredAccuracy: LocationAccuracy.high);
              displayNotification(position);
            },
            child: const Text('Show Location Notification'),
          ),
        ),
      ),
    );
  }

  void displayNotification(Position position) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id', // Replace with your own channel ID
      'Location Notification',
      // 'Notification for current location',
      importance: Importance.max,
      priority: Priority.high,
    );

    final NotificationDetails platformChannelSpecifics =
        // ignore: prefer_const_constructors
        NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0, // Notification ID
      'Current Location',
      'Latitude: ${position.latitude}, Longitude: ${position.longitude}',
      platformChannelSpecifics,
    );
  }
}
