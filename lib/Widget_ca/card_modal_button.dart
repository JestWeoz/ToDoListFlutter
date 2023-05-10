import 'package:flutter/material.dart';

class modalButton extends StatelessWidget {
  modalButton({
    super.key,
    required this.addTask,
  });
  final Function addTask;
  TextEditingController controller = TextEditingController();
  void _handleOnClick(BuildContext context) {
    final name = controller.text;
    if (name.isNotEmpty) {
      addTask(name);
    } else {
      return;
    }
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(children: [
          TextField(
            controller: controller,
            textAlign: TextAlign.left,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Your task!'),
          ),
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: ElevatedButton(
              onPressed: () => _handleOnClick(context),
              child: const Text("Add Task"),
            ),
          ),
        ]),
      ),
    );
  }
}
