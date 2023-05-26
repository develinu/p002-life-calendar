import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '인생 달력'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _valueList = ["연", "월", "일"];
  var _selectedValue = "연";

  Map<String, Color> getStatusColor(age, currentAge) {
    Map<String, Color> statusColor = {
      "status": Colors.white,
      "ageText": Colors.black
    };
    var rate = Random().nextInt(100);
    var isSuccess = rate >= 5;

    if (age < currentAge) {
      if (isSuccess) {
        statusColor["status"] = Colors.green;
        statusColor["ageText"] = Colors.white;

      } else {
        statusColor["status"] = Colors.red;
        statusColor["ageText"] = Colors.white;
      }
    } else if (age > 60) {
      statusColor["status"] = Colors.black45;
      statusColor["ageText"] = Colors.white;
    }
    return statusColor;
  }

  Map<String, int> getDateFilterData(value) {
    Map<String, int> dateFilterData = {
      "horizonItemCount": 24,
      "totalItemCount": 960,
      "displayAgeInterval": 1,
    };

    switch(value) {
      case "연":
        dateFilterData["horizonItemCount"] = 1;
        dateFilterData["totalItemCount"] = 2;
        dateFilterData["displayAgeInterval"] = 3;
        break;
      case "월":
        dateFilterData["horizonItemCount"] = 1;
        dateFilterData["totalItemCount"] = 2;
        dateFilterData["displayAgeInterval"] = 3;
        break;
      case "일":
        dateFilterData["horizonItemCount"] = 1;
        dateFilterData["totalItemCount"] = 2;
        dateFilterData["displayAgeInterval"] = 3;
        break;
      default:
        dateFilterData["horizonItemCount"] = 1;
        dateFilterData["totalItemCount"] = 2;
        dateFilterData["displayAgeInterval"] = 3;
        break;
    }
    return dateFilterData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title,),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "인생은 짧아요 !",
                  style: TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                  )
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text("필터 : "),
                    DropdownButton(
                      value: _selectedValue,
                      items: _valueList.map(
                        (value) {
                          return DropdownMenuItem(
                            value: value,
                            child: Text(value)
                          );
                        },
                      ).toList(),
                      onChanged: (value) {
                        setState(() {
                          _selectedValue = value!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.count(
                crossAxisCount: 24 ~/ 1.5,
                children: List.generate(960 ~/ 3, (index) {
                  var age = (index ~/ (12 / 3)) + 1;
                  var currentAge = 33;
                  var ageText = index % (24 ~/ 5) == 0 ? "$age" : "";
                  var statusColor = getStatusColor(age, currentAge);

                  return Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ElevatedButton(
                      onPressed: () {
                        print("Button $index pressed");
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        backgroundColor: statusColor["status"],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.0),
                          side: BorderSide(
                            color: age < currentAge
                              ? Colors.grey
                              : Colors.grey
                          )
                        )
                      ),
                      child: Text(
                          ageText,
                        style: TextStyle(
                          fontSize: 8.0,
                          color: statusColor["ageText"]
                        )
                      )
                    ),
                  );
                })
              ),
            ),
          ),
        ],
      ),
    );
  }
}
