import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CartUi extends StatefulWidget {
  const CartUi({super.key});

  @override
  State<CartUi> createState() => _CartUiState();
}

class _CartUiState extends State<CartUi> {
  int? selectedNumber; // The selected number from the dropdown menu

  List<int> numbers = [1, 2, 3, 4, 5]; // List of numbers for the dropdown menu

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                child: Card(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              child: Container(
                  width: 350,
                  height: 150,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 150,
                        width: 120,
                        child: Image.network(
                            'https://s7d1.scene7.com/is/image/mcdonalds/DC_202002_6050_SmallFrenchFries_Standing_832x472:product-header-desktop?wid=830&hei=456&dpr=off'),
                      )),
                      const SizedBox(width: 16.0),
                      Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('French Fries',
                                  style: GoogleFonts.dosis(
                                    textStyle: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )),
                              const Text(
                                'Rosted Patato sticks slightly sprinkled with salt.',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54),
                              ),
                              ListTile(
                                contentPadding: EdgeInsets.zero,
                                title: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          Icons.remove,
                                          size: 20,
                                          color: Colors.white,
                                        )),
                                    const SizedBox(width: 8),
                                    const Text(
                                      '4',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    const SizedBox(width: 8),
                                    Container(
                                        decoration: const BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle),
                                        child: const Icon(
                                          Icons.add,
                                          size: 20,
                                          color: Colors.white,
                                        )),
                                  ],
                                ),
                              )
                            ],
                          )),
                      Align(
                          alignment: Alignment.topRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(height: 4),
                              Text('\$ 2.99',
                                  style: GoogleFonts.dosis(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                              const Spacer(),
                              const Icon(Icons.delete_outline),
                              const SizedBox(height: 16)
                            ],
                          )),
                    ],
                  )),
            )),
            const SizedBox(width: 16.0),
            Flexible(
                child: Card(
              surfaceTintColor: Colors.white,
              color: Colors.white,
              child: Container(
                  width: 350,
                  height: 150,
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        height: 150,
                        width: 120,
                        child: Image.network(
                            'https://s7d1.scene7.com/is/image/mcdonalds/DC_202002_6050_SmallFrenchFries_Standing_832x472:product-header-desktop?wid=830&hei=456&dpr=off'),
                      )),
                      const SizedBox(width: 16.0),
                      Flexible(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('French Fries',
                                  style: GoogleFonts.dosis(
                                    textStyle: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold),
                                  )),
                              const Text(
                                'Rosted Patato sticks slightly sprinkled with salt.',
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black54),
                              ),
                              Container(
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(6)),
                                child: DropdownButton<int>(
                                
                                  value: selectedNumber,
                                  onChanged: (newValue) {
                                    setState(() {
                                      selectedNumber = newValue;
                                    });
                                  },
                                  items: numbers.map((int number) {
                                    return DropdownMenuItem<int>(
                                      value: number,
                                      child: Text(number.toString()),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ],
                          )),
                      Align(
                          alignment: Alignment.topRight,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              const SizedBox(height: 4),
                              Text('\$ 2.99',
                                  style: GoogleFonts.dosis(
                                    textStyle: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )),
                              const Spacer(),
                              const Icon(Icons.delete_outline),
                              const SizedBox(height: 16)
                            ],
                          )),
                    ],
                  )),
            )),
          ],
        ),
      ),
    );
  }
}
