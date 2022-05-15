import 'package:flutter/material.dart';

class GamePanel extends StatefulWidget {
  GamePanel({Key? key}) : super(key: key);

  @override
  State<GamePanel> createState() => _GamePanelState();
}

class _GamePanelState extends State<GamePanel> {
  List<String> displayEx0h = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text("Game Panel"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const Text(
              "Player 1 Score: 0",
              style: TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Text(
              "Player 2 Score : 0",
              style: TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Divider(
              thickness: 1,
              indent: 40,
              endIndent: 40,
              color: Colors.black,
              height: 15,
            ),
            const Text(
              "Round : 1",
              style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                const Text(
                  "Turn: ",
                  style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Text(
                  "Player 1 (X) ",
                  style: TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 500,
              child: GridView.builder(
                  itemCount: 9,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        _tapped(index);
                      },
                      child: Container(
                        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                        child: Center(
                            child: Text(
                          displayEx0h[index],
                          style: TextStyle(color: Colors.white, fontSize: 40),
                        )),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      displayEx0h[index] = 'o';
    });
  }
}
