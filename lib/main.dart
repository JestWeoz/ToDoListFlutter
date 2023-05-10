import 'package:flutter/material.dart';
import 'package:untitled_test/Modal/item.dart';
import 'package:untitled_test/Widget_ca/card_modal_button.dart';

import 'Widget_ca/card_body.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItems> items = [];

  void _handleAddTask(String name) {
    final newItems = DataItems(id: DateTime.now().toString(), name: name);
    setState(() {
      items.add(newItems);
    });
  }

  void _handleDeleteTask(String id) {
    setState(() {
      items.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "ToDoList!",
          style: TextStyle(
            fontSize: 30,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 31, vertical: 31),
        child: Column(
            children: items
                .map((item) => Card_body(
                      index: items.indexOf(item),
                      item: item,
                      handelDelete: _handleDeleteTask,
                    ))
                .toList()),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.amber,
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.white,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              isScrollControlled: true,
              context: context,
              builder: (BuildContext content) {
                return modalButton(addTask: _handleAddTask);
              });
        },
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
