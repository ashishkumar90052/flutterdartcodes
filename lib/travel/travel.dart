import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TravelApp extends StatefulWidget {
  const TravelApp({super.key});

  @override
  State<TravelApp> createState() => _TravelAppState();
}

class _TravelAppState extends State<TravelApp> {
  List<Map> travelData = [
    {
      'img':
          'https://imageio.forbes.com/specials-images/imageserve/60965bf1f0e94f119f723c48/Facade-of-St-Mark-s-Basilica/960x0.jpg?format=jpg&width=960',
      'title': 'St. Marks Basilia',
      'subtitle': 'Sightseeing Tour',
      'sTime': '8.00 am',
      'eTime': '11.00 am',
      'price': '50'
    },
    {
      'img':
          'https://media.tacdn.com/media/attractions-splice-spp-674x446/07/93/21/8e.jpg',
      'title': 'Walking Tour and Gonaola',
      'subtitle': 'Sightseeing Tour',
      'sTime': '11.00 am',
      'eTime': '13.00 pm',
      'price': '500'
    },
    {
      'img':
          'https://res.klook.com/images/fl_lossy.progressive,q_65/c_fill,w_1295,h_720/w_80,x_15,y_15,g_south_west,l_Klook_water_br_trans_yhcmh3/activities/ypftynzp6xi9pcgvkp4p/Murano,Burano,andTorcelloDayTrip.webp',
      'title': 'Murano and Burano Tour',
      'subtitle': 'St. Marks Basilia',
      'sTime': '15.00 pm',
      'eTime': '08.00 am',
      'price': '200'
    },
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: height * .4,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(32.0),
                    child: Image.network(
                        'https://cdn.kimkim.com/files/a/content_articles/featured_photos/6c3ae4ec5b1234c6854fe2780944320c4c3f2057/big-2e0274440907f75814f4da91a5d76204.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
                Positioned(
                  top: 48,
                  left: 16,
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black12),
                      child: IconButton(
                        icon:
                            const Icon(Icons.west_rounded, color: Colors.white),
                        onPressed: () {},
                      )),
                ),
                Positioned(
                  top: 48,
                  right: 16,
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black12),
                      child: IconButton(
                        icon: const Icon(CupertinoIcons.search,
                            color: Colors.white),
                        onPressed: () {},
                      )),
                ),
                const Positioned(
                    bottom: 36,
                    left: 16,
                    child: Text(
                      'Rome',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.w500),
                    )),
                const Positioned(
                    bottom: 16,
                    left: 16,
                    child: Text(
                      'Italy',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w500),
                    )),
                Positioned(
                  bottom: 24,
                  right: 16,
                  child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black12),
                      child: IconButton(
                        icon: const Icon(CupertinoIcons.location,
                            color: Colors.white),
                        onPressed: () {},
                      )),
                ),
              ],
            ),
            ListView.separated(
              itemCount: 3,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              padding: const EdgeInsets.all(16.0),
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(height: 16.0);
              },
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  surfaceTintColor: Colors.white,
                  clipBehavior: Clip.antiAlias,
                  margin: EdgeInsets.zero,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(travelData[index]['img'],
                            height: 170, width: 130, fit: BoxFit.cover),
                      ),
                      Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  travelData[index]['title'],
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 2),
                                Text(travelData[index]['subtitle'],
                                    style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400,
                                        color: Colors.black45)),
                                const SizedBox(height: 2),
                                SizedBox(
                                  height: 40,
                                  child: ListView.separated(
                                    itemCount: 5,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.horizontal,
                                    separatorBuilder: (context, index) {
                                      return const SizedBox(width: 4);
                                    },
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return const Icon(
                                          CupertinoIcons.star_fill,
                                          size: 20.0,
                                          color: Colors.amber);
                                    },
                                  ),
                                ),
                                Wrap(
                                  children: [
                                    FilledButton.tonal(
                                        style: FilledButton.styleFrom(
                                            padding: const EdgeInsets.all(6),
                                            minimumSize: const Size(40, 32)),
                                        onPressed: () {},
                                        child: Text(
                                          travelData[index]['sTime'],
                                          style: const TextStyle(fontSize: 11),
                                        )),
                                    const SizedBox(width: 8),
                                    FilledButton.tonal(
                                        style: FilledButton.styleFrom(
                                            padding: const EdgeInsets.all(6),
                                            minimumSize: const Size(40, 32)),
                                        onPressed: () {},
                                        child: Text(
                                          travelData[index]['eTime'],
                                          style: const TextStyle(fontSize: 11),
                                        )),
                                  ],
                                )
                              ],
                            ),
                          )),
                      Padding(
                        padding:
                            const EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 16.0),
                        child: Column(
                          children: [
                            Text("€ ${travelData[index]['price']}",
                                style: const TextStyle(fontSize: 16)),
                            const Text(
                              "per pax",
                              style: TextStyle(color: Colors.black45),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
