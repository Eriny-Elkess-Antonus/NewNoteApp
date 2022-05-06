// ignore_for_file: file_names, unnecessary_brace_in_string_interps, unused_local_variable

import 'package:flutter/material.dart';

import '../nodels/note.dart';

class AddNoteItem extends StatelessWidget {
  const AddNoteItem({
    Key? key,
  }) : super(key: key);
//  final Note note;

  @override
  Widget build(BuildContext context) {
    final DateTime dateNow = DateTime.now();
    String body;

    return Padding(
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
    );
  }
}
