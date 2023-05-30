import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/bottom_navigation_service.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationService> (
        builder: (context, bottomNavigationBarService, child) {
          return BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: bottomNavigationBarService.selectedTabIndex,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.calendar,
                  // color: Theme.of(context).primaryColor,
                  // color: Color(0xff1A7F64),
                ),
                label: '캘린더',
              ),

              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.square_list,
                ),
                label: '홈',
              ),

              BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.video_camera,
                  // color: Theme.of(context).primaryColor,
                  // color: Color(0xff1A7F64),
                ),
                label: '비디오',
              ),

              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person_alt_circle),
                label: '내 정보',
              ),
            ],
            onTap: (index) {
              bottomNavigationBarService.setSelectedTabIndex(index);
            },
          );
        }
    );
  }
}
