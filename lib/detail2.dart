import 'package:flutter/material.dart';
import 'dic.dart';
// import 'package:audioplayers/audioplayers.dart';

class Detail2 extends StatefulWidget {
  Detail2({Key? key});

  @override
  State<Detail2> createState() => _Detail2State();
}

class _Detail2State extends State<Detail2> {
  int _selectedIndex = 0;

  late List<Map<String, dynamic>> words; // Define words variable
  late Map<String, dynamic> word;
  late int index; // define index variable

  @override
  void initState() {
    super.initState();
    words = []; //초기화
    _loadWord();
    // audioCache = AudioCache(prefix: 'sound/');
  }

  void _loadWord() {
    Future.delayed(Duration.zero, () {
      setState(() {
        words = dic.cast<Map<String, dynamic>>();
        // word = args[arg1];

        // index =
        //     ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
      });
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.pushNamed(context, '/one');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/two');
    }
  }

  // AudioCache audioCache = AudioCache();
  _navigateToNextWord() {
    index++;
    // audioCache.play('tic.wav'); // 'tick_sound.mp3'에는 틱 소리 파일의 경로를 설정합니다.
    Navigator.pushReplacementNamed(context, '/detail',
        arguments: {'arg1': words[index], 'arg2': index});
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> args =
    ModalRoute.of(context)?.settings.arguments as Map<String, Object>;
    word = args['arg1'];
    index = args['arg2'];
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text(word['word'])),
          body: InteractiveViewer(
            child: SingleChildScrollView(
              child: Container(
                  child: Center(
                      child: Column(children: [
                        Image.asset(word['image1']),
                        Text(''),
                        Container(
                          color: const Color.fromARGB(255, 101, 231, 106),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 16), // 좌우 여백 설정
                          child: Text(word['meanings'],
                              style: TextStyle(
                                  color: Colors.indigo, fontWeight: FontWeight.bold)),
                        ),
                        Text(''),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 16), // 좌우 여백 설정
                          child: Text(word['comment1']),
                        ),
                        if (word['image2'] != null) Image.asset(word['image2']),
                        if (word['comment2'] != null)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16), // 좌우 여백 설정
                            child: Text(word['comment2']),
                          ),
                        if (word['image3'] != null) Image.asset(word['image3']),
                        if (word['comment3'] != null)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 16), // 좌우 여백 설정
                            child: Text(word['comment3']),
                          ),
                      ]))),
            ),
          ),
          floatingActionButton: buildFloatWidget(),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                //key: Key('go_back_item'),
                icon: Icon(Icons.arrow_back),
                label: '되돌아가기',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.star),
                label: '현재완료',
              ),
            ],
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
            selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          ),
        ));
  }

  Widget buildFloatWidget() {
    print(index);
    print('====');
    print(words.length - 1);
    if (index == words.length - 1) {
      return FloatingActionButton(
        onPressed: _navigateToNextWord,
        child: Text('끝', style: TextStyle(fontSize: 12)),
      );
    } else {
      return FloatingActionButton(
        onPressed: _navigateToNextWord,
        child: Text('다음\n단어', style: TextStyle(fontSize: 12)),
      );
    }
  }
}
