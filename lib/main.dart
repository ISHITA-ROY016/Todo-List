import 'package:flutter/material.dart';
import 'package:todolist/detailscreen.dart';

// Todo class
class Todo{
  final String title;
  final String description;
  const Todo(this.title, this.description);
}

void main(){
  runApp(
      MaterialApp(
        title: 'Passing Data',
        home: TodoScreen(
            todos : List.generate(
              20,
                  (i) => Todo(
                'Todo $i',
                'A description of what needs to be done for Todo $i',
              ),
            ),
        ),
      ),);
}
// List of todos

class TodoScreen extends StatelessWidget {
  const TodoScreen({Key? key, required this.todos}) : super(key: key);

  final List<Todo> todos;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(todos[index].title),
            onTap: (){
              Navigator.push(
                  context,
                MaterialPageRoute(
                    builder: (context)=> DetailScreen(),
              settings: RouteSettings(
                arguments: todos[index],
              ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
