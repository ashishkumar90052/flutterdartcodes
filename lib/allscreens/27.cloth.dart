import 'package:dynamicapp/utils/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:readmore/readmore.dart';

class ClothApp extends StatefulWidget {
  const ClothApp({super.key});

  @override
  State<ClothApp> createState() => _ClothAppState();
}

class _ClothAppState extends State<ClothApp> {
  bool _isLiked = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  int itemCount = 0;

  void addItem() {
    setState(() {
      itemCount++;
    });
  }

  void removeItem() {
    setState(() {
      if (itemCount > 0) {
        itemCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: kTransparent,
        elevation: 0,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: kTransparent,
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Container(
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: kWhite),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.arrow_back_ios_new_rounded)),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 32.0),
            child: Container(
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: kWhite),
              child: IconButton(
                icon: Icon(
                  _isLiked ? Icons.favorite : Icons.favorite_border,
                  color: _isLiked ? Colors.red : null,
                ),
                onPressed: _toggleLike,
              ),
            ),
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(20.0, 56.0, 20.0, 20.0),
        children: [
          SizedBox(
            height: height * .5,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                'https://images.unsplash.com/photo-1513094735237-8f2714d57c13?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80',
                fit: BoxFit.cover,
              ),
            ),
          ),
          h16,
          ListTile(
            contentPadding: EdgeInsets.zero,
            title: Text('Modern light\ncloths',
                style: GoogleFonts.notoSans(
                    fontSize: 25, fontWeight: FontWeight.w700)),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Row(
                children: [
                  const Icon(Icons.star, size: 18, color: Colors.amber),
                  w4,
                  const Icon(Icons.star, size: 18, color: Colors.amber),
                  w4,
                  const Icon(Icons.star, size: 18, color: Colors.amber),
                  w4,
                  const Icon(Icons.star, size: 18, color: Colors.amber),
                  w4,
                  const Icon(Icons.star, size: 18, color: Colors.amber),
                  w8,
                  RichText(
                    text: const TextSpan(
                      text: '5.0',
                      style: TextStyle(color: Colors.black54),
                      children: <TextSpan>[
                        TextSpan(
                            text: ' (7932 reviews)',
                            style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      border: Border.all(color: kBlack12),
                      shape: BoxShape.circle),
                  child: IconButton(
                    onPressed: removeItem,
                    icon: const Icon(Icons.remove, color: kBlack),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    itemCount.toString(),
                    style: textStyleHeading,
                  ),
                ),
                Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        border: Border.all(color: kBlack12),
                        shape: BoxShape.circle),
                    child: IconButton(
                      onPressed: addItem,
                      icon: const Icon(Icons.add_rounded, color: kBlack),
                    )),
              ],
            ),
          ),
          h8,
          const ReadMoreText(
            "Nothing is more relaxing than laying on a beach towel and soaking up the sun. This adidas t-shirt channels that beachy vibe with an 8-bit graphic of clear skies and palm trees. Cotton single jersey is as soft as the warm breeze you feel when you're on vacation.\n\nOur cotton products support more sustainable cotton farming.",
            trimLength: 130,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
          ),
          h16,
          const Divider(),
          h8,
          SizedBox(
            width: 200,
            child: Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Choose Size',
                          style: GoogleFonts.notoSans(
                              textStyle: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w800)),
                        ),
                        h8,
                        Row(
                          children: [
                            buildIconButton(IconSize.S, 'S'),
                            buildIconButton(IconSize.M, 'M'),
                            buildIconButton(IconSize.L, 'L'),
                            buildIconButton(IconSize.XL, "XL"),
                          ],
                        )
                      ],
                    )),
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Color',
                        style: GoogleFonts.notoSans(
                            textStyle: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w800))),
                    h8,
                    // Row(
                    //   children: [
                    //     Expanded(child: buildColor(IconSize.M)),
                    //     Expanded(child: Text('data')),
                    //     Expanded(child: Text('data')),
                    //   ],
                    // )
                    Row(
                      children: [
                        buildColor(Num.A),
                        buildColor(Num.B),
                        buildColor(Num.C),
                      ],
                    ),
                  ],
                ))
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: FilledButton.icon(
            style: FilledButton.styleFrom(
                backgroundColor: kBlack,
                minimumSize: const Size(double.infinity, 50.0)),
            icon: const Icon(CupertinoIcons.cart),
            onPressed: () {},
            label: const Text("Add to cart | 100.99"),
          ),
        ),
      ),
    );
  }

  IconSize selectedSize = IconSize.M; // Default selected size
  Num selectedColor = Num.A; // Default selected color
// Default selected size

  Widget buildIconButton(IconSize size, String label) {
    Color iconColor = selectedSize == size ? kBlack : Colors.grey.shade300;
    Color txtColor = selectedSize == size ? kWhite : kBlack;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        decoration: BoxDecoration(color: iconColor, shape: BoxShape.circle),
        child: InkWell(
          onTap: () {
            setState(() {
              selectedSize = size;
              debugPrint(selectedSize.toString());
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: txtColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildColor(Num color) {
    Color iconColor =
        selectedColor == color ? Colors.black : Colors.grey.shade300;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedColor = color;
          debugPrint(selectedColor.toString());
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: iconColor, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

enum IconSize { S, M, L, XL }

enum Num { A, B, C }
