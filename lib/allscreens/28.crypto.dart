import 'package:dynamicapp/utils/const.dart';
import 'package:dynamicapp/utils/size_config.dart';
import 'package:flutter/material.dart';

class Crypto extends StatefulWidget {
  const Crypto({super.key});

  @override
  State<Crypto> createState() => _CryptoState();
}

class _CryptoState extends State<Crypto> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorLearn,
      body: SafeArea(
        top: false,
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.fromLTRB(16.0, 90.0, 16.0, 16.0),
          children: [
            Row(
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: kBlack54),
                    ),
                    Text(
                      'Peter Jones',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: kBlack),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://www.ukmodels.co.uk/wp-content/uploads/2020/08/shutterstock_397813951-scaled.jpg'))),
                )
              ],
            ),
            h16,
            Container(
              height: 200.0,
              decoration: BoxDecoration(
                color: Colors.indigo.shade600,
                borderRadius: BorderRadius.circular(24),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Balance',
                        style: TextStyle(fontSize: 18, color: kWhite),
                      ),
                      h8,
                      const Text(
                        "\$ 4,50,933",
                        style: TextStyle(
                            fontSize: 32,
                            color: kWhite,
                            fontWeight: FontWeight.w900),
                      ),
                      h24,
                      Row(
                        children: [
                          const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Monthly profit',
                                  style: TextStyle(fontSize: 18, color: kWhite),
                                ),
                                Text(
                                  "\$ 15334",
                                  style: TextStyle(
                                      fontSize: 24,
                                      color: kWhite,
                                      fontWeight: FontWeight.w800),
                                ),
                              ]),
                          const Spacer(),
                          FilledButton.icon(
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.white12),
                            onPressed: () {},
                            label: const Text('+10%'),
                            icon: const Icon(Icons.arrow_drop_up_rounded),
                          )
                        ],
                      ),
                    ]),
              ),
            ),
            h24,
            Text('My Portfolio', style: textStyleHeading),
            h16,
            SizedBox(
              height: 170,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: musicList.length,
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    width: 260,
                    child: Card(
                      color: kWhite,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  height: 56,
                                  width: 56,
                                  child: Image.network(index.isEven
                                      ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png'
                                      : 'https://w7.pngwing.com/pngs/268/1013/png-transparent-ethereum-eth-hd-logo-thumbnail.png'),
                                ),
                                w16,
                                Text(index == 0 ? 'BTC' : 'ETH',
                                    style: textStyleHeading)
                              ],
                            ),
                            h24,
                            Row(
                              children: [
                                const Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Portfolio',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18,
                                            color: kBlack54),
                                      ),
                                      Text(
                                        "\$ 1,54,334",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800),
                                      ),
                                    ]),
                                const Spacer(),
                                TextButton.icon(
                                  style: FilledButton.styleFrom(
                                      backgroundColor: Colors.white12),
                                  onPressed: () {},
                                  label: const Text('+10%'),
                                  icon: const Icon(Icons.arrow_drop_up_rounded),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            h24,
            Row(
              children: [
                Text('Popular Currencies', style: textStyleHeading),
                const Spacer(),
                TextButton(child: const Text('See More'), onPressed: () {}),
              ],
            ),
            h8,
            ListView.builder(
              itemCount: 4,
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const ScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    color: kWhite,
                    child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ListTile(
                                leading: SizedBox(
                                  height: 56,
                                  width: 56,
                                  child: Image.network(index.isEven
                                      ? 'https://upload.wikimedia.org/wikipedia/commons/thumb/4/46/Bitcoin.svg/800px-Bitcoin.svg.png'
                                      : 'https://w7.pngwing.com/pngs/268/1013/png-transparent-ethereum-eth-hd-logo-thumbnail.png'),
                                ),
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(index.isEven ? 'Bitcoin' : 'Ethereum',
                                        style: textStyleHeading),
                                    Row(
                                      children: [
                                        Text(index == 0 ? 'BTC' : 'ETH',
                                            style:
                                                const TextStyle(fontSize: 15)),
                                        w8,
                                        Wrap(
                                          children: [
                                            Icon(Icons.arrow_drop_up_rounded,
                                                color: Theme.of(context)
                                                    .colorScheme
                                                    .primary),
                                            const Text('+ 43.6%',
                                                style: TextStyle(fontSize: 15))
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                trailing: const Text(
                                  "\$ 1,54,334",
                                  style: TextStyle(
                                      fontSize: 16,
                                      letterSpacing: -1,
                                      fontWeight: FontWeight.w700),
                                ),
                                contentPadding: EdgeInsets.zero,
                              ),
                            ])));
              },
            ),
          ],
        ),
      ),
    );
  }
}
