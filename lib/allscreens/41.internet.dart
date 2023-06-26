import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';

class DeviceInfoScreen extends StatefulWidget {
  const DeviceInfoScreen({super.key});

  @override
  DeviceInfoScreenState createState() => DeviceInfoScreenState();
}

class DeviceInfoScreenState extends State<DeviceInfoScreen> {
  String deviceModel = 'Unknown';
  String deviceManufacturer = 'Unknown';
  String deviceOS = 'Unknown';

  @override
  void initState() {
    super.initState();
    getDeviceInformation();
  }

  Future<void> getDeviceInformation() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        deviceModel = androidInfo.model;
        deviceManufacturer = androidInfo.manufacturer;
        deviceOS = androidInfo.version.release;
      });
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        deviceModel = iosInfo.model!;
        deviceManufacturer = 'Apple';
        deviceOS = iosInfo.systemVersion!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Device Info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Device Model: $deviceModel'),
            Text('Device Manufacturer: $deviceManufacturer'),
            Text('Operating System: $deviceOS'),
          ],
        ),
      ),
    );
  }
}
