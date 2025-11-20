import 'package:flutter/material.dart';

void main() => runApp(const DestiniApp());

class DestiniApp extends StatelessWidget {
  const DestiniApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Destini',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.purple[900],
      ),
      home: const StoryPage(),
    );
  }
}

// Story class
class Story {
  final String storyText;
  final String choice1;
  final String choice2;
  final int? choice1Next;
  final int? choice2Next;

  Story({
    required this.storyText,
    required this.choice1,
    required this.choice2,
    this.choice1Next,
    this.choice2Next,
  });
}

class StoryBrain {
  final List<Story> _storyData = [
    Story(
      storyText: 'Bạn thấy một con đường rừng tối và u ám. Bạn muốn đi đâu?',
      choice1: 'Đi vào rừng',
      choice2: 'Đi theo con đường mòn',
      choice1Next: 1,
      choice2Next: 2,
    ),
    Story(
      storyText: 'Bạn gặp một con sông lớn. Bạn muốn làm gì?',
      choice1: 'Bơi qua sông',
      choice2: 'Tìm cầu bắc qua',
      choice1Next: 3,
      choice2Next: 4,
    ),
    Story(
      storyText: 'Bạn tìm thấy một ngôi làng yên bình. Bạn muốn nghỉ ngơi hay đi tiếp?',
      choice1: 'Nghỉ lại làng',
      choice2: 'Đi tiếp vào rừng',
      choice1Next: 4,
      choice2Next: 1,
    ),
    Story(
      storyText: 'Bạn bơi qua sông và bị lạc. Kết thúc.',
      choice1: 'Restart',
      choice2: '',
    ),
    Story(
      storyText: 'Bạn tìm được cầu bắc qua sông và an toàn. Kết thúc.',
      choice1: 'Restart',
      choice2: '',
    ),
  ];

  int _currentStoryIndex = 0;

  String getStory() => _storyData[_currentStoryIndex].storyText;
  String getChoice1() => _storyData[_currentStoryIndex].choice1;
  String getChoice2() => _storyData[_currentStoryIndex].choice2;
  bool buttonShouldBeVisible() => _storyData[_currentStoryIndex].choice2 != '';

  void nextStory(int choiceNumber) {
    if (_storyData[_currentStoryIndex].choice1 == 'Restart') {
      _currentStoryIndex = 0;
      return;
    }

    if (choiceNumber == 1) {
      _currentStoryIndex = _storyData[_currentStoryIndex].choice1Next!;
    } else if (choiceNumber == 2) {
      _currentStoryIndex = _storyData[_currentStoryIndex].choice2Next!;
    }
  }
}

class StoryPage extends StatefulWidget {
  const StoryPage({super.key});

  @override
  State<StoryPage> createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final StoryBrain storyBrain = StoryBrain();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Center(
                child: Text(
                  storyBrain.getStory(),
                  style: const TextStyle(
                    fontSize: 25.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pinkAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: Text(
                    storyBrain.getChoice1(),
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                ),
              ),
            ),
            Visibility(
              visible: storyBrain.buttonShouldBeVisible(),
              child: Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      storyBrain.getChoice2(),
                      style: const TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
