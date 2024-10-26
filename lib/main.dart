import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Markdown Notizen App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NoteScreen(),
    );
  }
}

class NoteScreen extends StatefulWidget {
  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final TextEditingController _controller = TextEditingController();
  bool _isLoading = false;

  Future<void> _saveNote() async {
    setState(() {
      _isLoading = true;
    });

    final String apiUrl = 'http://127.0.0.1:8080/nodes';

    // Erstelle ein Map-Objekt mit den Daten
    final Map<String, dynamic> noteData = {
      "content": _controller.text,
      "title": "test1234"
    };

    // Konvertiere das Map-Objekt in eine JSON-Zeichenkette
    final String jsonBody = jsonEncode(noteData);

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonBody,
    );

    setState(() {
      _isLoading = false;
    });

    // Ausgabe von Statuscode und Response-Body zur Fehlersuche
    if (response.statusCode == 201) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Notiz gespeichert!')),
      );
    } else {
      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Fehler beim Speichern der Notiz')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Markdown Notizen'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _isLoading ? null : _saveNote,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: TextField(
                controller: _controller,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Schreibe deine Notiz hier...',
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 16),
            Expanded(
              child: Markdown(
                data: _controller.text,
                selectable: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
