// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MyAppRating extends StatefulWidget {
  const MyAppRating({super.key});

  @override
  _MyAppRatingState createState() => _MyAppRatingState();
}

class _MyAppRatingState extends State<MyAppRating> {
  // ignore: prefer_typing_uninitialized_variables
  late final _ratingController;
  late double _rating;

  double _userRating = 3.0;
  int _ratingBarMode = 1;
  final double _initialRating = 2.0;
  final bool _isRTLMode = false;
  final bool _isVertical = false;

  IconData? _selectedIcon;

  @override
  void initState() {
    super.initState();
    _ratingController = TextEditingController(text: '3.0');
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Rating Bar'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              color: Colors.white,
              onPressed: () async {
                _selectedIcon = await showDialog<IconData>(
                  context: context,
                  builder: (context) => const IconAlert(),
                );
                _ratingBarMode = 1;
                setState(() {});
              },
            ),
          ],
        ),
        body: Directionality(
          textDirection: _isRTLMode ? TextDirection.rtl : TextDirection.ltr,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const SizedBox(
                  height: 40.0,
                ),
                _heading('Rating Bar'),
                _ratingBar(_ratingBarMode),
                const SizedBox(height: 20.0),
                Text(
                  'Rating: $_rating',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 40.0),
                _heading('Rating Indicator'),
                RatingBarIndicator(
                  rating: _userRating,
                  itemBuilder: (context, index) => Icon(
                    _selectedIcon ?? Icons.star,
                    color: Colors.amber,
                  ),
                  itemCount: 5,
                  itemSize: 50.0,
                  unratedColor: Colors.amber.withAlpha(50),
                  direction: _isVertical ? Axis.vertical : Axis.horizontal,
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextFormField(
                    autofocus: false,
                    controller: _ratingController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Enter rating',
                      labelText: 'Enter rating',
                      suffixIcon: MaterialButton(
                        onPressed: () {
                          _userRating =
                              double.parse(_ratingController.text ?? '0.0');
                          setState(() {});
                        },
                        child: const Text('Rate'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40.0),
                const Text(
                  'Rating Bar Modes',
                  style: TextStyle(fontWeight: FontWeight.w300),
                ),
                Row(
                  children: [
                    _radio(1),
                    _radio(3),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _radio(int value) {
    return Expanded(
      child: RadioListTile<int>(
        value: value,
        groupValue: _ratingBarMode,
        dense: true,
        title: Text(
          'Mode $value',
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 12.0,
          ),
        ),
        onChanged: (value) {
          setState(() {
            _ratingBarMode = value!;
          });
        },
      ),
    );
  }

  Widget _ratingBar(int mode) {
    switch (mode) {
      case 1:
        return RatingBar.builder(
          initialRating: _initialRating,
          minRating: 1,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          allowHalfRating: true,
          unratedColor: Colors.amber.withAlpha(50),
          itemCount: 5,
          itemSize: 50.0,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            _selectedIcon ?? Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      case 2:
        return RatingBar(
          initialRating: _initialRating,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          ratingWidget: RatingWidget(
            full: _image('assets/heart.png'),
            half: _image('assets/heart_half.png'),
            empty: _image('assets/heart_border.png'),
          ),
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      case 3:
        return RatingBar.builder(
          initialRating: _initialRating,
          direction: _isVertical ? Axis.vertical : Axis.horizontal,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, index) {
            switch (index) {
              case 0:
                return const Icon(
                  Icons.sentiment_very_dissatisfied,
                  color: Colors.red,
                );
              case 1:
                return const Icon(
                  Icons.sentiment_dissatisfied,
                  color: Colors.redAccent,
                );
              case 2:
                return const Icon(
                  Icons.sentiment_neutral,
                  color: Colors.amber,
                );
              case 3:
                return const Icon(
                  Icons.sentiment_satisfied,
                  color: Colors.lightGreen,
                );
              case 4:
                return const Icon(
                  Icons.sentiment_very_satisfied,
                  color: Colors.green,
                );
              default:
                return Container();
            }
          },
          onRatingUpdate: (rating) {
            setState(() {
              _rating = rating;
            });
          },
          updateOnDrag: true,
        );
      default:
        return Container();
    }
  }

  Widget _image(String asset) {
    return Image.asset(
      asset,
      height: 30.0,
      width: 30.0,
      color: Colors.amber,
    );
  }

  Widget _heading(String text) => Column(
        children: [
          Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.w300,
              fontSize: 24.0,
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
        ],
      );
}

class IconAlert extends StatelessWidget {
  const IconAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Select Icon',
        style: TextStyle(
          fontWeight: FontWeight.w300,
        ),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      titlePadding: const EdgeInsets.all(12.0),
      contentPadding: const EdgeInsets.all(0),
      content: Wrap(
        children: [
          _iconButton(context, Icons.home),
          _iconButton(context, Icons.airplanemode_active),
          _iconButton(context, Icons.euro_symbol),
          _iconButton(context, Icons.beach_access),
          _iconButton(context, Icons.attach_money),
          _iconButton(context, Icons.music_note),
          _iconButton(context, Icons.android),
          _iconButton(context, Icons.toys),
          _iconButton(context, Icons.language),
          _iconButton(context, Icons.landscape),
          _iconButton(context, Icons.ac_unit),
          _iconButton(context, Icons.star),
        ],
      ),
    );
  }

  Widget _iconButton(BuildContext context, IconData icon) => IconButton(
        icon: Icon(icon),
        onPressed: () => Navigator.pop(context, icon),
        splashColor: Colors.amberAccent,
        color: Colors.amber,
      );
}
