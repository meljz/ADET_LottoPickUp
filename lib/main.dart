import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(LotteryNumberGenerator());
}

class LotteryNumberGenerator extends StatefulWidget {
  @override
  _LotteryNumberGeneratorState createState() => _LotteryNumberGeneratorState();
}

class _LotteryNumberGeneratorState extends State<LotteryNumberGenerator> {
  List<int> _numbers = [];
  final Random _random = Random();
  
  void _generateNumbers() {
    Set<int> numberSet = {};
    
    while (numberSet.length < 6) {
      int number = _random.nextInt(55) + 1;
      numberSet.add(number);
    }
    
    setState(() {
      _numbers = numberSet.toList()..sort();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Lottery Number Generator",
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurpleAccent,
          title: const Text("Lotto Pick Up | Meljohn Reyes"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Lotto Numbers",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              _numbers.isEmpty
                ? const Text("Press the button to generate numbers")
                : Container(
                    padding: const EdgeInsets.all(20),
                    child: Wrap(
                      spacing: 15,
                      runSpacing: 15,
                      alignment: WrapAlignment.center,
                      children: List.generate(_numbers.length, (index) {
                        return Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.amberAccent,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                _numbers[index].toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
              const SizedBox(height: 40),
              FloatingActionButton.extended(
                onPressed: _generateNumbers,
                label: const Text("Generate Numbers"),
                icon: const Icon(Icons.refresh),
                backgroundColor: Colors.amberAccent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}