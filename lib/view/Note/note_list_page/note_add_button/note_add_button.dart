import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hivenote/view/note/note_add_page/note_add_page.dart';

class NoteAddButton extends StatefulWidget {
  const NoteAddButton({
    super.key,
  });

  @override
  State<NoteAddButton> createState() => _NoteAddButtonState();
}

class _NoteAddButtonState extends State<NoteAddButton> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => NoteAddPage(),
          ),
        );
      },
    );
  }
}
