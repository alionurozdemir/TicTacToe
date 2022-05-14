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
            children: [
              Container(
                width: 500,
                height: 400,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/background.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Container(
                width: 100,
                height: 100,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/words.png"),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const Positioned(
                top: 350,
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
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          const Text(
            "Continue >>",
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.green),
          )
        ],
      ),
    );
  }
}
