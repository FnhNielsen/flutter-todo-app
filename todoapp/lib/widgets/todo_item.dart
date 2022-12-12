import 'package:flutter/material.dart';

import '../model/task.dart';
import '../constants/colors.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final onTaskChanged;
  final onDeleteTask;

  const TaskItem({
    Key? key,
    required this.task,
    required this.onTaskChanged,
    required this.onDeleteTask,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          // print('Clicked on Todo Item.');
          onTaskChanged(task);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          task.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdGreen,
        ),
        title: Text(
          task.task!,
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: task.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              // print('Clicked on delete icon');
              onDeleteTask(task.id);
            },
          ),
        ),
      ),
    );
  }
}