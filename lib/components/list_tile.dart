import 'package:flutter/material.dart';

// ignore: must_be_immutable
class NotesTile extends StatelessWidget {
  final String notesTitle;
  final String notesDescription;
  Function()? onTap;
   NotesTile(
      {super.key, required this.notesTitle, required this.notesDescription, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return 
       InkWell(
        onTap: onTap,
         child: Padding(
           padding: const EdgeInsets.all(5.0),
           child: Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 61, 57, 57),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    notesTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  // const SizedBox(
                  //   height: 5,
                  // ),
                  Text(
                    notesDescription,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                 
                ],
              ),
            ),
             
           ),
         ),
       );
  }
}
