import 'package:flutter/material.dart';

import '../model/task.dart';
import '../constants/colors.dart';
import '../widgets/todo_item.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoList = Task.todoList();
  List<Task> tasks = [];
  final _todoController = TextEditingController();

  @override
  void initState() {
    tasks = todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(
                          top: 50,
                          bottom: 20,
                        ),
                        child: const Text(
                          'My tasks',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      for (Task task in tasks.reversed)
                        ToDoItem(
                          todo: task,
                          onToDoChanged: _handleChangeTask,
                          onDeleteItem: removeTask,
                        ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    bottom: 20,
                    right: 20,
                    left: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _todoController,
                    decoration: const InputDecoration(
                        hintText: 'Add a new task',
                        border: InputBorder.none),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  bottom: 20,
                  right: 20,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    addTask(_todoController.text);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: tdGreen,
                    minimumSize: const Size(60, 60),
                    elevation: 10,
                  ),
                  child: const Text(
                    '+',
                    style: TextStyle(
                      fontSize: 40,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }

  void _handleChangeTask(Task task) {
    setState(() {
      task.isDone = !task.isDone;
    });
  }

  void removeTask(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void addTask(String task) {
    setState(() {
      todoList.add(Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        task: task,
      ));
    });
    _todoController.clear();
  }

  void _runFilter(String enteredKeyword) {
    List<Task> results = [];
    if (enteredKeyword.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((item) => item.task!
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      tasks = results;
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        SizedBox(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
      ]),
    );
  }
}