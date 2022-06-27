import 'package:currency_exchange/core/constants/color_const.dart';
import 'package:currency_exchange/views/builder.dart';
import 'package:currency_exchange/views/dollar_kursi.dart';
import 'package:currency_exchange/widgets/sizec_config.dart';
import 'package:flutter/material.dart';

class BottomPage extends StatefulWidget {
  const BottomPage({Key? key}) : super(key: key);

  @override
  State<BottomPage> createState() => _ContractsPaageState();
}

class _ContractsPaageState extends State<BottomPage> {
  int selectedIndex = 0;
  static final List _pages = [
    const Builderim(),
    const DollarCursim(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: AllColor.bottomnavbarcolor,
      body: Center(
        child:  _pages.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            backgroundColor: AllColor.bottomnavbarcolor,
            icon: Container(
              margin: EdgeInsets.only(bottom: 10, left: 5),
              width: getWidth(18),
              height: getHeight(20),
              child: const Icon(Icons.currency_exchange),
            ),
            label: "Change",
          ),
          BottomNavigationBarItem(
            backgroundColor: AllColor.bottomnavbarcolor,
            icon: Container(
              margin: EdgeInsets.only(bottom: 10, left: 5),
              width: getWidth(18),
              height: getHeight(20),
              child: const Icon(Icons.table_rows_sharp),
            ),
            label: "Table List",
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        selectedLabelStyle: const TextStyle(color: Colors.white),
        unselectedItemColor: Colors.grey,
        onTap: _onItemTapped,
      ),
    );
  }
}
