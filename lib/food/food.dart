import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  List<Map> foodData = [
    {
      'img':
          'https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8NXx8fGVufDB8fHx8&w=1000&q=80',
      'title': 'Pizza hut',
      'subtitle': 'Vegen - Healthy',
      'star': '4.8 (10)',
      'location': 'Sec 29, Gurugram',
      'delvType': 'Free Delivery',
    },
    {
      'img':
          'https://images.unsplash.com/photo-1546069901-ba9599a7e63c?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxleHBsb3JlLWZlZWR8MXx8fGVufDB8fHx8&w=1000&q=80',
      'title': 'The Freash House',
      'subtitle': 'Vegen - Healthy',
      'star': '4.8 (10)',
      'location': 'Sec 29, Gurugram',
      'delvType': 'Free Delivery',
    },
    {
      'img':
          'https://redcliffelabs.com/myhealth/wp-content/uploads/2022/03/90.jpg',
      'title': 'The Burger Club',
      'subtitle': 'Vegen - Healthy',
      'star': '4.8 (10)',
      'location': 'Sec 29, Gurugram',
      'delvType': '40 rupee',
    },
    {
      'img': 'https://justmyroots.com/052aec2aa60af6d6472d103252e6bc36.jpg',
      'title': 'Indian Food House',
      'subtitle': 'Healthy',
      'star': '4.8 (10)',
      'location': 'Sec 18, Gurugram',
      'delvType': 'Free Delivery',
    },
    {
      'img':
          'https://media.istockphoto.com/id/666710160/photo/grilled-chicken-legs-with-vegetable-skewers.jpg?b=1&s=170667a&w=0&k=20&c=ip5_idKkRVydpfwZC2ghvzia_VzKjacq8BzpLcVT3hI=',
      'title': 'Chicken Special',
      'subtitle': 'Healthy',
      'star': '4.8 (10)',
      'location': 'Sec 18, Gurugram',
      'delvType': 'Free Delivery',
    },
    {
      'img':
          'https://img.lovepik.com/photo/20211130/small/lovepik-meat-noodles-picture_501276564.jpg',
      'title': 'Noodles Special',
      'subtitle': 'Healthy',
      'star': '4.8 (10)',
      'location': 'Sec 18, Gurugram',
      'delvType': 'Free Delivery',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(CupertinoIcons.search),
          )
        ],
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        const ListTile(
          minLeadingWidth: 10,
          leading:
              Icon(Icons.location_on_rounded, color: Colors.black, size: 32),
          title: Text(
            'Nearby Restaurants',
            style: TextStyle(fontSize: 18.0),
          ),
          subtitle: Text(
            '50 restaurants found in your area',
            style: TextStyle(color: Colors.black45),
          ),
        ),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: foodData.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              margin:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.network(foodData[index]['img'],
                          fit: BoxFit.cover, height: 120, width: 120),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              foodData[index]['title'],
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w600),
                            ),
                            Text(foodData[index]['subtitle']),
                            const SizedBox(height: 4.0),
                            Row(
                              children: [
                                Icon(
                                  Icons.star_rate_rounded,
                                  size: 18,
                                  color: Theme.of(context).primaryColor,
                                ),
                                const SizedBox(width: 8.0),
                                Text(foodData[index]['star'])
                              ],
                            ),
                            const SizedBox(height: 4.0),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_rounded,
                                  size: 18,
                                  color: Theme.of(context).primaryColor,
                                ),
                                const SizedBox(width: 8.0),
                                Text(foodData[index]['location'])
                              ],
                            ),
                            const SizedBox(height: 4.0),
                            Row(
                              children: [
                                Icon(
                                  Icons.directions_bike_rounded,
                                  size: 18,
                                  color: Theme.of(context).primaryColor,
                                ),
                                const SizedBox(width: 8.0),
                                Text(foodData[index]['delvType'])
                              ],
                            ),
                          ],
                        )),
                    const Spacer(),
                    Flexible(
                        child: Container(
                      height: 36,
                      width: 36,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Theme.of(context).primaryColor),
                      child: const Icon(
                        Icons.favorite_outline,
                        color: Colors.white,
                      ),
                    )),
                  ],
                ),
              ),
            );
          },
        ),
      ])),
    );
  }
}
