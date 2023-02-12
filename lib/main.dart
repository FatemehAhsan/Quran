// In the name of Allah

import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

const String bismillah = 'بِسْمِ ٱللَّهِ ٱلرَّحْمَٰنِ ٱلرَّحِيمِ';
const String bismillah_fa = 'به نام خداوند رحمتگر مهربان';

Future<String> _loadData(path) async {
  return await rootBundle.loadString(path);
}

String arabiNumber(String input) {
  const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const arabic = ['٠', '١', '٢', '٣', '٤', '٥', '٦', '٧', '٨', '٩'];

  for (int i = 0; i < english.length; i++) {
    input = input.replaceAll(english[i], arabic[i]);
  }

  return input;
}

void main() {
  runApp(const MyApp());
}

final surahNames = [
  'الحمد',
  ' البقرة',
  ' آل عمران (ع)',
  ' النساء',
  ' المائدة',
  ' الأنعام',
  ' الأعراف',
  ' الأنفال',
  ' التوبة',
  ' يونس (ع)',
  ' هود (ع)',
  ' يوسف (ع)',
  ' الرعد',
  ' إبراهيم (ع)',
  ' الحجر',
  ' النحل',
  ' الإسراء',
  ' الكهف',
  ' مريم (س)',
  ' طه',
  ' الأنبياء (ع)',
  ' الحج',
  ' المؤمنون',
  ' النور',
  ' الفرقان',
  ' الشعراء ',
  ' النمل',
  ' القصص',
  ' العنكبوت',
  ' الروم',
  ' لقمان (ع)',
  ' السجدة',
  ' الأحزاب',
  ' سبأ',
  ' فاطر',
  ' يس',
  ' الصافات',
  ' ص',
  ' الزمر',
  ' غافر',
  ' فصلت',
  ' الشورى',
  ' الزخرف',
  ' الدخان',
  ' الجاثية',
  ' الأحقاف',
  ' محمد (ص)',
  ' الفتح',
  ' الحجرات',
  ' ق',
  ' الذاريات',
  ' الطور',
  ' النجم',
  ' القمر',
  ' الرحمن',
  ' الواقعة',
  ' الحديد',
  ' المجادلة',
  ' الحشر',
  ' الممتحنة',
  ' الصف',
  ' الجمعة',
  ' المنافقون',
  ' التغبن',
  ' الطلاق',
  ' التحريم',
  ' الملك',
  ' القلم',
  ' الحاقة',
  ' المعارج',
  ' نوح (ع)',
  ' الجن',
  ' المزمل',
  ' المدثر',
  ' القيامة',
  ' الإنسان',
  ' المرسلات',
  ' النبأ',
  ' النازعات',
  ' عبس',
  ' التكوير',
  ' الإنفطار',
  ' المطففين',
  ' الانشقاق',
  ' البروج',
  ' الطارق',
  ' الأعلى',
  ' الغاشية',
  ' الفجر',
  ' البلد',
  ' الشمس',
  ' الليل',
  ' الضحى',
  ' الانشراح',
  ' التين',
  ' العلق',
  ' القدر',
  ' البينة',
  ' الزلزال',
  ' العاديات',
  ' القارعة',
  ' التكاثر',
  ' العصر',
  ' الهمزة',
  ' الفيل',
  ' قريش',
  ' الماعون',
  ' الكوثر',
  ' الكافرون',
  ' النصر',
  ' لهب',
  ' الإخلاص',
  ' الفلق',
  ' الناس'
];

