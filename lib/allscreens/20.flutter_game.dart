import 'package:dynamicapp/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({Key? key}) : super(key: key);

  static const List<Color> colors = [
    Colors.black54,
    Colors.brown,
    Colors.blueGrey,
    Colors.amber,
  ];

  static const List<double> sizes = [9.5, 10.5, 11, 12];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: const Drawer(),
      // appBar: AppBar(
      //   titleTextStyle: const TextStyle(color: kBlack, fontSize: 20),
      //   iconTheme: const IconThemeData.fallback(),
      //   backgroundColor: Colors.white,
      //   title: const Text('Details'),
      //   centerTitle: true,
      //   actions: [
      //     IconButton(
      //         icon: const Icon(Icons.shopping_bag_outlined), onPressed: () {}),
      //   ],
      // ),

      body: Column(
        children: [
          const SizedBox(
            height: 500,
            width: double.infinity,
            child: WebView(
              debuggingEnabled: false,
              backgroundColor: Colors.transparent,
              initialUrl: 'https://app.vectary.com/p/1ieaNMSXSFeSit7eqbIGkW',
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
          h16,
          ListTile(
              title: Text(
                'ME Clock 3',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.black87,
                    ),
              ),
              subtitle: Row(
                children: [
                  const Icon(Icons.star_border_rounded, color: Colors.black54),
                  w8,
                  Text(
                    '4.9 / 5.0 ( 150 Reviews )',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.black54,
                        ),
                  ),
                ],
              )),
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Text(
                      'Colors',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black54,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (index) => Container(
                          height: 25,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: 25,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: colors[index]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Sizes',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.black54,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        4,
                        (index) => Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: Text(
                            sizes[index].toString(),
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: Colors.black54,
                                    ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          // const Spacer(),
          // const Padding(
          //   padding: EdgeInsets.all(16.0),
          //   child: Text(
          //     "PRODUCT DETAILS \nCompatibility: Android OS 6.0+ (EXCLUDING GO EDITION), iOS 10.0+Processor name: Qualcomm Snapdragon Wear 3100,Ram: 512 MB,Display type: AMOLED,Case Size: 41mm,Sensor: Accelerometer,Altimeter, Ambient Light, Gyroscope, Heart Rate, Microphone, NFC, Untethered GPSOther watch functions: Heart Rate Tracking / GPS / Google Pay /Swimproof / Notifications / Personalize Your Dial / Control Your Music / Interchangeable Watch Band / Built In Fitness Tracker,Smart Assistant: Simpletouch or voice commandBluetooth version: 4.2 Low EnergyMicrophone: Built-in microphone\nSize & Fit\nDial width: 44 MM\nStrap width: 22 MM\nMaterial & Care\nStainless Steel\nClean with a soft dry cloth",
          //     style: TextStyle(color: Colors.black54),
          //   ),
          // )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  height: 70,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Price',
                          style:
                              Theme.of(context).textTheme.bodyMedium?.copyWith(
                                    color: Colors.black54,
                                  ),
                        ),
                        Text(
                          'Rs. 1499.00',
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: Colors.black87,
                                  ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: FilledButton.tonal(
                  style: FilledButton.styleFrom(
                      shape: shape8, backgroundColor: Colors.orange),
                  onPressed: () {},
                  child: Center(
                    child: Text(
                      'Buy now',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
