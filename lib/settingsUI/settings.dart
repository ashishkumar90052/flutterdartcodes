import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  var title1 = const TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  var title = const TextStyle(fontSize: 18, fontWeight: FontWeight.w600);
  var titleBottm = const TextStyle(fontWeight: FontWeight.w600);
  var subtitle = const TextStyle(color: Colors.black45);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Text('Settings'),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://storage.googleapis.com/cms-storage-bucket/images/Dash_Phone_Games_v04.width-635.png'),
              ),
              title: Text('Flutter Dart Code', style: title1),
              subtitle: Text(
                'Edit Profile',
                style: subtitle,
              ),
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              child: const Text('CONTENT'),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity.comfortable,
              leading: Icon(CupertinoIcons.square_favorites),
              title: Text('Favorite', style: title),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity.comfortable,
              leading: Icon(CupertinoIcons.folder_solid),
              title: Text('Downloads', style: title),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.black12,
              ),
              child: const Text('PREFERENCES'),
            ),
            ListTile(
              visualDensity: VisualDensity.comfortable,
              leading: Icon(CupertinoIcons.person),
              title: Text('Accounts', style: title),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity.comfortable,
              leading: Icon(CupertinoIcons.music_note_2),
              title: Text('Notification', style: title),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity.comfortable,
              leading: Icon(CupertinoIcons.lock),
              title: Text('Privacy & Security', style: title),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity.comfortable,
              leading: Icon(Icons.language),
              title: Text('Language', style: title),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity.comfortable,
              leading: Icon(Icons.info_outline),
              title: Text('About', style: title),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity.comfortable,
              leading: Icon(Icons.help_outline),
              title: Text('Help', style: title),
            ),
            ListTile(
              dense: true,
              visualDensity: VisualDensity.comfortable,
              leading: Icon(Icons.logout),
              title: Text('Logout', style: title),
            ),
          ]),
        ));
  }
}