final cumNum = [
  7,
  293,
  493,
  669,
  789,
  954,
  1160,
  1235,
  1364,
  1473,
  1596,
  1707,
  1750,
  1802,
  1901,
  2029,
  2140,
  2250,
  2348,
  2483,
  2595,
  2673,
  2791,
  2855,
  2932,
  3159,
  3252,
  3340,
  3409,
  3469,
  3503,
  3533,
  3606,
  3660,
  3705,
  3788,
  3970,
  4058,
  4133,
  4218,
  4272,
  4325,
  4414,
  4473,
  4510,
  4545,
  4583,
  4612,
  4630,
  4675,
  4735,
  4784,
  4846,
  4901,
  4979,
  5075,
  5104,
  5126,
  5150,
  5163,
  5177,
  5188,
  5199,
  5217,
  5229,
  5241,
  5271,
  5323,
  5375,
  5419,
  5447,
  5475,
  5495,
  5551,
  5591,
  5622,
  5672,
  5712,
  5758,
  5800,
  5829,
  5848,
  5884,
  5909,
  5931,
  5948,
  5967,
  5993,
  6023,
  6043,
  6058,
  6079,
  6090,
  6098,
  6106,
  6125,
  6130,
  6138,
  6146,
  6157,
  6168,
  6176,
  6179,
  6188,
  6193,
  6197,
  6204,
  6207,
  6213,
  6216,
  6221,
  6225,
  6230,
  6236
];
final ayaNums = [
  7,
  286,
  200,
  176,
  120,
  165,
  206,
  75,
  129,
  109,
  123,
  111,
  43,
  52,
  99,
  128,
  111,
  110,
  98,
  135,
  112,
  78,
  118,
  64,
  77,
  227,
  93,
  88,
  69,
  60,
  34,
  30,
  73,
  54,
  45,
  83,
  182,
  88,
  75,
  85,
  54,
  53,
  89,
  59,
  37,
  35,
  38,
  29,
  18,
  45,
  60,
  49,
  62,
  55,
  78,
  96,
  29,
  22,
  24,
  13,
  14,
  11,
  11,
  18,
  12,
  12,
  30,
  52,
  52,
  44,
  28,
  28,
  20,
  56,
  40,
  31,
  50,
  40,
  46,
  42,
  29,
  19,
  36,
  25,
  22,
  17,
  19,
  26,
  30,
  20,
  15,
  21,
  11,
  8,
  8,
  19,
  5,
  8,
  8,
  11,
  11,
  8,
  3,
  9,
  5,
  4,
  7,
  3,
  6,
  3,
  5,
  4,
  5,
  6
];

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int getSurahIndex(int number) {
    int sum = 0;
    int index = 0;
    while (sum < number) {
      sum += ayaNums[index];
      index++;
    }
    return index - 1;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(children: [
      Expanded(
          child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color.fromARGB(151, 246, 239, 97),
          foregroundColor: Colors.black,
        ),
        child: Center(
            child: Text('فهرست سوره‌ها',
                style: const TextStyle(
                    fontSize: 40.0, fontWeight: FontWeight.bold))),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Directionality(
                    textDirection: TextDirection.rtl,
                    child: SurasPage(),
                  )));
        },
      )),
      Expanded(
          child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: Color.fromARGB(151, 246, 239, 97),
          foregroundColor: Colors.black,
        ),
        child: Center(
            child: Text('آیه انتخابی',
                style: const TextStyle(
                    fontSize: 40.0, fontWeight: FontWeight.bold))),
        onPressed: () {
          int surahIndex = Random().nextInt(114);
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Directionality(
              textDirection: TextDirection.rtl,
              child: SurahPage(
                  surahIndex: surahIndex,
                  ayahNumber:
                      getRandomAyahNumber(ayaNums[surahIndex], surahIndex),
                  random: true),
            ),
          ));
        },
      ))
    ])));
  }

  int getRandomAyahNumber(ayatCounts, int surahIndex) {
    if (surahIndex != 8 && surahIndex != 0)
      return Random().nextInt(ayatCounts) + 1;
    else
      return Random().nextInt(ayatCounts);
  }
}

class SurasPage extends StatefulWidget {
  const SurasPage({Key? key}) : super(key: key);

  @override
  _SurasPageState createState() => _SurasPageState();
}

class _SurasPageState extends State<SurasPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: surahNames.length,
              itemBuilder: (context, index) {
                return Column(children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Color.fromARGB(151, 246, 239, 97),
                      foregroundColor: Colors.black,
                    ),
                    child: Center(
                        child: Text(
                            arabiNumber((index + 1).toString()) +
                                '- ' +
                                surahNames[index],
                            style: const TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold))),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Directionality(
                                textDirection: TextDirection.rtl,
                                child: SurahPage(
                                    surahIndex: index,
                                    ayahNumber: 0,
                                    random: false),
                              )));
                    },
                  )
                ]);
              },
            ),
          )
        ],
      ),
    ));
  }
}

class SurahPage extends StatefulWidget {
  final int surahIndex, ayahNumber;
  final bool random;
  const SurahPage(
      {Key? key,
      required this.surahIndex,
      required this.ayahNumber,
      required this.random})
      : super(key: key);

  @override
  _SurahPageState createState() => _SurahPageState();
}

class _SurahPageState extends State<SurahPage> {
  List<String> _data = [];
  List<String> _trans = [];
  final player = AudioPlayer();

  bool transPlayed = false;
  bool playing = false;

  int ayahNumber = 0;

  Future<void> jump() async {
    setState(() {
      _scrollController.jumpTo(index: widget.ayahNumber);
    });
  }

