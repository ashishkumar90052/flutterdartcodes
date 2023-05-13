import 'package:dynamicapp/allscreens/8.music.dart';
import 'package:dynamicapp/utils/const.dart';
import 'package:flutter/material.dart';

class Music extends StatefulWidget {
  const Music({super.key});

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                width: double.infinity,
                height: 340,
                child: Image.network(
                  'https://i.pinimg.com/736x/48/e2/f5/48e2f5a85b7d312ead4595f86270e0f9.jpg',
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: ListTile(
                  title: const Text(
                    'Onerepublic',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                  trailing: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[800], shape: BoxShape.circle),
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                          ))),
                ),
              )
            ],
          ),
          ListTile(
            title: const Text(
              'Popular Songs',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black54),
            ),
            trailing: Text(
              'More',
              style: TextStyle(
                  fontWeight: FontWeight.w600, color: Colors.blue.shade700),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: newMusicList.length,
              separatorBuilder: (context, index) {
                return const Divider(
                  indent: 16.0,
                  endIndent: 16.0,
                  height: 0,
                  color: Colors.black12,
                );
              },
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            fullscreenDialog: true,
                            builder: (context) => Music2(
                                  img: newMusicList[index]['img'],
                                  title: newMusicList[index]['title'],
                                  subtitle: newMusicList[index]['subtitle'],
                                )));
                  },
                  leading: SizedBox(
                    width: 56,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          fit: StackFit.expand,
                          alignment: Alignment.center,
                          children: [
                            Image.network(
                              newMusicList[index]['img'],
                              fit: BoxFit.cover,
                            ),
                            index == 0
                                ? const Icon(Icons.graphic_eq_rounded,
                                    color: Colors.white)
                                : const SizedBox()
                          ],
                        )),
                  ),
                  title: Text(newMusicList[index]['title']),
                  subtitle: Text(newMusicList[index]['subtitle']),
                  trailing: Icon(
                    Icons.add_rounded,
                    size: 28,
                    color: Colors.blue.shade600,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
