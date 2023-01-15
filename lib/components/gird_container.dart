// import 'package:flutter/material.dart';
// import 'package:keep_notes/components/colors.dart';

// class GirdContainer extends StatelessWidget {
//   final String title;
//   final String des;
//   int itemcount;
//   GirdContainer({super.key, required this.title, required this.des, required this.itemcount});
  

//   @override
//   Widget build(BuildContext context) {
//     return GridView.builder(
//       itemCount: itemcount,
//       gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//                 maxCrossAxisExtent: 200,
//                 childAspectRatio: 3 / 2,
//                 crossAxisSpacing: 20,
//                 mainAxisSpacing: 20), 
//       itemBuilder: (context, index){
//         return  Container(
//                 padding: EdgeInsets.all(10),
//                 decoration: BoxDecoration(
//                     border: Border.all(color: Colors.white.withOpacity(0.4)),
//                     borderRadius: BorderRadius.circular(7)),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(title,
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold)),
//                     SizedBox(
//                       height: 10,
//                     ),
//                     Text(
//                       des,
//                       style: TextStyle(color: Colors.white, fontSize: 12),
//                     )
//                   ],
//                 ),
//               );
        
//       });
//   }
// }