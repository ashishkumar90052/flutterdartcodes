import 'package:flutter/material.dart';

class Music2 extends StatefulWidget {
  final String img;
  final String title;
  final String subtitle;
  const Music2(
      {super.key,
      required this.img,
      required this.title,
      required this.subtitle});

  @override
  State<Music2> createState() => _Music2State();
}

class _Music2State extends State<Music2> {
  double _currentSliderValue = 50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Container(
          decoration:
              BoxDecoration(color: Colors.grey[200], shape: BoxShape.circle),
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.blue,
                size: 36,
              )),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 48.0),
          Center(
              child: CircleAvatar(
                  radius: 160, backgroundImage: NetworkImage(widget.img))),
          const SizedBox(height: 48.0),
          Text(
            widget.title,
            style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w600,
                color: Colors.black54),
          ),
          Text(
            widget.subtitle,
            style: const TextStyle(fontSize: 16, color: Colors.black45),
          ),
          const SizedBox(height: 24.0),
          Slider(
            value: _currentSliderValue,
            max: 100,
            thumbColor: Colors.blue[800],
            activeColor: Colors.blue[800],
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
          const ListTile(
            dense: true,
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 24),
            leading: Text('0.32'),
            trailing: Text('3.58'),
          ),
          const SizedBox(height: 24.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous_rounded,
                    color: Colors.blue.shade800,
                    size: 48,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.pause_circle_filled_rounded,
                    size: 72,
                    color: Colors.blue.shade800,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next_rounded,
                    color: Colors.blue.shade800,
                    size: 48,
                  ))
            ],
          ),
          const SizedBox(height: 32.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.replay_outlined,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.repeat_outlined,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.speaker_outlined,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
