import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:praktikant/drawer.dart';
import 'package:praktikant/edit/add_screen.dart';
import 'package:praktikant/edit/database.dart';
import 'package:praktikant/edit/task.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:praktikant/voice/list.dart';
import 'package:praktikant/voice/view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  Directory appDirectory;
  Stream<FileSystemEntity> fileStream;
  List<String> records;
  int _currentIndex = 0;
  PageController _pageController;

  @override
  void dispose() {
    _pageController.dispose();
    fileStream = null;
    appDirectory = null;
    records = null;
    super.dispose();
  }

  Future<List<Task>> _taskList;
  final DateFormat _dateFormatter = DateFormat("dd. MMM yyyy");

  @override
  void initState() {
    super.initState();
    _updateTaskList();
    _pageController = PageController();
    records = [];
    getApplicationDocumentsDirectory().then((value) {
      appDirectory = value;
      appDirectory.list().listen((onData) {
        records.add(onData.path);
      }).onDone(() {
        records = records.reversed.toList();
        setState(() {});
      });
    });
  }

  _updateTaskList() {
    setState(() {
      _taskList = DatabaseHelper.instance.getTaskList();
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
                color: Colors.green,
                fontWeight: FontWeight.bold,
                decoration: task.status == 0
                    ? TextDecoration.none
                    : TextDecoration.lineThrough),
          ),
          trailing: Checkbox(
            onChanged: (value) {
              task.status = value ? 1 : 0;
              DatabaseHelper.instance.updateTask(task);
              _updateTaskList();
            },
            activeColor: Colors.green,
            value: task.status == 1 ? true : false,
          ),
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => AddTaskScreen(
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
        appBar: AppBar(title: Center(child: Text("Stephans Praktikant"))),
        drawer: Drawer(
          child: MainDrawer(),
        ),
        body: SizedBox.expand(
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() => _currentIndex = index);
            },
            children: <Widget>[
              Container(
                child: FutureBuilder(
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
                              padding: EdgeInsets.symmetric(
                                  horizontal: 40.0, vertical: 20.0),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  "$completedTaskCount of ${snapshot.data.length}",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
                                ),
                              ),
                            );
                          }

                          return _buildTask(snapshot.data[index - 1]);
                        },
                      );
                    }),
              ),
              Container(color: Colors.grey[900],
                child: Column(
                  children: [
                    Expanded(
                      flex: 2,
                      child: RecordListView(
                        records: records,
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: RecorderView(
                        onSaved: _onRecordComplete,
                      ),
                    ),
                  ],
                ),
               
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavyBar(
          selectedIndex: _currentIndex,
          onItemSelected: (index) {
            setState(() => _currentIndex = index);
            _pageController.jumpToPage(index);
          },
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
                title: Text(
                  '写',
                  style: TextStyle(fontSize: 25),
                ),
                icon: Icon(Icons.edit)),
            BottomNavyBarItem(
                title: Text(
                  '说',
                  style: TextStyle(fontSize: 25),
                ),
                icon: Icon(Icons.voice_chat)),
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => AddTaskScreen(
                                updateTaskList: _updateTaskList,
                              )))
                }));
  }

  _onRecordComplete() {
    records.clear();
    appDirectory.list().listen((onData) {
      records.add(onData.path);
    }).onDone(() {
      records.sort();
      records = records.reversed.toList();
      setState(() {});
    });
  }
}
