import 'package:flutter/material.dart';
import 'info.dart';

class Info extends StatefulWidget {
  const Info({super.key});

  @override
  State<Info> createState() => _InfoState();
}

class _InfoState extends State<Info> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // 탭에 따른 라우팅
    if (index == 0) {
      // Navigator.pop(context);
      Navigator.pop(context);
    } else if (index == 1) {
      Navigator.pushNamed(context, '/one');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text('Info')),
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
                icon: Icon(Icons.arrow_back),
                label: '되돌아가기',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.language),
                label: '영어 다의어',
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
