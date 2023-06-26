// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
// import 'package:chewie/chewie.dart';
// import 'package:flutter_swiper/flutter_swiper.dart';

// class ReelsUI extends StatefulWidget {
//   const ReelsUI({super.key});

//   @override
//   ReelsUIState createState() => ReelsUIState();
// }

// class ReelsUIState extends State<ReelsUI> {
//   List<String> videoUrls = [
//     // Replace with your video URLs
//     'https://example.com/video1.mp4',
//     'https://example.com/video2.mp4',
//     'https://example.com/video3.mp4',
//   ];
 
//   List<VideoPlayerController> videoControllers = [];
//   List<ChewieController> chewieControllers = [];
//   SwiperController swiperController = SwiperController();

//   @override
//   void initState() {
//     super.initState();
//     for (String url in videoUrls) {
//       var videoController = VideoPlayerController.network(url);
//       var chewieController = ChewieController(
//         videoPlayerController: videoController,
//         autoPlay: true,
//         looping: true,
//       );
//       videoControllers.add(videoController);
//       chewieControllers.add(chewieController);
//     }
//   }

//   @override
//   void dispose() {
//     for (ChewieController controller in chewieControllers) {
//       controller.dispose();
//     }
//     for (VideoPlayerController controller in videoControllers) {
//       controller.dispose();
//     }
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Reels'),
//       ),
//       body: Swiper(
//         itemCount: videoUrls.length,
//         itemBuilder: (context, index) {
//           return _buildReelItem(index);
//         },
//         loop: false,
//         controller: swiperController,
//         onIndexChanged: (index) {
//           for (int i = 0; i < chewieControllers.length; i++) {
//             if (i == index) {
//               chewieControllers[i].play();
//             } else {
//               chewieControllers[i].pause();
//             }
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildReelItem(int index) {
//     return GestureDetector(
//       onVerticalDragUpdate: (details) {
//         if (details.delta.dy > 0) {
//           // Swipe down
//           // Perform action like closing the Reels UI
//           Navigator.pop(context);
//         } else if (details.delta.dy < 0) {
//           // Swipe up
//           // Perform action like showing more information
//           // about the current reel or interact with it
//         }
//       },
//       child: Chewie(
//         controller: chewieControllers[index],
//       ),
//     );
//   }
// }
