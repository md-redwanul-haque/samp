import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../db/db_provider.dart';
import '../model/task_model.dart';


class HomeController extends GetxController {
  var title = TextEditingController().obs;
  var description = TextEditingController().obs;
  RxInt id = 0.obs;
  RxString date = ''.obs; // Store the selected date as a string
  RxList<String> imagePaths = <String>[].obs; // List to store image paths
  final count = 0.obs;
  RxList<TodoModel> todoList = <TodoModel>[].obs; // Updated to match TodoModel

  // Load all todos from the database
  void checks() async {
    todoList.value = await DataBaseHelper.dbInstance.getTodos();
  }

  @override
  void onInit() {
    checks(); // Load todos when the controller is initialized
    super.onInit();
  }

  @override
  void onClose() {
    title.value.dispose();
    description.value.dispose();
    super.onClose();
  }

  // Add a new todo
  Future<void> addTodo() async {
    var todo = TodoModel(
      id: id.value == 0 ? null : id.value, // If ID is 0, let the DB auto-generate
      title: title.value.text,
      description: description.value.text,
      date: date.value,
      imagePaths: imagePaths,
    );

    if (id.value == 0) {
      // Insert new todo
      await DataBaseHelper.dbInstance.addTodos(todo);
    } else {
      // Update existing todo
      await DataBaseHelper.dbInstance.updateTodo(todo);
    }

    // Clear the input fields and refresh the todo list
    clearInputs();
    checks();
  }

  // Clear the input fields and reset the state
  void clearInputs() {
    title.value.clear();
    description.value.clear();
    date.value = '';
    imagePaths.clear();
    id.value = 0; // Reset ID for adding new todos
  }

  // Delete a todo by ID
  Future<void> deleteTodoById(int todoId) async {
    await DataBaseHelper.dbInstance.deleteTodo(todoId);
    checks(); // Refresh the list after deletion
  }

  // Set the todo data when editing
  void setTodoForEditing(TodoModel todo) {
    title.value.text = todo.title ?? '';
    description.value.text = todo.description ?? '';
    date.value = todo.date ?? '';
    imagePaths.value = todo.imagePaths ?? [];
    id.value = todo.id!;
  }

  // Increment method, not used but can be for other purposes
  void increment() => count.value++;
}
