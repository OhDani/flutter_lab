import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(const BMICalculatorApp());

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
        primaryColor: Colors.pinkAccent,
      ),
      home: const InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  double height = 170; // cm
  int weight = 70; // kg
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Height slider
          Expanded(
            child: Card(
              margin: const EdgeInsets.all(15),
              color: Colors.grey[850],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Chiều cao (cm)',
                    style: TextStyle(fontSize: 18, color: Colors.white70),
                  ),
                  Text(
                    height.toStringAsFixed(1),
                    style: const TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Slider(
                    value: height,
                    min: 100,
                    max: 220,
                    activeColor: Colors.pinkAccent,
                    inactiveColor: Colors.grey,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),

          // Weight & Age
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Card(
                    margin: const EdgeInsets.all(15),
                    color: Colors.grey[850],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Cân nặng (kg)',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white70)),
                        Text(
                          '$weight',
                          style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: const Icon(Icons.remove),
                                color: Colors.white),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                },
                                icon: const Icon(Icons.add),
                                color: Colors.white),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Card(
                    margin: const EdgeInsets.all(15),
                    color: Colors.grey[850],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Tuổi',
                            style:
                                TextStyle(fontSize: 18, color: Colors.white70)),
                        Text(
                          '$age',
                          style: const TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: const Icon(Icons.remove),
                                color: Colors.white),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: const Icon(Icons.add),
                                color: Colors.white),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Calculate Button
          GestureDetector(
            onTap: () {
              double bmi = weight / pow(height / 100, 2);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultPage(bmi: bmi)));
            },
            child: Container(
              color: Colors.pinkAccent,
              margin: const EdgeInsets.only(top: 10),
              width: double.infinity,
              height: 70,
              child: const Center(
                child: Text(
                  'TÍNH BMI',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final double bmi;
  const ResultPage({super.key, required this.bmi});

  String getResult() {
    if (bmi < 18.5) return 'Thiếu cân';
    if (bmi < 25) return 'Bình thường';
    if (bmi < 30) return 'Thừa cân';
    return 'Béo phì';
  }

  String getInterpretation() {
    if (bmi < 18.5) return 'Bạn nên ăn nhiều hơn và tập thể dục nhẹ nhàng.';
    if (bmi < 25) return 'Cơ thể bạn khỏe mạnh, duy trì nhé!';
    if (bmi < 30) return 'Cần kiểm soát chế độ ăn và tập thể dục.';
    return 'Hãy giảm cân và theo dõi sức khỏe thường xuyên.';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kết quả BMI'),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Kết quả của bạn',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            Card(
              color: Colors.grey[850],
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Text(
                      getResult(),
                      style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.pinkAccent),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      bmi.toStringAsFixed(1),
                      style: const TextStyle(
                          fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      getInterpretation(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18, color: Colors.white70),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Container(
                color: Colors.pinkAccent,
                height: 60,
                width: double.infinity,
                child: const Center(
                  child: Text(
                    'TÍNH LẠI',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
