// ignore_for_file: unnecessary_const

// import 'package:flutter/material.dart';
//
// class MealsList extends StatefulWidget {
//   const MealsList({Key? key}) : super(key: key);
//
//   @override
//   State<MealsList> createState() => _MealsListState();
// }
//
// class _MealsListState extends State<MealsList> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 700,
//       height: 170,
//       padding: const EdgeInsets.only(bottom: 10, right: 25,),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         color: Colors.transparent,
//       ),
//       child: SizedBox(
//         height: 50,
//         width: 50,
//         child: ListView.builder(
//           shrinkWrap: true,
//           itemCount: 3,
//           scrollDirection: Axis.horizontal,
//           itemBuilder: (BuildContext context, int index) {
//             //final activity = otherActivities[index];
//             // return buildActivity(activity,index);
//             return buildActivity(index);
//           },
//         ),
//       ),
//     );
//   }
// }
//
// //Widget buildActivity(OtherActivity otherActivities,int index) =>
// Widget buildActivity(int index) => Padding(
//   padding: const EdgeInsets.symmetric(horizontal: 10.0),
//   child: Material(
//     color: Colors.indigoAccent[100],
//     elevation: 10,
//     borderRadius: BorderRadius.circular(18),
//     clipBehavior: Clip.antiAliasWithSaveLayer,
//     child: InkWell(
//       splashColor: Colors.black26,
//       onTap: () {},
//       child: Container(
//         decoration: BoxDecoration(
//           color: Colors.transparent,
//           border: Border.all(color: Colors.blue.shade800,width: 4),
//           borderRadius: BorderRadius.circular(18),
//         ),
//         child: Ink.image(
//           image: const NetworkImage(
//               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRqrfquCPIwsSBkIe_msfSrrlQWhft1llfoRQ&usqp=CAU"),
//           height: 150,
//           width: 91,
//           fit: BoxFit.cover,
//           child: const Center(
//             child: const Text(
//               "Food Name",
//               style: const TextStyle(fontSize: 15, color: Colors.white),
//             ),
//           ),
//         ),
//       ),
//     ),
//   ),
// );
