import 'package:flutter/material.dart';
import '../models/note_model.dart';

class CreateNewNote extends StatefulWidget {
  const CreateNewNote({Key? key}) : super(key: key);

  @override
  State<CreateNewNote> createState() => _CreateNewNoteState();
}

class _CreateNewNoteState extends State<CreateNewNote> {
  final _titleController = TextEditingController();
  final _descritionController = TextEditingController();

  void goBackToSavenote(Note createdNote) {
    Navigator.pop(context, createdNote);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 27, 27, 36),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () => goBackToSavenote(Note(
                id: DateTime.now().millisecondsSinceEpoch.toString(),
                noteText: _titleController.text.trim(),
                noteDescription: _descritionController.text.trim(),
              )),
              icon: const Icon(
                Icons.save,
                size: 35,
              ),
            ),
          ),
        ],
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        backgroundColor: const Color.fromARGB(255, 27, 27, 36),
        titleSpacing: 50,
        elevation: 0,
        title: Text(
          DateTime.now().toString(),
          style: const TextStyle(fontSize: 22),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: ListView(
            children: [
              TextField(
                maxLines: 1,
                style: const TextStyle(color: Colors.white, fontSize: 24),
                controller: _titleController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Title',
                  hintStyle: TextStyle(
                    color: Color(0xFFA8A6A6),
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 13),
              TextField(
                style: const TextStyle(color: Colors.white),
                controller: _descritionController,
                decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Descrition',
                    hintStyle: TextStyle(
                      color: Color(0xFFA8A6A6),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    fillColor: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
