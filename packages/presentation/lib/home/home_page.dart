import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _bloc = context.read<HomeBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Palindrome check'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Container(
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
                  controller: _textController,
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
                  child: _outputText(context, state),
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
                      assert(_textController.text.trim().isNotEmpty);
                      _bloc.add(CheckStringEvent(_textController.text));
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  _outputText(context, state) {
    if (state is HomeInitialState) {
      return Text(
        state.initialString,
        style: const TextStyle(color: Colors.white, fontSize: 30),
      );
    }

    if (state is HomeLoadedState) {
      return Text(
        state.isPalindrome == true ? "Palindrome" : "Not palindrome",
        style: const TextStyle(color: Colors.white, fontSize: 30),
      );
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
}
