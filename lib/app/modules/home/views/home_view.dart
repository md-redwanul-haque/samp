import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/Utils/memory_management/memory_management.dart';
import '../../../data/Utils/memory_management/shared_pref_keys.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);
  RxBool edit = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My TODO'),centerTitle: true,),
      body: SingleChildScrollView(
        physics: ScrollPhysics(),
        child: Container(
          height: Get.height *0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: controller.title.value,
                  decoration: InputDecoration(hintText: 'Title'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: controller.description.value,
                  decoration: InputDecoration(hintText: 'Description'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => controller.selectTime(context),
                      child: Text("Select Time"),
                    ),
                    SizedBox(width: 10),
                    Obx(() => Text(controller.time.value)),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Text("Choose Image:"),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton(
                      onPressed: controller.pickImagesFromGallery,
                      child: Text('Gallery'),
                    ),
                    ElevatedButton(
                      onPressed: controller.pickImageFromCamera,
                      child: Text('Camera'),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 100,
                child: Obx(() => ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: controller.imagePaths.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Image.file(
                        File(controller.imagePaths[index]),
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                    );
                  },
                )),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [

                  ElevatedButton(
                    onPressed: () {
                      controller.addTodo();
                      if(edit.value ==true){
                        edit.value = false;

                      }
                      else{
                        edit.value = true;
                      }

                      },
                    child: Obx(()=>edit.value== false ? Text('Add'):Text("Update")),
                  ),
                ],
              ),
              Expanded(
                child: Obx(() => ListView.builder(
                  itemCount: controller.todoList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var todo = controller.todoList[index];
                    return ListTile(
                      leading: IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          controller.setTodoForEditing(todo);
                          if(edit.value==false){
                            edit.value= true;
                          }else{
                            edit.value = false;
                          }
                        },
                      ),
                      title: Text(todo.title ?? ''),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(todo.description ?? ''),
                          Text("Time: ${todo.time ?? ''}"),
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
                        onPressed: () => controller.deleteTodoById(todo.id!),
                        icon: Icon(Icons.delete),
                      ),
                    );
                  },
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
