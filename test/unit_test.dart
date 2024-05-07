import 'package:flutter_test/flutter_test.dart';
import 'package:unit_test_flutter/controllers/list_controller.dart';
import 'package:unit_test_flutter/models/todo.dart';

void main() {
  ListController listController = ListController();
  setUp(() {
    // This is run before each test
  });

  tearDown(() {
    listController.clear();
    // Clear the listController after each test
  });

  group('TODO Controller', () {
    test('Initializes with empty', () {
      expect(listController.todoList.length, 0);
    });

    test('TODO Added', () {
      listController.addTodo(TodoModel("Unit Test", false));
      expect(listController.todoList.length, 1);
      expect(listController.todoList[0].content, "Unit Test");
    });

    test('CheckBox Selected', () {
      listController.addTodo(TodoModel("Unit Test", false));
      listController.checkboxSelected(true, 0);
      expect(listController.todoList.length, 1);
      expect(listController.todoList[0].done, true);
    });
  });
}
