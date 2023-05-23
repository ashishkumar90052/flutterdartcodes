import 'package:dynamicapp/utils/const.dart';
import 'package:flutter/material.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .55,
            child: Image.network(
              'https://i.pinimg.com/originals/67/60/90/6760900d6e002a489f5a9b43cf3c280f.gif',
              // 'https://i.pinimg.com/originals/3d/81/0d/3d810d38b17a3d5d6b39874285b83a35.gif',
              fit: BoxFit.cover,
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
            child: Text(
              'Explore Your New\nskill today',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
            ),
          ),
          const SizedBox(height: 16.0),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'New skills are diversified your job options and help you to keep up with the fast changing world',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          const Spacer(),
          const Spacer(),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: NeuTextButton(
            buttonHeight: 50,
            buttonColor: Colors.pink,
            borderColor: Colors.black,
            shadowColor: Colors.black,
            borderRadius: BorderRadius.circular(16),
            buttonWidth: MediaQuery.of(context).size.width * 0.5,
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Start Learning",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => const Home()));
            },
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   leading: NeuIconButton(icon: Icon(Icons.menu)),
      //   title: NeuSearchBar(searchBarColor: Colors.amber),
      //   // actions: [
      //   //   NeuIconButton(icon: Icon(Icons.add)),
      //   // ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  'Hi, Ashish',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                ),
                subtitle: const Text('Become a better worker today'),
                trailing: NeuIconButton(
                    buttonColor: Colors.pink,
                    borderRadius: BorderRadius.circular(16),
                    icon: const Icon(
                      Icons.account_circle,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(height: 16.0),
              ListTile(
                title: NeuSearchBar(
                  borderRadius: BorderRadius.circular(16),
                  searchBarColor: Colors.white,
                  hintText: 'What are you looking for',
                  searchBarIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintStyle: const TextStyle(color: Colors.black),
                ),
                trailing: NeuIconButton(
                    borderRadius: BorderRadius.circular(16),
                    buttonColor: Colors.white,
                    icon: const Icon(
                      Icons.filter_alt,
                      color: Colors.black,
                    )),
              ),
              const SizedBox(height: 16.0),
              const ListTile(
                title: Text(
                  'Course in Progress',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: NeuContainer(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            NeuIconButton(
                                buttonColor: Colors.pink,
                                borderRadius: BorderRadius.circular(16),
                                icon: const Icon(Icons.account_circle)),
                            const SizedBox(width: 16.0),
                            const Text(
                              "English Course",
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        RichText(
                          text: const TextSpan(
                            text: 'Instructor :  ',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'Flutterdartcode',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        const Row(
                          children: [
                            Text(
                              '18 lessons',
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(width: 8),
                            Icon(
                              Icons.circle,
                              size: 5,
                              color: Colors.pink,
                            ),
                            SizedBox(width: 8),
                            Text(
                              '50% completed',
                              style: TextStyle(
                                  color: Colors.pink,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4.0),
                        LinearProgressIndicator(
                          value: .6,
                          backgroundColor: Colors.grey[300],
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.pink),
                          minHeight: 10,
                          semanticsLabel: 'Linear progress indicator',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              const ListTile(
                title: Text(
                  'Popular Courses',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                ),
                trailing: Text(
                  'See all',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 280.0,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: musicList.length,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NeuContainer(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Image.network(
                              musicList[index]['img'],
                              height: 150,
                              width: 250,
                              fit: BoxFit.cover,
                            ),
                            const SizedBox(height: 8.0),
                            Container(
                              width: 250,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: const Text(
                                '3D Design Essentials - Cinema 4d',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.w800),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Container(
                                width: 250,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: const Row(
                                  children: [
                                    Icon(Icons.restore, color: Colors.black54),
                                    SizedBox(width: 8.0),
                                    Expanded(
                                        child: Text(
                                      '72 Hours',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w400),
                                    )),
                                    Icon(Icons.star_outline,
                                        color: Colors.black54),
                                    SizedBox(width: 8.0),
                                    Expanded(
                                        child: Text(
                                      '4.5',
                                      style: TextStyle(
                                          fontSize: 15,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w400),
                                    )),
                                  ],
                                ))
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16.0),
              const ListTile(
                title: Text(
                  'Mentor of the week',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
                ),
              ),
              SizedBox(
                height: 100.0,
                width: double.infinity,
                child: ListView.builder(
                  itemCount: musicList.length,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  physics: const ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: NeuContainer(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const SizedBox(width: 8.0),
                            CircleAvatar(
                              radius: 26,
                              backgroundImage: NetworkImage(
                                musicList[index]['img'],
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            Container(
                              width: 140,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    index == 0
                                        ? 'Jhon Doe'
                                        : index == 1
                                            ? 'Ahmad Saad'
                                            : 'Peter Parker',
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    index == 0
                                        ? 'English Instructor'
                                        : index == 1
                                            ? 'Maths Instructor'
                                            : 'Physics Instructor',
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
