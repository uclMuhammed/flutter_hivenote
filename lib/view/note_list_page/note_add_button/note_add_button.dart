import 'package:flutter/material.dart';
import 'package:flutter_hivenote/view/note_add_page/note_add_page.dart';

class NoteAddButton extends StatelessWidget {
  const NoteAddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: const Icon(Icons.add),
      onPressed: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const NoteAddPage(),
          ),
        );
      },
    );
  }
}
