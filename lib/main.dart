import 'package:flutter/material.dart';
import 'package:flutter_application_1/Model/note_model.dart';
import 'package:flutter_application_1/Repositories/note_repository.dart';
import 'package:flutter_application_1/pages/new_note_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Notas'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Note> notas = NotasRepository.notas;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Center(
          child: Text(
            widget.title,
            style: const TextStyle(fontSize: 50),
            textAlign: TextAlign.center,
          ),
        ),
      ),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,
              height: 30,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Pesquise sua nota...',
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.settings))
          ],
        ),
        Expanded(
          child: GridView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 30),
            itemCount: notas.length,
            itemBuilder: (ctx, i) {
              return Card(
                child: Container(
                  height: 290,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  margin: const EdgeInsets.all(5),
                  padding: const EdgeInsets.all(5),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            notas[i].titulo,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                notas[i].data,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: Text(notas[i].corpo)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              // childAspectRatio: 1.0,
              mainAxisSpacing: 5,
              mainAxisExtent: 264,
            ),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // setState(() {
          //   notas.add(
          //     Note(
          //       titulo: 'Segunda nota',
          //       corpo: 'Se tudo deu cert deve ter algo aqui',
          //       data: 'Agora',
          //       cor: 'rosa',
          //     ),
          //   );
          // });
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NewNotePage(),
              )).then((value) {
            setState(() {});
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
