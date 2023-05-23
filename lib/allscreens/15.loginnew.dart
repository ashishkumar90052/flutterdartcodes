import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/size_config.dart';

class LoginNew extends StatelessWidget {
  const LoginNew({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Center(
        child: SafeArea(
          child: Column(children: [
            const Spacer(),
            const Icon(Icons.lock, size: 72),
            h56,
            Text(
              'Welcome Back, you\'ve been logged out',
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 15,
                      color: Colors.black54)),
            ),
            h24,
            Card(
              color: kWhite,
              surfaceTintColor: kWhite,
              shape: shape4,
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Username', border: InputBorder.none),
                ),
              ),
            ),
            h16,
            Card(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              color: kWhite,
              surfaceTintColor: kWhite,
              shape: shape4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Password', border: InputBorder.none),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 6.0),
              alignment: Alignment.bottomRight,
              child: TextButton(
                child: const Text('Forgot Password',
                    style: TextStyle(color: Colors.black45)),
                onPressed: () {},
              ),
            ),
            h32,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: FilledButton(
                  style: FilledButton.styleFrom(
                      backgroundColor: kBlack,
                      textStyle: textStyleHeading,
                      minimumSize: const Size(double.infinity, 56),
                      shape: shape8),
                  onPressed: () {},
                  child: const Text('Sign in')),
            ),
            h48,
            const Text('Or'),
            h48,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 72,
                  width: 72,
                  child: Card(
                    shape: shape20,
                    elevation: .5,
                    child: Image.network(
                        'https://blog.hubspot.com/hubfs/image8-2.jpg'),
                  ),
                ),
                w24,
                SizedBox(
                  height: 72,
                  width: 72,
                  child: Card(
                    elevation: .5,
                    shape: shape20,
                    child: Image.network(
                        'https://ww1.freelogovectors.net/wp-content/uploads/2023/03/apple_logo-freelogovectors.net_-1.png'),
                  ),
                ),
              ],
            ),
            const Spacer(),
          ]),
        ),
      ),
    );
  }
}
