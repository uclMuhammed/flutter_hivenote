import 'package:flutter/material.dart';
import 'package:flutter_hivenote/view/note/note_add_screen/note_add_screen.dart';

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
      backgroundColor: Theme.of(context).hintColor,
      onPressed: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NoteAddScreen(),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
