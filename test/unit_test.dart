import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:unit_test_flutter/controllers/list_controller.dart';
import 'package:unit_test_flutter/models/todo.dart';
import 'package:unit_test_flutter/services/database.dart';

class MockDatabase extends Mock implements Database {}

void main() {
  MockDatabase mockDatabase = MockDatabase();
  ListController listController = ListController();

  setUp(() {
    // This is run before each test
    listController = ListController(database: mockDatabase);
  });

  tearDown(() {
    // Clear the listController after each test
    listController.clear();
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
      expect(listController.todoList[0].done, false);
      listController.checkboxSelected(true, 0);
      expect(listController.todoList[0].done, true);
    });

    test('Mock Database call', () async {
      when(mockDatabase.loadDatabase).thenAnswer(
        (_) => Future.value(TodoModel("Test with Mock", true)),
      );
      await listController.loadFromDatabase();
      expect(listController.todoList[0].content, 'Test with Mock');
    });
  });
}
