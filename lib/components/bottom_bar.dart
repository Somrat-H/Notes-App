import 'package:flutter/material.dart';


import 'package:intl/intl.dart';
import 'package:keep_notes/components/round_container.dart';


import '../screen/home_screen.dart';
import 'colors.dart';


// ignore: must_be_immutable
class BottomBar extends StatefulWidget {
  Function() onTap;
  
  BottomBar({super.key, required this.onTap, });

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  // Color backgroundColor = bgDefault;

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
          const SizedBox(width: 15,),
           IconButton(onPressed: (){

          showBottomSheet  (
              backgroundColor: backgroundColors,
              context: context, builder: (context){
              return  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Colors", style: TextStyle(
                        color: Colors.white,
                      ),),
                      const SizedBox(height: 20,),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                              InkWell(
                                onTap: () { 
                                     if(bgColor1 != backgroundColors){
                                       setState(() {
                                         backgroundColors = bgColor1;
                                       });
                                     }
                                   },
                                child: RoundContainer(
                                  top: bgColor1, 
                                ),
                              ),
                              const SizedBox(width: 10,),
                              InkWell(
                                onTap: () {
                                     if(bgColor2 != backgroundColors){
                                       setState(() {
                                         backgroundColors = bgColor2;
                                       });
                                     }
                                  },
                                child: RoundContainer(
                                  top: bgColor2, 
                              
                                ),
                              ),
                              const SizedBox(width: 10,),
                              InkWell(
                                 onTap: (){
                                     if(bgColor3 != backgroundColors){
                                       setState(() {
                                         backgroundColors = bgColor3;
                                       });
                                     }
                                  },
                                child: RoundContainer(
                                  top: bgColor3,
                                 
                                ),
                              ),
                              const SizedBox(width: 10,),
                              RoundContainer(
                                top: bgColor4,
                                
                              ),
                              const SizedBox(width: 10,),

                              RoundContainer(
                                top: bgColor5,
                                
                              ),
                              const SizedBox(width: 10,),
                              RoundContainer(
                                top: bgColor6,
                               
                              ),
                              const SizedBox(width: 10,),
                              RoundContainer(
                                top: bgColor7,
                                
                              ),
                              const SizedBox(width: 10,),
                              RoundContainer(
                                top: bgColor8,
                               
                              ),
                              SizedBox(width: 10,),
                              RoundContainer(
                                top: bgColor9,
                               
                              ),
                                    
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              
            });
           }, icon: const Icon(Icons.palette_outlined, color: Colors.white,)),
           const SizedBox(width: 40,),
            const Text('Edited', style: TextStyle(
              color: Colors.white,
            ),),
            Text(getCurrentDate(), style: const TextStyle(
              color: Colors.white,
            ),),
            const SizedBox(width: 49,),
            IconButton(
              autofocus: false,
              onPressed: (){
                showModalBottomSheet(
                  backgroundColor: backgroundColors,
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
                            widget.onTap();
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
