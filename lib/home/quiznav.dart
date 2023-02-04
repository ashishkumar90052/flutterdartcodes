// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class QuizNav extends StatefulWidget {
//   const QuizNav({super.key});

//   @override
//   State<QuizNav> createState() => _QuizNavState();
// }

// class _QuizNavState extends State<QuizNav> {
//   List<Map> quizData = [
//     {
//       'img': 'https://cdn-icons-png.flaticon.com/512/3235/3235079.png',
//       'title': 'Chemistry',
//       'subtitle':
//           'Basic Chemistry Multiple Choice Questions (MCQ) to practice basic Chemistry quiz answers.',
//       'quizLength': '10 Quiz',
//       'quizTime': '20 min',
//     },
//     {
//       'img': 'https://cdn-icons-png.flaticon.com/512/9594/9594677.png',
//       'title': 'Physics',
//       'subtitle':
//           'Basic Physics Multiple Choice Questions (MCQ) to practice basic Physics quiz answers.',
//       'quizLength': '10 Quiz',
//       'quizTime': '20 min',
//     },
//     {
//       'img': 'https://cdn-icons-png.flaticon.com/512/9517/9517440.png',
//       'title': 'Maths',
//       'subtitle':
//           'Basic Maths Multiple Choice Questions (MCQ) to practice basic Maths quiz answers',
//       'quizLength': '10 Quiz',
//       'quizTime': '20 min',
//     },
//     {
//       'img': 'https://cdn-icons-png.flaticon.com/512/811/811453.png',
//       'title': 'Bio',
//       'subtitle':
//           'Basic Bio Multiple Choice Questions (MCQ) to practice basic Bio quiz answers',
//       'quizLength': '10 Quiz',
//       'quizTime': '20 min',
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       backgroundColor: Theme.of(context).primaryColor,
//       appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           iconTheme: const IconThemeData(color: Colors.white),
//           leadingWidth: 120,
//           toolbarHeight: 40,
//           leading: OutlinedButton.icon(
//             style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
//             icon: const Icon(Icons.timer_outlined),
//             onPressed: () {},
//             label: const Text('20.00'),
//           ),
//           title: const Text('Q. 5', style: TextStyle(color: Colors.white)),
//           actions: [
//             IconButton(
//                 onPressed: () {},
//                 icon: const Icon(CupertinoIcons.arrow_up_square,
//                     color: Colors.white, size: 32))
//           ]),
//       body: SafeArea(
//         bottom: false,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const ListTile(
//                 title: Text(
//                   'Welcome Back',
//                   style: TextStyle(fontSize: 32, color: Colors.white),
//                 ),
//                 subtitle: Text(
//                   'What do you want to improve Today?',
//                   style: TextStyle(color: Colors.white70),
//                 )),
//             Container(
//                 color: Theme.of(context).primaryColor.withOpacity(.1),
//                 padding: const EdgeInsets.only(top: 16),
//                 height: MediaQuery.of(context).size.height * .775,
//                 width: double.infinity,
//                 child: Card(
//                   surfaceTintColor:
//                       Theme.of(context).primaryColor.withOpacity(.1),
//                   child: ListView.separated(
//                     padding: const EdgeInsets.symmetric(
//                         vertical: 24, horizontal: 16),
//                     itemCount: quizData.length,
//                     separatorBuilder: (BuildContext context, int index) {
//                       return const SizedBox(height: 8);
//                     },
//                     itemBuilder: (BuildContext context, int index) {
//                       return Card(
//                         clipBehavior: Clip.antiAlias,
//                         elevation: 0,
//                         surfaceTintColor: Colors.white,
//                         child: Stack(
//                           children: [
//                             ListTile(
//                               isThreeLine: true,
//                               onTap: () {},
//                               leading: ClipRRect(
//                                   borderRadius: BorderRadius.circular(8),
//                                   child: Image.network(quizData[index]['img'])),
//                               title: Text(
//                                 quizData[index]['title'],
//                                 style: TextStyle(
//                                   fontSize: 16,
//                                   fontWeight: FontWeight.w600,
//                                   color: Theme.of(context).primaryColor,
//                                 ),
//                               ),
//                               subtitle: Column(
//                                 children: [
//                                   const SizedBox(height: 8.0),
//                                   Text(quizData[index]['subtitle']),
//                                   const SizedBox(height: 8.0),
//                                   Row(
//                                     children: [
//                                       Icon(Icons.help_outline,
//                                           size: 20,
//                                           color:
//                                               Theme.of(context).primaryColor),
//                                       const SizedBox(width: 8.0),
//                                       Text(
//                                           quizData[index]['quizLength']
//                                               .toString(),
//                                           style: TextStyle(
//                                               fontSize: 12,
//                                               color: Theme.of(context)
//                                                   .primaryColor)),
//                                       const SizedBox(width: 16),
//                                       const Icon(Icons.timer_outlined,
//                                           size: 20),
//                                       const SizedBox(width: 8.0),
//                                       Text(
//                                         quizData[index]['quizTime'].toString(),
//                                         style: const TextStyle(fontSize: 12),
//                                       ),
//                                     ],
//                                   ),
//                                   const SizedBox(height: 8),
//                                 ],
//                               ),
//                             ),
//                             Positioned(
//                                 bottom: 0,
//                                 right: 0,
//                                 child: Container(
//                                     decoration: BoxDecoration(
//                                       borderRadius: const BorderRadius.only(
//                                           topLeft: Radius.circular(15)),
//                                       color: Theme.of(context).primaryColor,
//                                     ),
//                                     padding: const EdgeInsets.all(10),
//                                     child: const Icon(Icons.east_rounded,
//                                         color: Colors.white, size: 20)

//                                     //     style: TextStyle(color: Colors.white))
//                                     ))
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 )),
//           ],
//         ),
//       ),
//     );
//   }
// }
