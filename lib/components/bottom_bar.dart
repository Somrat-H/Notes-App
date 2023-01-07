import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:keep_notes/model/data_model.dart';

import '../screen/home_screen.dart';



// ignore: must_be_immutable
class BottomBar extends StatelessWidget {
  Function() onTap;
  
  BottomBar({super.key, required this.onTap});

 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      color: Colors.black,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            const Icon(Icons.add_box_outlined, color: Colors.white,),
          const SizedBox(width: 20,),
           const Icon(Icons.palette_outlined, color: Colors.white,),
           const SizedBox(width: 50,),
            const Text('Edited', style: TextStyle(
              color: Colors.white,
            ),),
            Text(getCurrentDate(), style: const TextStyle(
              color: Colors.white,
            ),),
            const SizedBox(width: 89,),
            IconButton(
              autofocus: false,
              onPressed: (){
                showModalBottomSheet(
                  backgroundColor: Colors.black,
                  context: context, 
                  builder: (context){
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children:  [
                         ListTile(
                          leading: const Icon(Icons.delete_outlined, color: Colors.white,),
                          title: const Text('Delete', style: TextStyle(
                            color: Colors.white,
                          ),),
                          onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context)=> const HomeScreen())); 
                            onTap();
                          },
                        ),
                        const ListTile(
                          leading: Icon(Icons.copy, color: Colors.white,),
                          title: Text('Make a copy', style: TextStyle(
                            color: Colors.white,
                          ),),
                        ),
                        const ListTile(
                          leading: Icon(Icons.share, color: Colors.white,),
                          title: Text('Send', style: TextStyle(
                            color: Colors.white,
                          ),),
                        ),
                        const ListTile(
                          leading: Icon(Icons.people_alt, color: Colors.white,),
                          title: Text('Collaborator', style: TextStyle(
                            color: Colors.white,
                          ),),
                        ),
                        const ListTile(
                          leading: Icon(Icons.label_outline, color: Colors.white,),
                          title: Text('Labels', style: TextStyle(
                            color: Colors.white,
                          ),),
                        ),
                        const ListTile(
                          leading: Icon(Icons.question_mark_outlined, color: Colors.white,),
                          title: Text('Help & Feedback', style: TextStyle(
                            color: Colors.white,
                          ),),
                        ),
                          ],
                    );
                  });
              },
               icon: const Icon(Icons.more_vert_sharp, color: Colors.white,),
           )
          ],
        ),
      ),
    ),
  );
  }
}

String getCurrentDate() {
   DateTime now = DateTime.now();
   String formattedDate = DateFormat.yMMMd().format(now);

    return formattedDate.toString();
  }
