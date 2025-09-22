import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/avatar.png'), // thêm ảnh của bạn
              ),
              const Text(
                'Nguyen Van A',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                'FLUTTER DEVELOPER',
                style: TextStyle(
                  fontFamily: 'SourceSans3',
                  fontSize: 18,
                  color: Colors.tealAccent,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 20,
                width: 150,
                child: Divider(color: Colors.tealAccent),
              ),
              const Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(Icons.phone, color: Colors.teal),
                  title: Text(
                    '+84 912 345 678',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
              const Card(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 25),
                child: ListTile(
                  leading: Icon(Icons.email, color: Colors.teal),
                  title: Text(
                    'example@email.com',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
