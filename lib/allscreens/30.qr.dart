import 'package:dynamicapp/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQRPage extends StatefulWidget {
  const GenerateQRPage({super.key});

  @override
  GenerateQRPageState createState() => GenerateQRPageState();
}

class GenerateQRPageState extends State<GenerateQRPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SafeArea(
          child: TextField(
              controller: controller,
              decoration: InputDecoration(
                suffixIcon: ElevatedButton(
                    onPressed: () => setState(() {}),
                    child: const Text('GENERATE')),
              ))),
      body: Center(
        child: QrImageView(
          backgroundColor: colorLearn,
          data: controller.text,
          size: 300,
          embeddedImage: const AssetImage('images/logo.png'),
          embeddedImageStyle: const QrEmbeddedImageStyle(size: Size(80, 80)),
        ),
      ),
    );
  }
}
