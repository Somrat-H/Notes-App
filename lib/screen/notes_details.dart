

import 'package:flutter/material.dart';
import 'package:keep_notes/components/bottom_bar.dart';
import 'package:keep_notes/screen/home_screen.dart';

// ignore: must_be_immutable
class NotesDetails extends StatelessWidget{

  TextEditingController titileControler = TextEditingController();
  TextEditingController descriptionControler = TextEditingController();
  
  Function  onPressed;
  Function() onTap;
  NotesDetails({super.key, required this.titileControler, required this.descriptionControler, required this.onPressed, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomBar(
        onTap: onTap,
      ),
      body: 
         Column(
          children: [
            SafeArea(
              child: SizedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){
                      onPressed();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>  const HomeScreen()));
                    }, icon: const Icon(Icons.arrow_back, color: Colors.white,)),
                    const SizedBox(width: 156,),
                    IconButton(onPressed: (){
                     
                    }, icon: const Icon(Icons.push_pin, color: Colors.white54,)),
                    const SizedBox(width: 5,),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.add_alert, color: Colors.white54,)),
                    const SizedBox(width: 5,),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.archive, color: Colors.white54,)),
                  ],
      
                ),
              ),
            ),
            const SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextFormField(
                controller: titileControler,
                 style: const TextStyle(
                  height: 2,
                  color: Colors.white
                 ),
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    color: Colors.white54,
                    fontSize: 22
                  )
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20,),
              child: TextFormField(
                style: const TextStyle(color: Colors.white),
                 cursorColor: Colors.white,
                 controller: descriptionControler,
                 decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Note',
                  hintStyle: TextStyle(
                    color: Colors.white54
                  )
                ),
              ),
            ),
          ],
        ),
      
    );
  }
}