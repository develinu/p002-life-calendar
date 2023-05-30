import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

class Todos extends StatefulWidget {
  const Todos({Key? key}) : super(key: key);

  @override
  State<Todos> createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  @override
  Widget build(BuildContext context) {
    var days = getDateTimeRangeListFromDeltaDays(-10, 10);
    print(days);

    return ListView.builder(
      itemCount: days.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(days[index].toString()),
          ),
        );
      },
    );
  }
}
