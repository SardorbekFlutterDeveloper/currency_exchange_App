import 'package:currency_exchange/core/constants/color_const.dart';
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white, size: 30),
          centerTitle: true,
          backgroundColor: AllColor.bottomnavbarcolor,
          elevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios)),
          title: const Text(
            "About my App",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 24),
          ),
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(left: 30),
            child:  const Text("Bu Dastur valyutalarni online narxalarini ko'rish va valyuta kankulyatori bor", style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 24),),
          ),
        ),
      );
}