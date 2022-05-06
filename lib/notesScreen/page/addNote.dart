// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../nodels/note.dart';
import '../repositories/note_repositry.dart';
import '../widget/addNote_Item.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final addNote = context.read<NoteRepositry>();

    final DateTime dateNow = DateTime.now();

    var note = Note(id: "title 2", body: "body 2", date: dateNow);

    return Provider(
      create: (_) => NoteRepositry(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () => addNote.addNewNote(note),
          child: const Icon(
            Icons.add,
            color: Colors.white70,
          ),
        ),
        appBar: AppBar(
          title: const Text('Add Note'),
        ),
        body: Center(
          child: AddNoteItem(),
        ),
      ),
    );
  }
}
