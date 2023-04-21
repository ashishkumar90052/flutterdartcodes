import 'package:flutter/material.dart';

class Login2 extends StatelessWidget {
  const Login2({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
                height: height * .9,
                width: double.infinity,
                color: Theme.of(context).primaryColor.withOpacity(.1),
                child: Transform.scale(
                  scale: 1.6,
                  child: Image.network(
                    'https://cdn.dribbble.com/userupload/3566106/file/original-6033b16bce01a1aaf78b5bdae9247ce9.png?compress=1&resize=752x',
                  ),
                )),
          ),
          SafeArea(
            child: Container(
                padding: const EdgeInsets.only(top: 24),
                alignment: Alignment.topCenter,
                child: const Text(
                  'Flutter Dart Code',
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                )),
          ),
          SizedBox(
            height: height * .4,
            width: double.infinity,
            child: Card(
                elevation: 5,
                surfaceTintColor: Colors.white,
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(24), right: Radius.circular(24))),
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Container(
                            height: 5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context).primaryColor),
                          )),
                          const SizedBox(width: 8.0),
                          Expanded(
                              child: Container(
                            height: 5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.2)),
                          )),
                          const SizedBox(width: 8.0),
                          Expanded(
                              child: Container(
                            height: 5,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(.2)),
                          )),
                        ],
                      ),
                      const SizedBox(height: 24.0),
                      const Text(
                        'Welcome to Navitron! 👋🏻',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        'Your ultimate guide to navigating the world and discovering new places with ease',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 48.0),
                      FilledButton.tonal(
                          style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              minimumSize: const Size(double.infinity, 48)),
                          onPressed: () {},
                          child: const Text('Login')),
                      const SizedBox(height: 16.0),
                      FilledButton.icon(
                          style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8)),
                              minimumSize: const Size(double.infinity, 48)),
                          label: const Icon(Icons.east_rounded),
                          onPressed: () {},
                          icon: const Text('Create account')),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
