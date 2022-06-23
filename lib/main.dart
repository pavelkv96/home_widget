import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_widget/di/injection.dart';
import 'package:home_widget/feature/counter/presentation/bloc/counter_bloc.dart';
import 'package:home_widget/feature/counter/presentation/screen/counter_screen.dart';

Future<void> main() async {
  await runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await configureDI();
      BlocOverrides.runZoned(
        () => runApp(const MyApp()),
      );
    },
    (error, stack) {
      if (kDebugMode) print(error);
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider<CounterBloc>(
        create: (context) => locator<CounterBloc>()..add(const CounterEvent.fetchCurrentCount()),
        child: const CounterScreen(),
      ),
    );
  }
}
