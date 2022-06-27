import 'package:currency_exchange/core/constants/color_const.dart';
import 'package:currency_exchange/data/data_flag.dart';
import 'package:currency_exchange/models/currency_model.dart';
import 'package:currency_exchange/services/service_currency.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Builderim extends StatefulWidget {
  const Builderim({Key? key}) : super(key: key);

  @override
  _BuilderState createState() => _BuilderState();
}

class _BuilderState extends State<Builderim> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        height: MediaQuery.of(context).size.height * 1,
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 20.0),
        color: AllColor.bottomnavbarcolor,
        child: FutureBuilder(
          future: CurrencyService.getCurrency(),
          builder: (context, AsyncSnapshot<List<CurrencyModel>> snap) {
            if (!snap.hasData) {
              return const CupertinoActivityIndicator();
            } else if (snap.hasError) {
              return const Center(
                child: Text('Xato bor'),
              );
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.only(top: 0),
                itemBuilder: (context, index) {
                  return Card(
                    color: Colors.grey.withOpacity(0.5),
                    child: ListTile(
                      onTap: () {},
                      trailing: Text(
                        '${snap.data![index].cbPrice}  So\'m',
                        style: const TextStyle(
                          color: Colors.white,
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                          flags[index]['flagss'].toString(),
                        ),
                      ),
                      title: Text(
                        '${index+1}. ${snap.data![index].title}, ${snap.data![index].code} ',
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  );
                },
                itemCount: snap.data!.length,
              );
            }
          },
        ),
      ),
    );
  }
  
}
