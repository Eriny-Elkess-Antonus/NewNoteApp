// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:noteapp/converters/route_mixin.dart';

import '../repositories/note_repositry.dart';
import '../widget/allNoteList.dart';
import 'addNote.dart';

class AllNotePage extends StatelessWidget with RouteMixin {
  const AllNotePage({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => NoteRepositry(),
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(
            Icons.add,
            color: Colors.white70,
          ),
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => AddNotePage(),
              ),
            );
          },
        ),
        appBar: AppBar(
          title: const Text('Notes'),
        ),
        body: const Center(
          child: AllNoteList(),
        ),
      ),
    );
  }
}
