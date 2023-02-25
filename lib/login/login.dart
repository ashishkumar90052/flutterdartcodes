import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(),
            const Text('Hello\nThere',
                style: TextStyle(fontSize: 56.0, fontWeight: FontWeight.w900)),
            const Spacer(),
            const Text('EMAIL',
                style: TextStyle(
                    color: Colors.black45, fontSize: 15, letterSpacing: .9)),
            TextFormField(
              initialValue: 'username@gmail.com',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 24.0),
            const Text('PASSWORD', style: TextStyle(color: Colors.black54)),
            TextFormField(
              initialValue: '******',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 16.0),
            Align(
                alignment: Alignment.bottomRight,
                child: Text('Forgot Password',
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold))),
            const SizedBox(height: 48.0),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {},
                child: const Text('LOGIN',
                    style:
                        TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
            const SizedBox(height: 16.0),
            OutlinedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 48),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8))),
                onPressed: () {},
                child: Text('LOGIN with Google',
                    style: TextStyle(
                        fontSize: 15,
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold))),
            const Spacer(),
            Center(
              child: RichText(
                text: TextSpan(
                  text: 'New here? ',
                  style: const TextStyle(color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                        text: 'Register',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
