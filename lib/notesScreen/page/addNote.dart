// ignore_for_file: file_names, unnecessary_brace_in_string_interps, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../nodels/note.dart';
import '../repositories/note_repositry.dart';
import 'allNote.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  @override
  Widget build(BuildContext context) {
    final addNote = NoteRepositry();
    final dateNow = DateTime.now();
    var body;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            final note = Note(body: body, date: dateNow, id: '');

            addNote.addNewNote(note);
          });

          Navigator.of(context).pop(
            MaterialPageRoute(
              builder: (context) => const AllNotePage(),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white70,
        ),
      ),
      appBar: AppBar(
        title: const Text('Add Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${dateNow}',
              style: const TextStyle(fontSize: 20),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height * 0.60,
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  decoration: const InputDecoration.collapsed(
                    hintText: "Note Description",
                  ),
                  style: const TextStyle(
                    fontSize: 20.0,
                  ),
                  onChanged: (_val) {
                    body = _val;
                  },
                  maxLines: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
