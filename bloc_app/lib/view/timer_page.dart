import 'package:bloc_app/bloc/timer_bloc.dart';
import 'package:bloc_app/ticker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerPage extends StatelessWidget {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => TimerBloc(ticker: Ticker()),
      child: TimerView(),
    );
  }
}

class TimerView extends StatelessWidget {
  const TimerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('bloc timer')),
      body: Stack(children: [
        Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 100.0),
              child: Center(
                child: TimerText(),
              ),
            )
          ],
        )
      ]),
    );
  }
}

class TimerText extends StatelessWidget {
  const TimerText({super.key});

  @override
  Widget build(BuildContext context) {
    final duration = context.select((TimerBloc bloc) => bloc.state.duration);
    final minutesStr =
        ((duration / 60) % 60).floor().toString().padLeft(2, '00');
    final secondsStr = (duration % 60).floor.toString().padLeft(2, '0');
    return Text(
      '$minutesStr:$secondsStr',
      style: Theme.of(context).textTheme.headlineLarge,
    );
  }
}

class Actions extends StatelessWidget {
  const Actions({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimerBloc, TimerState>(
        buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ...switch (state) {
                TimerInitial() => [
                    FloatingActionButton(
                      child: const Icon(Icons.play_arrow),
                      onPressed: () => context.read<TimerBloc>().add(
                            TimerStarted(duration: state.duration),
                          ),
                    ),
                  ],
                TimerRunInProgress() => [
                    FloatingActionButton(
                      child: const Icon(Icons.pause),
                      onPressed: () =>
                          context.read<TimerBloc>().add(const TimerPaused()),
                    ),
                    FloatingActionButton(
                      child: const Icon(Icons.replay),
                      onPressed: () =>
                          context.read<TimerBloc>().add(const TimerReset()),
                    ),
                  ],
              TimerRunPause() => [
                 FloatingActionButton(
                      child: const Icon(Icons.play_arrow),
                      onPressed: () =>
                          context.read<TimerBloc>().add(const TimerResumed()),
                    ),
                    FloatingActionButton(
                      child: const Icon(Icons.replay),
                      onPressed: () =>
                          context.read<TimerBloc>().add(const TimerReset()),
                    ),
              ],
              TimerRunComplete() => [
                FloatingActionButton(
                  child: const Icon(Icons.replay),
                  onPressed: () => context.read<TimerBloc>().add(const TimerReset(),),)
              ]
                // TODO: Handle this case.
                // TimerState() => throw UnimplementedError(),
              }
            ],
          );
        });
  }
}
