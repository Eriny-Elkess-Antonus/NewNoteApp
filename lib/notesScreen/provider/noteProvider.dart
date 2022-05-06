// ignore_for_file: file_names

import 'package:flutter/foundation.dart';


import '../nodels/note.dart';
import '../repositories/note_repositry.dart';


class NoteProvider extends ChangeNotifier {
  NoteProvider({required this.note, required this.noteRepositry});
  final Note note;
  final NoteRepositry noteRepositry;
  }