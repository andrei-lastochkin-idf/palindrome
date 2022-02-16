import 'package:flutter/material.dart';
import 'utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Palindrome check'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myTextController = TextEditingController();

  String _outputText = "";

  void _checkString(String string) {
    setState(() {
      if (string.isEmpty) {
        _outputText = "String is empty";
      } else {
        var result = Utils.isPalindrome(string) == true ? "Yes" : "No";
        _outputText = "Is palindrome ? " + result;
      }
    });
  }

  @override
  void dispose() {
    myTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        margin: const EdgeInsets.fromLTRB(20, 50, 20, 300),
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.blue[400],
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: <Widget>[
            TextField(
              controller: myTextController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                fillColor: Colors.white,
                focusColor: Colors.white,
                hintText: 'Enter some string',
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              child: Text(
                _outputText,
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: TextButton(
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            side: BorderSide(color: Colors.white)))),
                child: const Text(
                  'Check',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                onPressed: () {
                  _checkString(myTextController.text.trim());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
