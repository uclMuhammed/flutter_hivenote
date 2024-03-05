import 'package:core/model/note/note.dart';
import 'package:core/model/service/service.dart';
import 'package:flutter/material.dart';

class NoteEditScreen extends StatefulWidget {
  final int index;
  final Note? note;
  const NoteEditScreen({super.key, required this.index, this.note});

  @override
  State<NoteEditScreen> createState() => _NoteEditScreenState();
}

class _NoteEditScreenState extends State<NoteEditScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    title.text = widget.note!.title;
    description.text = widget.note!.description;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Note Edit Page'),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.all(constraints.maxWidth / 25),
                child: Column(
                  children: [
                    TextFormField(
                      controller: title,
                      keyboardType: TextInputType.name,
                      maxLength: 100,
                      decoration: textFormFieldDecoration('Title'),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Başlık Boş Brakılamaz';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: constraints.maxHeight / 25,
                    ),
                    TextFormField(
                      controller: description,
                      keyboardType: TextInputType.multiline,
                      maxLength: 2048,
                      minLines: null,
                      decoration: textFormFieldDecoration('Description'),
                    ),
                    SizedBox(
                      height: constraints.maxHeight / 50,
                    ),
                  ],
                ),
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                _updateNote();
              }
            },
            child: const Icon(Icons.edit),
          ),
        );
      },
    );
  }

  void _updateNote() async {
    // Yeni not verilerini oluşturun
    Note updatedNote = Note(
      title: title.text,
      description: description.text,
      checkBox: false,
      favorite: false,
      showDescription: false,
    );

    // Notu güncellemek için servisi kullanın
    NoteService noteService = NoteService();
    await noteService.updateNote(widget.index, updatedNote);

    // Geri git
    // ignore: use_build_context_synchronously
    Navigator.pop(context);
  }

  @override
  void dispose() {
    title.dispose();
    description.dispose();
    super.dispose();
  }

  InputDecoration textFormFieldDecoration(String label) {
    return InputDecoration(
      hintText: null,
      labelText: label,
      filled: true,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
    );
  }
}
