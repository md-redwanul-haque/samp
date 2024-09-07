import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';
import '../db/db_provider.dart';
import '../model/task_model.dart';


class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LocaldatabaseView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          height: 800,
          child: Column(
            children: [
              SizedBox(height: 30),

              // Title Input
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: controller.title.value,
                  decoration: InputDecoration(hintText: 'Title'),
                ),
              ),

              // Description Input
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: controller.description.value,
                  decoration: InputDecoration(hintText: 'Description'),
                ),
              ),

              // Date Picker
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => controller.selectDate(context),
                      child: Text("Select Date"),
                    ),
                    SizedBox(width: 10),
                    Obx(()=>Text("${controller.selectedDate.value.toLocal()}".split(' ')[0]))
                  ],
                ),
              ),

              // Image Picker Buttons
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,

                    children: [
                      ElevatedButton(
                        onPressed: controller.pickImagesFromGallery,
                        child: Text('Gallery'),
                      ),
                      ElevatedButton(
                        onPressed: controller.pickImageFromCamera,
                        child: Text(' Camera'),
                      ),
                    ],
                  ),
                ),
              ),

              // Display selected images
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.imagePathsS.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.file(
                        File(controller.imagePathsS[index]),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      var todo = TodoModel(
                        id: controller.id_data.nextInt(100000),
                        title: controller.title.value.text,
                        description: controller.description.value.text,
                        date: controller.selectedDate.value.toIso8601String(),
                        imagePaths: controller.imagePathsS,
                      );

                      await DataBaseHelper.dbInstance.addTodos(todo);
                      controller.todoList.value = await DataBaseHelper.dbInstance.getTodos();

                      controller.title.value.clear();
                      controller.description.value.clear();
                      controller.imagePathsS.clear();
                    },
                    child: Text('Add'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      var todo = TodoModel(
                        id: controller.id.value,
                        title: controller.title.value.text,
                        description: controller.description.value.text,
                        date: controller.selectedDate.value.toIso8601String(),
                        imagePaths: controller.imagePathsS,
                      );

                      await DataBaseHelper.dbInstance.updateTodo(todo);
                      controller.todoList.value = await DataBaseHelper.dbInstance.getTodos();

                      controller.title.value.clear();
                      controller.description.value.clear();
                      controller.imagePathsS.clear();
                    },
                    child: Text("Update"),
                  ),
                ],
              ),

              Expanded(
                child: Obx(() => controller.count.value==0?ListView.builder(
                  itemCount: controller.todoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var todo = controller.todoList[index];
                    return  ListTile(
                      leading: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          controller.title.value.text = todo.title ?? '';
                          controller.description.value.text = todo.description ?? '';
                          controller.id.value = todo.id!;
                          controller.imagePathsS = todo.imagePaths ?? [];
                        },
                      ),
                      title: Text(todo.title ?? ''),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(controller.count.value.toString()),
                          Text(todo.description ?? ''),
                          Text(todo.date ?? ''),
                          // Display saved images for each todo
                          SizedBox(
                            height: 50,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: todo.imagePaths?.length ?? 0,
                              itemBuilder: (context, imgIndex) {
                                return Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Image.file(
                                    File(todo.imagePaths![imgIndex]),
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        onPressed: () async {
                          await DataBaseHelper.dbInstance.deleteTodo(todo.id!);
                          controller.todoList.removeAt(index);
                        },
                        icon: Icon(Icons.delete),
                      ),
                    );
                  },
                ):Container()),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
