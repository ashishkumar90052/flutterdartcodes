import 'package:flutter/material.dart';

import 'package:photo_view/photo_view.dart';

class ImgPreview extends StatefulWidget {
  final dynamic img;
  const ImgPreview({super.key, required this.img});

  @override
  State<ImgPreview> createState() => _ImgPreviewState();
}

class _ImgPreviewState extends State<ImgPreview> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Photo view')),
      body: PhotoView(
        basePosition: Alignment.center,
        imageProvider: NetworkImage(widget.img.toString()),
        loadingBuilder: (context, event) => const Center(
          child: CircularProgressIndicator.adaptive(),
        ),
      ),


      
    );
  }
}
