import 'package:flutter/material.dart';
import 'package:tic_tac_toe/view/game_panel.dart';

// ignore: must_be_immutable
class PlayersInfo extends StatefulWidget {
  PlayersInfo({Key? key, required this.herosList}) : super(key: key);

  List herosList;

  @override
  State<PlayersInfo> createState() => _PlayersInfoState();
}

class _PlayersInfoState extends State<PlayersInfo> {
  List winnerList = [];

  final name1 = TextEditingController();
  final name2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        "Players Panel",
        style: TextStyle(color: Colors.black),
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              TextField(
                controller: name1,
                decoration: const InputDecoration(
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
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: name2,
                decoration: const InputDecoration(
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
              const SizedBox(
                height: 15,
              ),
              const Text(
                "Heros List : ",
                style: TextStyle(fontSize: 25),
              ),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  itemCount: widget.herosList.length,
                  itemBuilder: (context, index) => ListTile(
                      leading: const Icon(
                        Icons.star,
                        color: Colors.orange,
                      ),
                      title: Text(widget.herosList[index].toString())),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: ((context) => GamePanel(
                        playerNameOne: name1.text,
                        playerNameTwo: name2.text,
                      ))));
        },
        child: const Icon(
          Icons.arrow_right_alt,
          size: 50,
        ),
      ),
    );
  }
}
