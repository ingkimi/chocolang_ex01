import 'package:flutter/material.dart';
import 'guess.dart';

class PageThree extends StatefulWidget {
  const PageThree({super.key});

  @override
  State<PageThree> createState() => _PageThreeState();
}

class _PageThreeState extends State<PageThree> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // 탭에 따른 라우팅
    if (index == 0) {
      // Navigator.pop(context);
      Navigator.pushNamed(context, '/two');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/sound');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text('가정법')),
          body: InteractiveViewer(
            child: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20), // 좌우 여백 설정
                  child: Center(
                      child: Column(children: [Text(guess['content'] ?? '')]))),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: '현재완료',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.language),
                label: 'R/L ST F',
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
