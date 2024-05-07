import 'package:flutter/material.dart';
import 'package:unit_test_flutter/controllers/list_controller.dart';
import 'package:unit_test_flutter/models/todo.dart';
import 'package:unit_test_flutter/services/database.dart';
import 'package:unit_test_flutter/widgets/todo_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  final TextEditingController _todoController = TextEditingController();
  ListController listController = ListController(database: Database());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List App"),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Add Todo Here:",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Card(
            margin: const EdgeInsets.all(20),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      key: const Key("addField"),
                      controller: _todoController,
                    ),
                  ),
                  IconButton(
                    key: const Key("addButton"),
                    icon: const Icon(Icons.add),
                    onPressed: () {
                      if (_todoController.text != "") {
                        listController.addTodo(TodoModel(_todoController.text, false));
                        //Database()
                        //.addTodo(_todoController.text, controller.user.uid);
                        _todoController.clear();
                        setState(() {});
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: const Text("Load Todo from Database"),
            onPressed: () {
              listController.loadFromDatabase();
              setState(() {});
            },
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "Your Todos",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: listController.todoList.length,
              itemBuilder: (_, index) {
                return TodoCard(index: index, listController: listController);
              },
            ),
          )
        ],
      ),
    );
  }
}
