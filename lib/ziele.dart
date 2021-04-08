import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:praktikant/home.dart';
import 'package:praktikant/task.dart';
import 'package:praktikant/zieledata.dart';
import 'package:praktikant/zielescrren.dart';



class Ziele extends StatefulWidget {
  Ziele({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _ZieleState createState() => _ZieleState();
}

class _ZieleState extends State<Ziele> {
  Future<List<Task>> _taskList;
  final DateFormat _dateFormatter = DateFormat("dd. MMM yyyy");
  @override
  void initState() {
    super.initState();
    _updateTaskList();
  }

  _updateTaskList() {
    setState(() {
      _taskList = DatabaseZiele.instance.getTaskList();
    });
  }

  Widget _buildTask(Task task) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(children: [
        ListTile(
          title: Text(
            task.title,
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                decoration: task.status == 0
                    ? TextDecoration.none
                    : TextDecoration.lineThrough),
          ),
          subtitle: Text(
            "${_dateFormatter.format(task.date)}   ${task.priority}",
            style: TextStyle(
                fontSize: 15.0,
                color: Colors.red,
                fontWeight: FontWeight.bold,
                decoration: task.status == 0
                    ? TextDecoration.none
                    : TextDecoration.lineThrough),
          ),
          trailing: Checkbox(
            onChanged: (value) {
              task.status = value ? 1 : 0;
              DatabaseZiele.instance.updateTask(task);
              _updateTaskList();
            },
            activeColor: Colors.red,
            value: task.status == 1 ? true : false,
          ),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => AddZiele(
                        updateTaskList: _updateTaskList,
                        task: task,
                      ))),
        ),
        Divider(),
      ]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Home()),
            );
          },
          child: Icon(
            Icons.arrow_back_ios, color: Colors.black, // add custom icons also
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
        onPressed: () => {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => AddZiele(
                        updateTaskList: _updateTaskList,
                      )))
        },
      ),
      body: FutureBuilder(
          future: _taskList,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }

            final int completedTaskCount = snapshot.data
                .where((Task task) => task.status == 1)
                .toList()
                .length;

            return ListView.builder(
              padding: EdgeInsets.symmetric(vertical: 80),
              itemCount: 1 + snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) {
                  return Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ziele",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "$completedTaskCount of ${snapshot.data.length}",
                          style: TextStyle(color: Colors.black, fontSize: 20),
                        ),
                      ],
                    ),
                  );
                }
                return _buildTask(snapshot.data[index - 1]);
              },
            );
          }),
    );
  }
}
