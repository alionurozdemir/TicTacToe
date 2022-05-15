import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to TT"),
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              Container(height: 395, child: Image.asset("assets/images/background.png")),
              Positioned(
                top: 150,
                left: 135,
                child: Container(
                  width: 127,
                  height: 100,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/words.png"),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              const Positioned(
                top: 375,
                child: CircleAvatar(
                  backgroundColor: Colors.orange,
                  radius: 50,
                  child: Text(
                    'V 1.0',
                    style:
                        TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Positioned(
                top: 500,
                child: GestureDetector(
                  onTap: () => print("object"),
                  child: const Text(
                    "Continue >>",
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.green),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
