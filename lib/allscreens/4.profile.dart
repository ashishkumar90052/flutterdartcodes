import 'package:dynamicapp/utils/const.dart';
import 'package:flutter/material.dart';

import '../utils/photo_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 24.0),
              const Center(
                child: CircleAvatar(
                  radius: 54,
                  backgroundImage: NetworkImage(
                      'https://images.pexels.com/photos/2787341/pexels-photo-2787341.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                ),
              ),
              const SizedBox(height: 24.0),
              const Text('Jennifer Lawrence',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 4.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Software Engineer',
                    style: TextStyle(color: Colors.black45),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                          height: 10, color: Colors.black45, width: 1.0)),
                  const Text(
                    'Weekly',
                    style: TextStyle(color: Colors.black45),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.language_outlined,
                      color: Colors.red.shade400,
                    ),
                  )),
                  const SizedBox(width: 16.0),
                  Flexible(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.link,
                      color: Colors.blue.shade400,
                    ),
                  )),
                  const SizedBox(width: 16.0),
                  Flexible(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.purple.shade50,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.usb_rounded,
                      color: Colors.purple.shade400,
                    ),
                  )),
                  const SizedBox(width: 16.0),
                  Flexible(
                      child: Container(
                    decoration: BoxDecoration(
                        color: Colors.deepOrange.shade50,
                        borderRadius: BorderRadius.circular(10)),
                    padding: const EdgeInsets.all(8),
                    child: Icon(
                      Icons.transfer_within_a_station_rounded,
                      color: Colors.deepOrange.shade400,
                    ),
                  )),
                ],
              ),
              const SizedBox(height: 32),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          '80',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                        Text('Posts'),
                      ],
                    )),
                    const SizedBox(width: 16.0),
                    Flexible(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          '320',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                        Text('Followers'),
                      ],
                    )),
                    const SizedBox(width: 16.0),
                    Flexible(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Text(
                          '220',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w800),
                        ),
                        Text('Followings'),
                      ],
                    )),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                        child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side: BorderSide(color: Colors.blue.shade800),
                          minimumSize: const Size(double.infinity, 48),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: Text(
                        'Message',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: Colors.blue[800]),
                      ),
                      onPressed: () {},
                    )),
                    const SizedBox(width: 16.0),
                    Flexible(
                        child: FilledButton(
                      style: FilledButton.styleFrom(
                          backgroundColor: Colors.blue[800],
                          minimumSize: const Size(double.infinity, 48),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8))),
                      child: const Text(
                        'Follow',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      onPressed: () {},
                    )),
                  ],
                ),
              ),
              GridView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: musicList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    fullscreenDialog: true,
                                    builder: (context) => ImgPreview(
                                        img: musicList[index]['img'])));
                          },
                          child: Image.network(
                            musicList[index]['img'],
                            fit: BoxFit.cover,
                          )));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
