import 'package:flutter/material.dart';
import 'package:flutter_hivenote/note/item/note_item.dart';
import 'package:flutter_hivenote/note/service/note_service.dart';

class NoteAddPage extends StatefulWidget {
  const NoteAddPage({super.key});

  @override
  State<NoteAddPage> createState() => _NoteAddPageState();
}

class _NoteAddPageState extends State<NoteAddPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController title = TextEditingController();
  TextEditingController description = TextEditingController();
  final NoteService service = NoteService();
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, BoxConstraints constraints) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Note Add Page'),
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
                var note =
                    NoteItem(title.text, description.text);
                service.addNote(note);
                title.clear();
                description.clear();
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        );
      },
    );
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
