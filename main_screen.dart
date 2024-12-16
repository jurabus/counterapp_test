import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> todoList = [];

  Widget todoListBuilder() {
    return ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todoList[index]),
          );
        });
  }

  //
  void addToList() {
    todoList.add(_textController.text);
    _textController.text = '';
    setState(() {});
  }

  TextEditingController _textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To-Do List App'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: _textController,
            decoration:
                InputDecoration(label: Text('Add your To-Do items here')),
          ),
          SizedBox(height: 10),
          ElevatedButton(onPressed: addToList, child: Text('Add Item')),
          SizedBox(height: 10),
          Expanded(child: todoListBuilder())
        ],
      ),
    );
  }
}
