import 'package:camera/camera.dart';
import 'package:core/model/note/note.dart';
import 'package:core/model/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hivenote/view/photo/camera/take_picture_screen/take_picture_screen.dart';

class NoteAddScreen extends StatefulWidget {
  const NoteAddScreen({super.key});

  @override
  State<NoteAddScreen> createState() => _NoteAddScreenState();
}

class _NoteAddScreenState extends State<NoteAddScreen> {
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
            actions: [
              IconButton(
                  onPressed: () async {
                    final cameras = await availableCameras();
                    final firstCamera = cameras.first;
                    Navigator.push(
                      // ignore: use_build_context_synchronously
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            TakePictureScreen(camera: firstCamera),
                      ),
                    );
                  },
                  icon: const Icon(Icons.camera_alt))
            ],
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
                var note = Note(
                  title: title.text,
                  description: description.text,
                  checkBox: false,
                  favorite: false,
                  showDescription: false,
                );
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