  void playSingleFileTrans(path, name) {
    player.play(UrlSource('$path/t/$name.mp3'));
    transPlayed = !transPlayed;
  }

  void playSingleFile(path, name, ayahNumber) {
    setState(() {
      if (ayahNumber != 1 && widget.surahIndex != 0 && widget.surahIndex != 8)
        _scrollController.jumpTo(index: ayahNumber);
      else
        _scrollController.jumpTo(index: ayahNumber - 1);
    });
    player.play(UrlSource('$path/$name.mp3'));
  }

  String setProcedingZeros(int number) {
    if (number < 10) {
      return '00$number';
    }
    if (number < 100) {
      return '0$number';
    }
    return '$number';
  }

  void playAll() async {
    playing = true;
    final directory = await getExternalStorageDirectory();
    String surahString = setProcedingZeros(widget.surahIndex + 1);
    playSingleFile(directory?.path, surahString + setProcedingZeros(ayahNumber),
        ayahNumber);
    player.onPlayerComplete.listen((event) {
      if (transPlayed) {
        setState(() {
          ayahNumber++;
        });
        if (ayahNumber <= ayaNums[cumNum[widget.surahIndex]]) {
          playSingleFile(directory?.path,
              surahString + setProcedingZeros(ayahNumber), ayahNumber);
        }
        transPlayed = !transPlayed;
      } else {
        playSingleFileTrans(
            directory?.path, surahString + setProcedingZeros(ayahNumber));
      }
    });
  }

  void _pause() {
    if (playing) {
      player.pause();
    } else {
      player.resume();
    }
    setState(() {
      playing = !playing;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.surahIndex != 0 && widget.surahIndex != 8) {
      _data += [bismillah];
      _trans += [bismillah_fa];
    }
    _loadData('assets/texts/a.txt').then((v) {
      setState(() {
        _data += v.split('\n').sublist(
            cumNum[widget.surahIndex] - ayaNums[widget.surahIndex],
            cumNum[widget.surahIndex]);
      });
    });
    _loadData('assets/texts/f.txt').then((v) {
      setState(() {
        _trans += v.split('\n').sublist(
            cumNum[widget.surahIndex] - ayaNums[widget.surahIndex],
            cumNum[widget.surahIndex]);
      });
    });
  }

  String getAyahNumber(index) {
    if (widget.surahIndex == 0 || widget.surahIndex == 8)
      return ' (' + arabiNumber((index + 1).toString()) + ')';
    else if (index != 0)
      return ' (' + arabiNumber((index).toString()) + ')';
    else
      return '';
  }

  ItemScrollController _scrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    if (widget.random) Future(jump);
    return SafeArea(
      child: Scaffold(
          body: Container(
        color: Color.fromARGB(151, 246, 239, 97),
        child: Column(
          children: [
            getNameAndAyahNumber(),
            _data.isNotEmpty && _trans.isNotEmpty
                ? Expanded(
                    child: ScrollablePositionedList.builder(
                      itemScrollController: _scrollController,
                      itemCount: _data.length,
                      itemBuilder: (context, index) {
                        return Column(children: [
                          TextButton(
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black),
                            child: Column(children: [
                              RichText(
                                  text: TextSpan(
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                      children: [
                                    TextSpan(
                                        text: _data[index],
                                        style: const TextStyle(fontSize: 35.0)),
                                    TextSpan(
                                        text: getAyahNumber(index),
                                        style: const TextStyle(fontSize: 20.0))
                                  ])),
                              Text(_trans[index],
                                  style: const TextStyle(fontSize: 23.0))
                            ]),
                            onPressed: () {
                              if (widget.surahIndex != 0 &&
                                  widget.surahIndex != 8 &&
                                  index != 0) {
                                setState(() {
                                  ayahNumber = index;
                                });
                                playAll();
                              } else {
                                setState(() {
                                  ayahNumber = index + 1;
                                });
                                playAll();
                              }
                            },
                          )
                        ]);
                      },
                    ),
                  )
                : Container(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: _pause,
          backgroundColor: Color.fromARGB(151, 246, 239, 97),
          child: playing ? Icon(Icons.pause) : Icon(Icons.play_arrow)),
    ));
  }

  Text getNameAndAyahNumber() {
    return widget.random
        ? Text(
            surahNames[widget.surahIndex] +
                ' آیه: ' +
                arabiNumber(widget.ayahNumber.toString()),
            style: const TextStyle(fontSize: 23.0, color: Colors.green))
        : Text(surahNames[widget.surahIndex],
            style: const TextStyle(fontSize: 23.0, color: Colors.green));
  }
}
