import 'package:unit_test_flutter/models/todo.dart';

class Database {
  Future<TodoModel> loadDatabase() async {
    try {
      Future.delayed(const Duration(seconds: 3));
      // print("this got called?!?");
      return TodoModel("From Database", true);
    } catch (e) {
      // print(e);
      rethrow;
    }
  }
}
