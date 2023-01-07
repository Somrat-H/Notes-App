import 'package:flutter/material.dart';

class NotesTile extends StatelessWidget {
  final String notesTitle;
  final String notesDescription;
  const NotesTile(
      {super.key, required this.notesTitle, required this.notesDescription});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(notesTitle, style: const TextStyle(
        fontSize: 22,
        color: Colors.white,
      ),),
      subtitle: Text(notesDescription,  style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),),
    );
       
  }
}
