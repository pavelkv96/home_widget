import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_widget/feature/counter/presentation/bloc/counter_bloc.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, state) {
                return state.maybeWhen(
                  orElse: () => const CircularProgressIndicator(),
                  value: (value) {
                    return Text(
                      '$value',
                      style: Theme.of(context).textTheme.headline4,
                    );
                  },
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(const CounterEvent.increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.exposure_plus_1),
          ),
          FloatingActionButton(
            onPressed: () => context.read<CounterBloc>().add(const CounterEvent.decrement()),
            tooltip: 'Decrement',
            child: const Icon(Icons.exposure_minus_1),
          ),
        ],
      ),
    );
  }
}
