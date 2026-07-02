import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player=AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final tabs=[
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  int previousIndex=0;
  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    if (currentIndex==0) player.play(AssetSource("1.mp3"));
    return Scaffold(
      appBar: AppBar(
        title: Text("我的自傳"),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
                             type: BottomNavigationBarType.fixed,
                             backgroundColor: Colors.blue,
                             selectedItemColor: Colors.white,
                             selectedFontSize: 18,
                             unselectedFontSize: 14,
                             iconSize: 30,
                             currentIndex: currentIndex,
                             items: [
                               BottomNavigationBarItem(icon: currentIndex==0? Image.asset('assets/a1.png', width: 40, height: 40,):Image.asset('assets/a11.png', width: 30, height: 30,), label:"自我介紹",),
                               BottomNavigationBarItem(icon: currentIndex==1? Image.asset('assets/a2.png', width: 40, height: 40,):Image.asset('assets/a21.png', width: 30, height: 30,), label:"學習歷程",),
                               BottomNavigationBarItem(icon: currentIndex==2? Image.asset('assets/a3.jpg', width: 40, height: 40,):Image.asset('assets/a31.jpg', width: 30, height: 30,), label:"學習計畫",),
                               BottomNavigationBarItem(icon: currentIndex==3? Image.asset('assets/a4.png', width: 40, height: 40,):Image.asset('assets/a41.png', width: 30, height: 30,), label:"專業方向",),
                             ],
                             onTap: (index) {
                               setState(() {
                                 previousIndex=currentIndex;
                                 currentIndex=index;
                                 if (index==0) {
                                    if (previousIndex==currentIndex) player.resume();
                                    player.stop();
                                    player.play(AssetSource("1.mp3"));
                                 }
                                 if (index==1) {
                                   if (previousIndex==currentIndex) player.resume();
                                   player.stop();
                                   player.play(AssetSource("2.mp3"));
                                 }
                                 if (index==2) {
                                   if (previousIndex==currentIndex) player.resume();
                                   player.stop();
                                   player.play(AssetSource("3.mp3"));
                                 }
                                 if (index==3) {
                                   if (previousIndex==currentIndex) player.resume();
                                   player.stop();
                                   player.play(AssetSource("4.mp3"));
                                 }
                               });
                             },
                           ),
    );
  }
}

class Screen1 extends StatelessWidget {
  const Screen1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "關於我",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/me_photo.jpg',
                  width: 260,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              "姓名: 黃俊樺\n"
              "生日: 2004年12月23日\n"
              "年齡: 20歲\n"
              "戶籍: 彰化縣線西鄉\n"
              "\n"
              "興趣嗜好:\n"
              "  騎機車\n"
              "  打撞球\n"
              "  玩遊戲\n"
              "\n"
              "學歷:\n"
              "  國立彰化師範大學附屬高級工業職業學校資訊科(彰工)\n"
              "  國立高雄科技大學資訊工程科系\n"
              "\n"
              "目標:\n"
              "  開發無人機或機械手臂等等所延伸的功能",
              style: TextStyle(fontSize: 18, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Center(
              child: Text(
                "學習歷程",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "在還小的時候，那時對學習沒有什麼興趣的我接觸到了電腦，這對還懵懵懂懂的我影響很大，"
              "自從生活有了電腦後，感覺每天都在上網玩遊戲，這段經歷也在後來一定的方面影響了我選擇就讀電腦相關專業。",
              style: TextStyle(fontSize: 18, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Center(
              child: Text(
                "未來規劃",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "• 往電腦視覺學術方面研究(無人機)\n"
              "• 人工智慧結合電腦視覺等技術，研發機械手臂等等\n"
              "• 實作 AI 模型（如影像辨識），提升實務開發能力",
              style: TextStyle(fontSize: 18, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
class Screen4 extends StatelessWidget {
  const Screen4({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Center(
              child: Text(
                "興趣與目標整理",
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 24),
            Text(
              "興趣嗜好:\n"
              "  騎機車\n"
              "  打撞球\n"
              "  玩遊戲\n"
              "\n"
              "長期目標:\n"
              "  開發無人機或機械手臂等等所延伸的功能，"
              "並結合電腦視覺與人工智慧技術，提升實務開發能力。",
              style: TextStyle(fontSize: 18, height: 1.6),
            ),
          ],
        ),
      ),
    );
  }
}
