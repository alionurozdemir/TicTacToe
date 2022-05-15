import 'package:flutter/material.dart';
import 'package:tic_tac_toe/view/players_info.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Welcome to TT",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Column(children: [
          Stack(alignment: Alignment.center, clipBehavior: Clip.none, children: [
            SizedBox(height: 395, child: Image.asset("assets/images/background.png")),
            Positioned(
                top: 150,
                left: 135,
                child: Container(
                    width: 127,
                    height: 100,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/images/words.png"), fit: BoxFit.contain),
                    ))),
            const Positioned(
                top: 375,
                child: CircleAvatar(
                    backgroundColor: Colors.orange,
                    radius: 50,
                    child: Text(
                      'V 1.0',
                      style:
                          TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                    )))
          ]),
          const Spacer(),
          Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => PlayersInfo(
                                  herosList: const [],
                                ))));
                  },
                  child: const Text(
                    "Continue >>",
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.green),
                  ))),
          const Spacer(),
        ]));
  }
}
