import 'package:flutter/material.dart';

import 'package:praktikant/main.dart';


class VisionBoard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
   
      appBar: AppBar(
       
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Homepage()),
            );
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Big Five of LIFE",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.lightGreen,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                child: Text("Motorrad",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ))),
            Container(
                width: double.infinity,
                height: 300.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/d5.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
                child: Text("Eigentums Dachgeschosswohnung",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen,
                    ))),
            Container(
                width: double.infinity,
                height: 300.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/d1.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
                width: double.infinity,
                height: 300.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/d2.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
                width: double.infinity,
                height: 300.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/d3.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
                width: double.infinity,
                height: 200.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/d6.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
                width: double.infinity,
                height: 300.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/d7.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
                child: Text("Manara-App",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen,
                    ))),
            Container(
                width: double.infinity,
                height: 150.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/7.jpg'),
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
                child: Text("IN Japan Leben",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.lightGreen,
                    ))),
            Container(
                width: double.infinity,
                height: 100.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/7.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
                width: double.infinity,
                height: 300.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/8.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
                child: Text("Eigenes Unternehmen - SprachApp",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ))),
            Container(
                width: double.infinity,
                height: 150.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/9.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
                child: Text("China HSK-3 erreichen",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ))),
            Container(
                width: double.infinity,
                height: 300.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/10.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
                width: double.infinity,
                height: 220.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/hsk1.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
                width: double.infinity,
                height: 220.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/hsk2.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
                width: double.infinity,
                height: 220.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/hsk3.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
                width: double.infinity,
                height: 220.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/hsk4.png'),
                    fit: BoxFit.cover,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
