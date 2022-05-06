// ignore_for_file: file_names

import 'package:async_builder/async_builder.dart';
import 'package:flutter/material.dart';
import 'package:noteapp/notesScreen/nodels/note.dart';
import 'package:provider/provider.dart';

import '../../widgets/empty_list_wrapper.dart';
import '../../widgets/error_wrapper.dart';
import '../repositories/note_repositry.dart';
import 'allNoteList_Item.dart';

class AllNoteList extends StatelessWidget {
  const AllNoteList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final repository = context.read<NoteRepositry>();
    return AsyncBuilder<List<Note>>(
        future: repository.getAll(),
        waiting: (_) => const CircularProgressIndicator(),
        error: (_, err, stack) => ErrorWrapper(err, stack),
        builder: (_, data) {
          final notes = data ?? [];
          return notes.isEmpty
              ? const EmptyListWrapper()
              : ListView.separated(
                  padding: const EdgeInsets.all(12),
                  separatorBuilder: (_, __) =>
                      const SizedBox.square(dimension: 12),
                  itemCount: notes.length,
                  itemBuilder: (_, index) {
                    return AllNoteItem(
                      note: notes[index],
                    );
                  },
                );
        });
  }
}
