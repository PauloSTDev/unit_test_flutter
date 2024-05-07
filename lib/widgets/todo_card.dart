import 'package:flutter/material.dart';
import 'package:unit_test_flutter/controllers/list_controller.dart';

class TodoCard extends StatefulWidget {
  final int index;
  final ListController listController;

  const TodoCard({super.key, required this.index, required this.listController});

  @override
  TodoCardState createState() => TodoCardState();
}

class TodoCardState extends State<TodoCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Expanded(
              child: Text(
                widget.listController.todoList[widget.index].content,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Checkbox(
              value: widget.listController.todoList[widget.index].done,
              onChanged: (newValue) {
                widget.listController.checkboxSelected(newValue ?? false, widget.index);
                setState(() {});
                //Database().updateTodo(newValue, uid, todo.todoId);
              },
            ),
          ],
        ),
      ),
    );
  }
}
