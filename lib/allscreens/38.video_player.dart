import 'package:dynamicapp/utils/size_config.dart';
import 'package:flutter/material.dart';
import 'package:better_player/better_player.dart';

class Video {
  final String title;
  final String videoUrl;

  Video({required this.title, required this.videoUrl});
}

class VideoListScreen extends StatelessWidget {
  final List<Video> videos = [
    Video(
      title: 'Video 1',
      videoUrl:
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"',
    ),
    Video(
      title: 'Video 2',
      videoUrl:
          'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4',
    ),
    Video(
      title: 'Video 3',
      videoUrl:
          'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    ),
    Video(
      title: 'Video 4',
      videoUrl:
          'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    ),
    Video(
      title: 'Video 5',
      videoUrl: 'https://eng-demo.cablecast.tv/segmented-captions/vod.m3u',
    ),
    // Add more videos as needed
  ];

  VideoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player Demo'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: videos.length,
              itemBuilder: (context, index) {
                final video = videos[index];
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(child: Text('${index + 1}')),
                    title: Text(video.title),
                    subtitle: Text(video.title),
                    trailing: Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: kRed,
                        ),
                        child: const Icon(Icons.play_arrow_rounded)),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerScreen(video: video),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class VideoPlayerScreen extends StatelessWidget {
  final Video video;

  const VideoPlayerScreen({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SafeArea(
            child: BetterPlayer.network(
              video.videoUrl,
              betterPlayerConfiguration: const BetterPlayerConfiguration(
                  autoPlay: true,
                  looping: true,
                  aspectRatio: 16 / 10,
                  autoDispose: true),
            ),
          ),
        ],
      ),
    );
  }
}
