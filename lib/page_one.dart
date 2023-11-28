import 'package:flutter/material.dart';
import 'dic.dart';

class PageOne extends StatefulWidget {
  PageOne({Key? key}) : super(key: key);
  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> with SingleTickerProviderStateMixin {
  List<Map<String, dynamic>> words = dic.cast<Map<String, dynamic>>();
  List<Map<String, dynamic>> sortedWords = []; // 정렬된 단어 목록을 저장하는 변수
  bool updated = false;

  int _selectedIndex = 0;
  bool sorted = false; // 정렬 상태를 나타내는 변수

  void _sortWords() {
    setState(() {
      sorted = !sorted;
      if (sorted) {
        sortedWords = List.from(words); // 정렬하기 전에 복사
        sortedWords.sort(
                (a, b) => (a['word'] as String).compareTo(b['word'] as String));
      }
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    // 탭에 따른 라우팅
    if (index == 0) {
      Navigator.pushNamed(context, '/two');
    } else if (index == 1) {
      Navigator.pushNamed(context, '/three');
    }
  }

  @override
  Widget build(BuildContext context) {
    // 알파벳 순으로 정렬된 단어 목록을 사용하여 ListView의 아이템을 렌더링
    List<Map<String, dynamic>> displayedWords = sorted ? sortedWords : words;
    return Scaffold(
      appBar: AppBar(
        title: const Text('영어 다의어'),
        actions: [
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(context, '/settings');
              }),
          SizedBox(width: 8)
        ],
      ),
      body: Container(
        child: Center(
          child: ListView.separated(
            itemCount: displayedWords.length,
            separatorBuilder: (context, index) {
              return const Divider(height: 2, color: Colors.black);
            },
            itemBuilder: (context, index) {
              Map<String, dynamic> word =
              displayedWords[index] as Map<String, dynamic>;
              return ListTile(
                leading: loadImage(word),
                title: Text(
                  '  ${word['word']}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(word['meanings']),
                onTap: () {
                  Navigator.pushNamed(context, '/detail', arguments: {
                    'arg1': displayedWords[index],
                    'arg2': index
                  });
                },
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: '현재완료',
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
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(width: 16),
          ElevatedButton(
            onPressed: () {
              _sortWords(); // _sortWords() 함수 호출
            },
            child: Text(sorted ? '원래 순서대로' : '알파벳순'),
          ),
        ],
      ),
    );
  }

  Widget loadImage(Map word) {
    return Image.asset(
      word['image1'],
      height: 80,
      width: 70,
      fit: BoxFit.fill,
    );
  }
}
