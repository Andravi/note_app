import 'package:flutter/material.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NewNotePageState createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          'Adicionar nova Nota',
          style: TextStyle(fontSize: 35),
        ),
      ),
      body: const Column(
        children: [
          
        ],
      ),
    );
  }
}
