// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:keep_notes/components/colors.dart';
import 'package:keep_notes/components/list_tile.dart';
import 'package:keep_notes/components/notes_create.dart';
import 'package:keep_notes/components/top_bar.dart';
import 'package:keep_notes/model/data_model.dart';
import 'package:keep_notes/screen/notes_details.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ModelData> notes = [];

  TextEditingController titileControler = TextEditingController();
  TextEditingController descriptionControler = TextEditingController();

  TextEditingController titileControlerEdit = TextEditingController();
  TextEditingController descriptionControlerEdit = TextEditingController();
  SharedPreferences? sp;

  bool status = false;

  @override
  void initState() {
   
    initSharedPreferences();
    super.initState();
  }
  @override
  void dispose() {
    titileControler.dispose();
    descriptionControler.dispose();
    super.dispose();
  }
  initSharedPreferences() async {
    sp = await SharedPreferences.getInstance();
    loadingNotes();
  }

  saveNotes() {
    setState(() {
      notes.add(ModelData(
          title: titileControler.text.toString(),
          description: descriptionControler.text.toString()));
          saveAllnotes();
    });
  }

  saveAllnotes(){
    List<String> spList = notes.map((notes) => jsonEncode(notes.toMap())).toList();
    sp!.setStringList('notes', spList);
   
  }
  
  loadingNotes(){
   
    setState(() {
       List<String> ? spList = sp!.getStringList('notes');
    notes = spList!.map((modelData) => ModelData.fromMap(jsonDecode(modelData))).toList();
    });
  }

  editNotes(int index, List<ModelData> notes) {
      titileControlerEdit.text = notes[index].title;
      descriptionControlerEdit.text = notes[index].description;
  }

  saveEditNotes(int index){ 
    
    setState(() {
    notes[index].title = titileControlerEdit.text.toString();
    notes[index].description = descriptionControlerEdit.text.toString();
     saveAllnotes();
    });
  }

  void deleteNotes(int index){
    setState(() {
      notes.removeAt(index);
    });
   
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => NotesCreate(
                    // onTap: (){},
                      titileControler: titileControler,
                      descriptionControler: descriptionControler,
                      onPressed: () {
                        if(titileControler.text != "" || descriptionControler.text != ""){
                        setState(() {
                         saveNotes();
                        });
                        descriptionControler.clear();
                        titileControler.clear();
                        }
                      })));
        },
        backgroundColor: const Color.fromARGB(255, 61, 57, 57),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0))),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column( 
        children: [
           TopBar(onPressed: () { 

            setState(() {
              status = !status;
            });

            }, status: status,

          ),
          Expanded(
           child: 
           status  == false?
            ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                shrinkWrap: true,
                itemCount: notes.length,
                itemBuilder: (context, index) {
                  return NotesTile(
                    notesDescription: notes[index].description,
                    
                    notesTitle: notes[index].title, 
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context)=> NotesDetails(
                          
                          titileControler: titileControlerEdit, 
                          descriptionControler: descriptionControlerEdit,
                          onTap: (){
                            setState(() {
                               notes.removeAt(index);
                            });
                           saveAllnotes();
                                                      },
                          onPressed: (){
                           saveEditNotes(index);
                          },
                          )));
                       editNotes(index, notes);   
                    }
                   );
                })
                : 
                 GridView.builder(
      itemCount: notes.length,
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20), 
      itemBuilder: (context, index){
        return  Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white.withOpacity(0.4)),
                    borderRadius: BorderRadius.circular(7)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notes[index].title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      notes[index].description,
                      style: const TextStyle(color: Colors.white, fontSize: 12),
                    )
                  ],
                ),
              );
        
      })
          ),
        ],
      ),
    );
  }
}
