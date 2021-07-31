import 'package:flutter/material.dart';
import 'package:praktikant/home.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark(

     
      ),
      home: Homepage(),
    );
  }
}


class Homepage extends StatefulWidget {
  const Homepage({ Key key }) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

    int _currentIndex = 0;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Stephans Praktikant"))),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(color: Colors.blueGrey,),
            Container(color: Colors.teal,),
       
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
            title: Text('Item One'),
            icon: Icon(Icons.home)
          ),
          BottomNavyBarItem(
            title: Text('Item Two'),
            icon: Icon(Icons.apps)
          ),
        
        ],
      ),
    );
  }
}