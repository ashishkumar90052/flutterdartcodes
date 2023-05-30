import 'package:dynamicapp/utils/const.dart';
import 'package:dynamicapp/utils/size_config.dart';
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
      // backgroundColor: Colors.amber[50],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * .55,
            child: Image.asset(
              'assets/splash.png',
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
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: NeuTextButton(
            buttonHeight: 55,
            buttonColor: const Color(0xffd744b8),
            borderColor: Colors.black,
            shadowColor: Colors.black,
            borderRadius: BorderRadius.circular(8),
            buttonWidth: MediaQuery.of(context).size.width * 0.5,
            child: const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Start Learning",
                  style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600, color: kWhite),
                ),
              ),
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const BottomNavigationBarExampleApp()));
            },
          ),
        ),
      ),
    );
  }
}

class BottomNavigationBarExampleApp extends StatelessWidget {
  const BottomNavigationBarExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const BottomNavigationBarExample();
  }
}

class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Home(),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _selectedIndex != 0
                ? const Icon(Icons.home_filled,
                    size: 32, color: Color.fromARGB(255, 96, 36, 84))
                : NeuIconButton(
                    buttonHeight: 45.0,
                    borderRadius: BorderRadius.circular(8),
                    buttonColor: _selectedIndex == 0
                        ? const Color(0xffd744b8)
                        : Colors.white,
                    icon: Icon(
                      Icons.home_filled,
                      color: _selectedIndex == 0
                          ? const Color(0xff650452)
                          : kBlack,
                    )),

            // Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex != 1
                ? const Icon(Icons.bookmark_outline,
                    size: 32, color: Color.fromARGB(255, 96, 36, 84))
                : NeuIconButton(
                    buttonHeight: 45,
                    borderRadius: BorderRadius.circular(8),
                    buttonColor: _selectedIndex == 1
                        ? const Color(0xffd744b8)
                        : Colors.white,
                    icon: Icon(
                      Icons.bookmark_rounded,
                      color: _selectedIndex == 1
                          ? const Color(0xff650452)
                          : kBlack,
                    )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _selectedIndex != 2
                ? const Icon(Icons.person_2_outlined,
                    size: 32, color: Color.fromARGB(255, 96, 36, 84))
                : NeuIconButton(
                    buttonHeight: 45,
                    borderRadius: BorderRadius.circular(8),
                    buttonColor: _selectedIndex == 2
                        ? const Color(0xffd744b8)
                        : Colors.white,
                    icon: Icon(
                      Icons.person_2_rounded,
                      color: _selectedIndex == 2
                          ? const Color(0xff650452)
                          : kBlack,
                    )),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
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
      backgroundColor: kWhite,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                title: const Text(
                  'Hi, Flutterdartcode',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w900),
                ),
                subtitle: const Text('Become a better worker today'),
                trailing: NeuContainer(
                  height: 50,
                  width: 50,
                  borderWidth: .5,
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset('assets/user 2.png'),
                ),
              ),
              const SizedBox(height: 16.0),
              ListTile(
                title: NeuSearchBar(
                  borderRadius: BorderRadius.circular(8),
                  searchBarColor: Colors.white,
                  hintText: 'What are you looking for',
                  searchBarIcon: const Icon(
                    Icons.search,
                    color: Colors.black,
                  ),
                  hintStyle: const TextStyle(color: Colors.black),
                ),
                trailing: NeuIconButton(
                    borderRadius: BorderRadius.circular(8),
                    buttonColor: Colors.white,
                    icon: const Icon(
                      Icons.filter_alt_rounded,
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
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            NeuContainer(
                              height: 50,
                              width: 50,
                              borderWidth: .5,
                              borderRadius: BorderRadius.circular(4),
                              child: Image.asset('assets/user 1.png'),
                            ),
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
                        Row(
                          children: [
                            Text(
                              '18 lessons',
                              style: TextStyle(
                                  color: Colors.teal.shade600,
                                  fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.circle,
                              size: 5,
                              color: Colors.teal.shade600,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '50% completed',
                              style: TextStyle(
                                  color: Colors.teal.shade600,
                                  fontWeight: FontWeight.w700),
                            ),
                            const Spacer(),
                            const Text(
                              '36 lessons',
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        h8,
                        LinearProgressIndicator(
                          value: .6,
                          backgroundColor: Colors.grey[300],
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.teal.shade600,
                          ),
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
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        child: Column(
                          children: [
                            Image.asset(
                              index.isEven
                                  ? 'assets/hs1.png'
                                  : 'assets/hs2.png',
                              // : musicList[index]['img'],
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
                                child: Row(
                                  children: const [
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
                        borderRadius: BorderRadius.circular(8),
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
              h24
            ],
          ),
        ),
      ),
    );
  }
}
