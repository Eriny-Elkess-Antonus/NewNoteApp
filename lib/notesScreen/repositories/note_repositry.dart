import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:noteapp/notesScreen/nodels/note.dart';

class NoteRepositry {
  static final _db = FirebaseFirestore.instance;
  final collection = _db.collection('Note');

  Future<List<Note>> getAll() async {
    final snapshot = await collection.orderBy('date', descending: true).get();
    // ignore: sdk_version_constructor_tearoffs
    return snapshot.docs.map(Note.fromDoc).toList();
  }

  // Future<Note> addNewNote({required Note note}) async {
  //   final add = Note(id: note.id, body: note.body, date: note.dateNow);
  //   collection;
  //   return add;
  // }
  Future<DocumentReference> addNewNote(Note note) {
    return collection.add(note.toJson());
  }

  void updatenote(Note note) async {
    await collection.doc(note.id).update(note.toJson());
  }

  void deletenote(Note note) async {
    await collection.doc(note.id).delete();
  }
}
