import 'package:flutter/material.dart';
import 'package:tic_tac_toe/view/game_panel.dart';

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
      appBar: AppBar(title: const Text("Players Panel")),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            const Divider(
              thickness: 1,
              indent: 10,
              endIndent: 10,
              color: Color.fromARGB(255, 151, 151, 151),
              height: 15,
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 10,
                    blurRadius: 5,
                    offset: Offset(0, 7), // changes position of shadow
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
                // radius of 10
              ),
              child: TextField(
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
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 10,
                    blurRadius: 5,
                    offset: Offset(0, 7), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(25),
                color: Colors.white,

                // radius of 10
              ),
              child: TextField(
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
            ),
            SizedBox(
              height: 15,
            ),
            Text(
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
