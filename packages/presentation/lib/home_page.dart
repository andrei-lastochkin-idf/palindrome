import 'package:flutter/material.dart';
import 'package:domain/palindrome_use_case_impl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final palindromeUseCase = PalindromeUseCaseImpl();

  final myTextController = TextEditingController();

  String _outputText = "";

  void _checkString(String string) {
    setState(() {
      if (string.isEmpty) {
        _outputText = "String is empty";
      } else {
        _outputText = palindromeUseCase.isPalindrome(string) == true
            ? "Palindrome"
            : "Not palindrome";
      }
    });
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
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
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
              child: TextButton.icon(
                icon: const Icon(Icons.check, color: Colors.white),
                label: const Text('Check',
                    style: TextStyle(color: Colors.white, fontSize: 20.0)),
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            side: BorderSide(color: Colors.white)))),
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

  @override
  void dispose() {
    myTextController.dispose();
    super.dispose();
  }
}
