import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Book extends StatefulWidget {
  const Book({super.key});

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  var selectedTab = 'New';
  var selected = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
  var unSelected = const TextStyle(color: Colors.black45);
  List<Map> quizData = [
    {
      'img':
          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx9ZaZlWjNkwnQ4CQ7BGEBUQWuei69J_dkz9gea8wV58wTQ6y_QlZr2hy6oWqxBgwP-aM&usqp=CAU',
      'title': 'Once Upon a Time',
      'subtitle': 'Marina Wilsons',
      'price': '₹ 20',
    },
    {
      'img':
          'https://images.template.net/2910/Children-s-Education-Book-Cover-Template-2x.jpg',
      'title': 'Explore the Stars',
      'subtitle': 'Jose Hawrthone',
      'price': '₹ 20',
    },
    {
      'img':
          'https://visme.co/blog/wp-content/uploads/2021/06/bedtime-story-book-cover-template-visme.jpg',
      'title': 'A Journey to The Moon',
      'subtitle': 'Max Borne',
      'price': '₹ 20',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          children: [
            Text('Hi, Jhone Doe',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .merge(const TextStyle(color: Colors.black54))),
            Text('Discover Latest Books',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .merge(const TextStyle(fontWeight: FontWeight.w600))),
            const SizedBox(height: 24.0),
            const CupertinoSearchTextField(
              placeholder: 'Search your Books...',
              padding: EdgeInsetsDirectional.all(15.0),
            ),
            const SizedBox(height: 32.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('New', style: selected),
                    const SizedBox(height: 4.0),
                    Container(
                      height: 4.0,
                      width: 36.0,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(4)),
                    )
                  ],
                ),
                const SizedBox(width: 16.0),
                Text('Trending', style: unSelected),
                const SizedBox(width: 16.0),
                Text('Best Sellor', style: unSelected),
              ],
            ),
            const SizedBox(height: 32.0),
            SizedBox(
              height: 280,
              child: ListView.separated(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) {
                  return const SizedBox(width: 8.0);
                },
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 195.0,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(
                          index == 0
                              ? 'https://i.pinimg.com/originals/e8/2f/cc/e82fcc725b3bd2120dd4622370882507.jpg'
                              : 'https://images.template.net/2905/Simple-Children-s-Story-Book-Cover-Template-2x.jpg',
                          fit: BoxFit.fill),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            const ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  'Popular',
                  style: TextStyle(fontSize: 26),
                )),
            const SizedBox(height: 16.0),
            ListView.separated(
              physics: const ScrollPhysics(),
              itemCount: quizData.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return const SizedBox(height: 16.0);
              },
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Flexible(
                        flex: 2,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(quizData[index]['img'],
                              height: 160, width: 120, fit: BoxFit.fill),
                        )),
                    const SizedBox(width: 16.0),
                    Flexible(
                      flex: 2,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            quizData[index]['title'],
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                          Text(
                            quizData[index]['subtitle'],
                            style: const TextStyle(color: Colors.black54),
                          ),
                          const SizedBox(height: 4.0),
                          Text(
                            quizData[index]['price'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
