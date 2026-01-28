import 'dart:ffi';

import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isDone = false;
  int tiles = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(118, 52, 52, 52),
      appBar: AppBar(backgroundColor: const Color.fromARGB(118, 52, 52, 52), 
      title: Text("TodoApp"),
      foregroundColor: Colors.white,),
      body: ListView.builder(
        itemCount: tiles,
        itemBuilder: (context, index) => 
          ListTile(
            leading: Checkbox(
              value: isDone,
              onChanged: (newValue) {
                setState(() {
                  isDone = !isDone;
                });
              },
            ),
            title: TextField(
              style: TextStyle(
                decoration: isDone
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                    color: Colors.white  
              ),
              decoration: InputDecoration(
                //border: OutlineInputBorder(),
                hintText: 'Enter text',
              ),
            ),
          ),
      ),
    );
  }
}
