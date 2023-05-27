import 'package:flutter/material.dart';
import 'package:p_002/components/bottom_navigation.dart';
import 'package:p_002/providers/bottom_navigation_service.dart';
import 'package:p_002/screens/account.dart';
import 'package:p_002/screens/calendar.dart';
import 'package:p_002/screens/motivation.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomNavigationService())
      ],
      child: const MyApp()
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
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
  static const List<Widget> _pages = <Widget>[
    Calendar(),
    Motivation(),
    Account(),
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomNavigationService>(
      builder: (context, bottomNavigationService, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            title: Text(widget.title,),
          ),
          body: IndexedStack(
            index: bottomNavigationService.selectedTabIndex,
            children: _pages,
          ),
          bottomNavigationBar: const BottomNavigation(),
        );
      }
    );
  }
}
