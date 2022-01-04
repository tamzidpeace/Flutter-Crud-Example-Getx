import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppController extends GetxController {
  final TextEditingController addTE = TextEditingController();
  final TextEditingController updateTE = TextEditingController();

  final RxList<String> todos = RxList<String>(
    [
      'todo 1',
      'todo 2',
      'todo 3',
      'todo 4',
      'todo 5',
    ],
  );

  void addTodo(todo) {
    //* info:: data type string, so converting to string first
    todos.add(todo.toString());
    Get.back();
  }

  void updateTodo(index, value) {
    todos[index] = value.toString();
    Get.back();
  }
}
