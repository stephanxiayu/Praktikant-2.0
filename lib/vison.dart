import 'package:flutter/material.dart';
import 'package:praktikant/home.dart';


class VisionBoard extends StatelessWidget {
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
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Padding(
          padding: EdgeInsets.all(10.0),
          child: Text(
            "Vision Board",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.black,
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
                      color: Colors.black,
                    ))),
            Container(
                width: double.infinity,
                height: 300.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/1.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
                child: Text("Wohnung",
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
                    image: ExactAssetImage('lib/assets/2.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
                width: double.infinity,
                height: 300.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/3.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
                width: double.infinity,
                height: 300.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/4.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
                width: double.infinity,
                height: 200.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/hsk5.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            Container(
                width: double.infinity,
                height: 300.00,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: ExactAssetImage('lib/assets/5.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
                child: Text("Manara-App",
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
                    image: ExactAssetImage('lib/assets/6.png'),
                    fit: BoxFit.cover,
                  ),
                )),
            SizedBox(
                child: Text("Passives Einkommen",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
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
                child: Text("10.000 EUR im Monat",
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
                child: Text("China HSK-5 erreichen",
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
