import 'dart:io';

import 'package:currency_exchange/core/constants/color_const.dart';
import 'package:currency_exchange/data/data_flag.dart';
import 'package:currency_exchange/models/currency_model.dart';
import 'package:currency_exchange/services/service_currency.dart';
import 'package:currency_exchange/views/about.dart';
import 'package:currency_exchange/views/builder.dart';
import 'package:currency_exchange/views/currencyies.dart';
import 'package:currency_exchange/views/responce.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class DollarCursim extends StatefulWidget {
  const DollarCursim({Key? key}) : super(key: key);

  @override
  _DollarCursimState createState() => _DollarCursimState();
}

class _DollarCursimState extends State<DollarCursim>
    with TickerProviderStateMixin {
  TabController? _tabController;
  List listuser = [];

  @override
  void initState() {
    super.initState();
    CurrencyService.getCurrency().then((value) {
      listuser = value;
      _tabController = TabController(length: 3, vsync: this);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AllColor.bottomnavbarcolor,
      resizeToAvoidBottomInset: true,
      appBar: appBar(),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Aed(),
                      request(context),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const ResData(),
                        InkWell(
                          onTap: () {
                            setState(() {});
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.24,
                            height: MediaQuery.of(context).size.height * 0.048,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(width: 1, color: Colors.black)
                            ),
                            child: const Center(
                              child: Text(
                                "Calculate",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container request(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.048,
      width: MediaQuery.of(context).size.width * 0.52,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: const BorderRadius.all(
          Radius.circular(8),
        ),
        border: Border.all(width: 1, color: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FutureBuilder(
              future: CurrencyService.getCurrency(),
              builder: (context, AsyncSnapshot<List<CurrencyModel>> snap) {
                if (!snap.hasData) {
                  return const CupertinoActivityIndicator();
                } else if (snap.hasError) {
                  return const Center(
                    child: Text('Xato bor'),
                  );
                } else {
                  double b = double.parse(snap.data![Data.intqil].cbPrice!);
                  double c = double.parse(Data.control.text);
                  return Center(
                    child: Text(
                      Data.control.text.isEmpty
                          ? "${c = 0}"
                          : (c * b).toStringAsFixed(2).toString(),
                      style: const TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 18),
                    ),
                  );
                }
              },
            ),
            const Text(
              'UZS',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      centerTitle: true,
      backgroundColor: AllColor.appBarColor,
      title: const Text("Currensy Converter"),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const About(),
                ),
              );
            },
            icon: const Icon(Icons.help_sharp, color: Colors.white, size: 30),
          ),
        ),
      ],
    );
  }
}
