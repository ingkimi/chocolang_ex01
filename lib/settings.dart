import 'package:flutter/material.dart';
import 'info.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // 탭에 따른 라우팅
    if (index == 0) {
      // Navigator.pop(context);
      Navigator.pushNamed(context, '/one');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/three');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text('현재완료')),
          body: InteractiveViewer(
            child: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20), // 좌우 여백 설정
                  child: Center(
                      child: Column(children: [Text(info['content'] ?? '')]))),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.language),
                label: '영어 다의어',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.lightbulb),
                label: '가정법',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ));
  }
}
