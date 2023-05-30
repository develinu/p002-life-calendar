import 'dart:math';

import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  final int currentAge = 33;
  final int sex = 0;
  final List<String> _valueList = ["연", "분기", "월"];
  String _selectedValue = "연";

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
    } else if (age == currentAge) {
      statusColor["status"] = Colors.lightGreenAccent;
      statusColor["ageText"] = Colors.black;
    } else if (age > 60) {
      statusColor["status"] = Colors.black45;
      statusColor["ageText"] = Colors.white;
    }
    return statusColor;
  }

  Map<String, int> getDateFilterData(value) {
    Map<String, int> dateFilterData = {
      "expectancyAge": (sex == 0) ? 80 : 86,
      "horizonItemCount": 10,
      "totalItemCount": (sex == 0) ? 80 : 86,
      "displayAgeInterval": 1,
    };

    switch(value) {
      case "분기":
        dateFilterData["horizonItemCount"] = 16;
        dateFilterData["totalItemCount"] =
            dateFilterData["expectancyAge"]! * 4;
        dateFilterData["displayAgeInterval"] = 4;
        break;
      case "월":
        dateFilterData["horizonItemCount"] = 24;
        dateFilterData["totalItemCount"] =
            dateFilterData["expectancyAge"]! * 12;
        dateFilterData["displayAgeInterval"] = 12;
        break;
    }
    return dateFilterData;
  }

  Row createLegend(color, text) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        SizedBox(
          height: 10.0,
          width: 10.0,
          child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.zero,
                  backgroundColor: color,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(1.0),
                      side: const BorderSide(color: Colors.grey)
                  )
              ),
              child: const Text("")
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 2.0, right: 6.0),
          child: Text(
              text,
              style: const TextStyle(
                fontSize: 10.0,
              )
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    Map<String, int> dateFilterData = getDateFilterData(_selectedValue);

    return Column(
      children: [
        // 필터
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

        // 범례
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            createLegend(Colors.green, "완료"),
            createLegend(Colors.red, "미흡"),
            createLegend(Colors.lightGreenAccent, "진행중"),
            createLegend(Colors.black45, "노년기"),
          ],
        ),

        // 캘린더
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.count(
                crossAxisCount: dateFilterData["horizonItemCount"]!,
                children: List.generate(
                    dateFilterData["totalItemCount"]!,
                        (index) {
                      var age = (index ~/ dateFilterData["displayAgeInterval"]!) + 1;
                      var ageText = index % dateFilterData["displayAgeInterval"]! == 0 ? "$age" : "";
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
                    }
                )
            ),
          ),
        ),
      ],
    );
  }
}
