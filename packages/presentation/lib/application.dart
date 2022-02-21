import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:domain/palindrome_use_case_impl.dart';
import 'home/bloc/home_bloc.dart';
import 'home/home_page.dart';

class PalindromeApp extends StatelessWidget {
  const PalindromeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<HomeBloc>(
          create: (context) => HomeBloc(useCase: PalindromeUseCaseImpl())
            ..add(HomeInitialEvent()),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}
