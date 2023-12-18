import 'package:flutter/material.dart';
import 'dart:math' as math;

class HomePage extends StatelessWidget {
  @override

  String gameName = 'My Game Name';
  int roundCount = 0;
  Color themeColor = const Color.fromARGB(255, 93, 143, 235); //put in provider

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 15, 20, 58),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: const EdgeInsets.all(8.0),
              color: const Color.fromARGB(255, 15, 20, 58),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      gameName,
                      style: const TextStyle(
                        fontFamily: 'Scrubland',
                        color: Colors.white,
                        fontSize: 35
                      ),
                    )
                  ),
                  const SizedBox(height: 8.0),
//START Round Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
//START Decrement Round Btn
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: Container(
                          decoration: BoxDecoration(
                            color: themeColor,
                            borderRadius: const BorderRadius.all(Radius.circular(4))),
                          child: TextButton(
                            onPressed: () {
                              if (roundCount > 0){
                                roundCount--;
                                print(roundCount);
                              }
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: const RoundedRectangleBorder()),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                              ),
                          ),
                        ),
                      ),
//END Decrement Round Btn
//START Round Text
                      Text(
                        'Round $roundCount',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Wolfskin',
                          fontSize: 28,
                        ),
                      ),
//END Round Text
//START Increment Round Btn
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: Container(
                          decoration: BoxDecoration(
                            color: themeColor,
                            borderRadius: const BorderRadius.all(Radius.circular(4))),
                          child: TextButton(
                            onPressed: () {
                                roundCount++;
                                print(roundCount);
                            },
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              shape: const RoundedRectangleBorder()),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
//END Increment Round Btn
                    ],
                  ),
//END Round Header
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 6.0),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 3, // You can change this value to adjust the number of columns
                    shrinkWrap: true,
                    children: List.generate(10, (index) {
                      return Center(
                        child: SquareCard(playerName: "Player Name", playerColor: Color((math.Random().nextDouble() * 0xFFFFFF).toInt()).withOpacity(1.0),),
                      );
                    }),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SquareCard extends StatelessWidget {
  final String playerName;
  final Color playerColor;

  SquareCard({Key? key, required this.playerName, required this.playerColor}) : super(key: key);
  Color themeColor = const Color.fromARGB(255, 93, 143, 235); //put in provider

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
          ),
          color: const Color.fromARGB(255, 28, 26, 75),
          elevation: 3,
          margin: const EdgeInsets.all(8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: const BorderRadius.all(Radius.circular(4))),
                  child: const Text(
                    '1000',
                    style: TextStyle(
                      fontSize: 22,
                      fontFamily: 'Wolfskin',
                      color: Colors.white
                    ),
                  ),
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 93, 143, 235),
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder()),
                          child: const Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Expanded(child: Container()),
                    SizedBox(
                      width: 40,
                      height: 40,
                      child: Container(
                        decoration: BoxDecoration(
                          color: themeColor,
                          borderRadius: const BorderRadius.all(Radius.circular(4))),
                        child: TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            shape: const RoundedRectangleBorder()),
                          child: const Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 20,
          child: Container(
            padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: playerColor
            ),
            child: Text(
              playerName,
              style: const TextStyle(
                fontFamily: 'Wolfskin',
                fontSize: 16,
                color: Colors.white
              ),
            ),
          ),
        ),
      ]
    );
  }
}
