import 'package:flutter/material.dart';
import 'sound.dart';

class SoundPage extends StatefulWidget {
  const SoundPage({super.key});

  @override
  State<SoundPage> createState() => _SoundPageState();
}

class _SoundPageState extends State<SoundPage> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // 탭에 따른 라우팅
    if (index == 0) {
      // Navigator.pop(context);
      Navigator.pushNamed(context, '/three');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/one');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text('R/L ST F')),
          body: InteractiveViewer(
            child: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20), // 좌우 여백 설정
                  child: Center(
                      child: Column(children: [
                        if (sound['image1'] != null) Image.asset(sound['image1']!),
                        Text(sound['content'] ?? ''),
                        if (sound['image2'] != null) Image.asset(sound['image2']!),
                        Text(sound['content2'] ?? ''),
                        if (sound['image3'] != null) Image.asset(sound['image3']!),
                        Text(sound['content3'] ?? ''),
                        if (sound['image4'] != null) Image.asset(sound['image4']!),
                        Text(sound['content4'] ?? ''),
                      ]))),
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: '가정법',
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
