import 'package:currency_exchange/data/data_flag.dart';

import 'package:flutter/material.dart';

class ResData extends StatefulWidget {
  const ResData({Key? key}) : super(key: key);

  @override
  State<ResData> createState() => _ResDataState();
}

class _ResDataState extends State<ResData> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.height * 0.048,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(width: 1, color: Colors.blueGrey.shade400),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          keyboardType: TextInputType.number,
          controller: Data.control,
        ),
      ),
    );
  }
}
