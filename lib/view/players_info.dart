import 'package:flutter/material.dart';
import 'package:tic_tac_toe/view/game_panel.dart';

class PlayersInfo extends StatefulWidget {
  const PlayersInfo({Key? key}) : super(key: key);

  @override
  State<PlayersInfo> createState() => _PlayersInfoState();
}

class _PlayersInfoState extends State<PlayersInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Players Panel")),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              // radius of 10
            ),
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                suffix: Icon(
                  Icons.circle,
                  color: Colors.blue,
                  size: 40,
                ),
                helperText: "Player 1",
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              // radius of 10
            ),
            child: const TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                suffix: Icon(
                  Icons.circle,
                  color: Colors.red,
                  size: 40,
                ),
                helperText: "Player 2",
                contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              ),
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView(
              children: const [
                Text("Heros List"),
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: ((context) => const GamePanel())));
      }),
    );
  }
}
