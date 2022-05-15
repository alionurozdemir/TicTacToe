import 'package:flutter/material.dart';
import 'package:tic_tac_toe/view/home.dart';
import 'package:tic_tac_toe/view/players_info.dart';

class GamePanel extends StatefulWidget {
  GamePanel({Key? key, required this.playerNameOne, required this.playerNameTwo}) : super(key: key);

  String playerNameOne = " Player 1";
  String playerNameTwo = "Player 2";

  @override
  State<GamePanel> createState() => _GamePanelState();
}

class _GamePanelState extends State<GamePanel> {
  bool ohTurn = true; // the first player is 0!
  List<String> displayExOh = ['', '', '', '', '', '', '', '', ''];

  int ohScore = 0;
  int exScore = 0;
  int round = 0;
  int filledBoxes = 0;
  String turnPlayer = " Player 1 (X)";

  List herosList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[100],
      appBar: AppBar(
        title: const Text(
          "Game Panel",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "${widget.playerNameOne} Score: $exScore ",
              style: const TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              "${widget.playerNameTwo} :$ohScore ",
              style: const TextStyle(color: Colors.red, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Divider(
              thickness: 1,
              indent: 10,
              endIndent: 10,
              color: Colors.black,
              height: 15,
            ),
            Text(
              "Round : $round",
              style:
                  const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                const Text(
                  "Turn:",
                  style: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                ),
                Text(
                  turnPlayer,
                  style: const TextStyle(
                      color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const Divider(
              thickness: 1,
              indent: 10,
              endIndent: 10,
              color: Color.fromARGB(255, 151, 151, 151),
              height: 15,
            ),
            SizedBox(
              height: 380,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                      color: Colors.white,
                      child: GridView.builder(
                          itemCount: 9,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: () {
                                _tapped(index);
                              },
                              child: Container(
                                decoration: BoxDecoration(border: Border.all(color: Colors.black)),
                                child: Center(
                                    child: Text(
                                  displayExOh[index],
                                  style: TextStyle(
                                      color: displayExOh[index] == 'o' ? Colors.red : Colors.blue,
                                      fontSize: 100),
                                )),
                              ),
                            );
                          }),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    onPressed: _clearBoard,
                    child: const Text(
                      "Reset",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )),
                ElevatedButton(
                    onPressed: (() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PlayersInfo(
                                    herosList: herosList,
                                  )));
                    }),
                    child: const Text(
                      "Exit",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    )),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'o';
        filledBoxes += 1;
        turnPlayer = " Player 1 (X)";
      } else if (!ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'x';
        filledBoxes += 1;
        turnPlayer = " Player 2 (O)";
      }

      ohTurn = !ohTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    // checks 1st row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }

    // checks 2nd row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showWinDialog(displayExOh[3]);
    }

    // checks 3rd row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
    }

    // checks 1st column
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    }

    // checks 2nd column
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showWinDialog(displayExOh[1]);
    }

    // checks 3rd column
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showWinDialog(displayExOh[2]);
    }

    // checks diagonal
    if (displayExOh[6] == displayExOh[4] &&
        displayExOh[6] == displayExOh[2] &&
        displayExOh[6] != '') {
      _showWinDialog(displayExOh[6]);
    }

    // checks diagonal
    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showWinDialog(displayExOh[0]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('DRAW!!'),
            actions: <Widget>[
              TextButton(
                child: const Text('Play Again!'),
                onPressed: () {
                  _clearBoard();
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: winner == 'x'
                ? const Text('Congratulations!!! Player 1 wron (+3 Points )')
                : const Text('Congratulations!!! Player 2 wron (+3 Points )'),
            actions: <Widget>[
              TextButton(
                child: const Text('Play Again!'),
                onPressed: () {
                  _clearBoard;
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        });

    if (winner == 'o') {
      ohScore += 1;
      herosList.add("Player 1  Score = $ohScore");
      round += 1;
    } else if (winner == 'x') {
      exScore += 1;
      herosList.add("Player 2 Score =  $exScore");
      round += 1;
    }
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
    });

    filledBoxes = 0;
  }
}
