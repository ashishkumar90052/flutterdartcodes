import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Tabbar extends StatefulWidget {
  const Tabbar({super.key});

  @override
  State<Tabbar> createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> {
  bool isLoading = false;
  Dio dio = Dio();
  List<dynamic> userdata = [];
  var apiURL = 'https://jsonplaceholder.typicode.com/todos/1/users';
  Future<void> getUserData() async {

     Dio dio = Dio();

    // Set the base URL of the API.

    // Create the request data.
    Map<String, String> data = {
      'name': 'John Doe',
      'email': 'johndoe@example.com',
    };

    // Make the POST request.
    Response response = await dio.post('/users', data: data);

    // Check the response status code.
    if (response.statusCode == 201) {
      // The request was successful.
    } else {
      // The request failed.
    }
    try {
      var response = await dio.get(apiURL);
      if (response.statusCode == 200) {
        setState(() {
          userdata = response.data;
        });
      }
    } on DioException catch (e) {
      debugPrint(e.message);
    }
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        drawer: const Drawer(),
        appBar: AppBar(
          title: const Text('DIO GET REQUEST'),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.account_circle,
                  fill: .5,
                ))
          ],
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.cloud_outlined),
              ),
              Tab(
                icon: Icon(Icons.beach_access_sharp),
              ),
              Tab(
                icon: Icon(Icons.brightness_5_sharp),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            userData(),
            const Center(
              child: Text("It's rainy here"),
            ),
            const Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
      ),
    );
  }

  Widget userData() {
    return ListView.builder(
      itemCount: userdata.length,
      itemBuilder: (BuildContext context, int index) {
        var idx = userdata[index];
        var first = idx['name'];
        return Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor:
                  Colors.primaries[Random().nextInt(Colors.primaries.length)],
              child: Text('${first[0]}'),
            ),
            title: Text(idx['name']),
            subtitle: Text(idx['email']),
          ),
        );
      },
    );
  }
}
