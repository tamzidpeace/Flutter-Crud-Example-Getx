import 'package:flutter/material.dart';
import 'package:flutter_crud/app.controller.dart';
import 'package:get/get.dart';

class Todos extends StatelessWidget {
  Todos({Key? key}) : super(key: key);

  final AppController _appCtrl = Get.put<AppController>(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos'), centerTitle: true),
      body: Obx(
        () => ListView.builder(
          itemCount: _appCtrl.todos.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(_appCtrl.todos[index]),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    //* info:: putting todo value in the text field
                    _appCtrl.updateTE.text = _appCtrl.todos[index];

                    //* info:: update alert dialogue[from getx]
                    Get.defaultDialog(
                      title: 'Update Todo',
                      content: Column(
                        children: [
                          TextField(
                            controller: _appCtrl.updateTE,
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () {
                              //* info:: updating todo item
                              _appCtrl.updateTodo(index, _appCtrl.updateTE.text);
                            },
                            child: const Text('Update'),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                tileColor: Colors.grey,
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //* info:: add alert dialogue[from getx]
          Get.defaultDialog(
            title: 'Add New Todo',
            content: Column(
              children: [
                TextField(
                  controller: _appCtrl.addTE,
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    //* info:: adding todo item
                    _appCtrl.addTodo(_appCtrl.addTE.text);
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
