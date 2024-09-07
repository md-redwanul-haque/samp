import 'dart:math';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../db/db_provider.dart';
import '../model/task_model.dart';


class HomeController extends GetxController {
  var title = TextEditingController().obs;
  var description = TextEditingController().obs;
  RxInt id = 0.obs;
  RxString time = ''.obs;
  RxList<String> imagePaths = <String>[].obs;
  RxList<TodoModel> todoList = <TodoModel>[].obs;
  Random ids = Random();
  TimeOfDay selectedTimes = TimeOfDay.now();










  Future<void> pickImagesFromGallery() async {
    final pickedFiles = await ImagePicker().pickMultiImage();
    if (pickedFiles != null) {
      imagePaths.addAll(pickedFiles.map((file) => file.path).toList());
    }
  }

  Future<void> pickImageFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imagePaths.add(pickedFile.path);
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTimes,
    );
    if (picked != null && picked != selectedTimes) {
      selectedTimes = picked;
     time.value = picked.format(context);
    }
  }




  @override
  void onInit() {
    fetchTodos();
    super.onInit();
  }


  void fetchTodos() async {
    todoList.value = await DataBaseHelper.dbInstance.getTodos();
  }


  Future<void> addTodo() async {
    var todo = TodoModel(
      id: id.value == 0 ? null : id.value,
      title: title.value.text,
      description: description.value.text,
      time: time.value,
      imagePaths: imagePaths,
    );

    if (id.value == 0) {
      await DataBaseHelper.dbInstance.addTodos(todo);
    } else {
      await DataBaseHelper.dbInstance.updateTodo(todo);
    }

    clearInputs();
    fetchTodos();
  }


  void clearInputs() {
    title.value.clear();
    description.value.clear();
    time.value = '';
    imagePaths.clear();
    id.value = 0;
  }


  void setTodoForEditing(TodoModel todo) {
    title.value.text = todo.title ?? '';
    description.value.text = todo.description ?? '';
    time.value = todo.time ?? '';
    imagePaths.value = todo.imagePaths ?? [];
    id.value = todo.id!;
  }


  Future<void> deleteTodoById(int todoId) async {
    await DataBaseHelper.dbInstance.deleteTodo(todoId);
    fetchTodos();
  }
}
