import 'package:flutter/material.dart';
import 'package:domain/palindrome_usecase.dart';
import 'package:presentation/screen/home/bloc/home_bloc.dart';
import 'package:presentation/screen/home/bloc/home_data.dart';
import 'package:presentation/screen/home/stream_palindrome_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _bloc = HomeBloc(PalindromeUseCase());

  @override
  void initState() {
    super.initState();
    _bloc.initState();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Palindrome check'),
      ),
      body: StreamPalindromeContent(
        dataStream: _bloc.dataStream,
        children: (blocData) {
          if (blocData.isLoading) {
            return _buildLoadingState();
          }
          if (blocData.data is HomeData) {
            return _buildResultState(blocData.data as HomeData);
          }
        },
      ),
    );
  }

  _buildLoadingState() => const Center(
        child: CircularProgressIndicator(),
      );

  _buildResultState(HomeData screenData) => Container(
        margin: const EdgeInsets.fromLTRB(20, 50, 20, 300),
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 0),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue[400],
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Column(
          children: <Widget>[
            TextField(
              onChanged: _bloc.setPalindromeString,
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
                screenData.isPalindrome == true
                    ? "Palindrome"
                    : "Not palindrome",
                style: const TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 100),
              child: TextButton.icon(
                icon: const Icon(Icons.check, color: Colors.white),
                label: const Text(
                  'Check',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                onPressed: () {
                  _bloc.checkPalindrome();
                },
              ),
            ),
          ],
        ),
      );
}
