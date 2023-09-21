import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/note_model.dart';
import 'package:flutter_application_1/Repositories/note_repository.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NewNotePageState createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  late String titulo;
  late String corpo;
  String data = 'Data e Hora de Agora';

  TextEditingController tituloController = TextEditingController();
  TextEditingController corpoController = TextEditingController();

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
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: tituloController,
              decoration: const InputDecoration(
                hintText: 'Adicionar Titulo...',
              ),
            ),
            Text(
              data,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: TextField(
                  controller: corpoController,
                  maxLines: null,
                  textCapitalization: TextCapitalization.sentences,
                  decoration: null,
                  style: const TextStyle(
                    fontSize: 19,
                    height: 1.5,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            NotasRepository.notas.add(Note(titulo: tituloController.text, corpo: corpoController.text, data: data, cor: 'azul'));
            Navigator.pop(context);
            setState(() {
              
            });
          });
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
