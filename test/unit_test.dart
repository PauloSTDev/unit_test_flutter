import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_flutter/controllers/list_controller.dart';
import 'package:unit_test_flutter/models/todo.dart';

void main() {
  group('TODO Controller', () {
    test('Initializes with empty', () {
      ListController listController = ListController();
      expect(listController.todoList.length, 0);
    });

    test('TODO Added', () {
      ListController listController = ListController();
      listController.addTodo(TodoModel("Unit Test", false));
      expect(listController.todoList.length, 1);
      expect(listController.todoList[0].content, "Unit Test");
    });
  });
}
