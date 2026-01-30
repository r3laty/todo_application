import 'package:flutter/material.dart';
import 'package:todo_application/utils/todoapp.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    tasks.add(Task(title: ''));
  }

  void _addNewTask() {
    setState(() {
      tasks.add(Task(title: ''));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(118, 52, 52, 52),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(118, 52, 52, 52),
        title: Text("TodoApp"),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) => ListTile(
                leading: Checkbox(
                  value: tasks[index].isDone,
                  onChanged: (val) {
                    setState(() {
                      tasks[index].isDone = val ?? false;
                    });
                  },
                ),
                title: TextField(
                  onChanged: (newText) {
                    tasks[index].title = newText;
                  },
                  style: TextStyle(
                    decoration: tasks[index].isDone
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationThickness: 5.0,
                    color: Colors.white,
                  ),
                  decoration: const InputDecoration(
                    hintText: 'Enter text',
                    border: InputBorder.none, // Делаем UI чище
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: _addNewTask,
              child: const Icon(Icons.add),
            ),
          ),
        ],
      ),
    );
  }
}
