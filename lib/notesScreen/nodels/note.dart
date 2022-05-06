import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../converters/timeStamp_converter.dart';

part 'note.g.dart';

@JsonSerializable()
@TimestampConverter()
class Note {
  Note({
    required this.id,
    required this.body,
    required this.date,
  });
  final String id;
  String body;
  final DateTime date;
  final DateTime dateNow = DateTime.now();

  factory Note.fromDoc(DocumentSnapshot<Map<String, dynamic>> doc) {
    return Note.fromJson({'id': doc.id, ...doc.data()!});
  }

  factory Note.fromJson(Map<String, dynamic> json) {
    return _$NoteFromJson(json);
  }
  Map<String, dynamic> toJson() {
    return _$NoteToJson(this);
  }
}
