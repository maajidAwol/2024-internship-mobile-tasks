part of 'timer_bloc.dart';



sealed class TimerState extends Equatable {
  TimerState(this.duration);
  final int duration;
  @override
  // TODO: implement props
  List<Object?> get props => [duration];
}

final class TimerInitial extends TimerState {
  TimerInitial(super.duration);
  @override
  String toString() => 'Timer Initial{duartion: $duration} ';
}

final class TimerRunPause extends TimerState {
  TimerRunPause(super.duration);
  @override
  String toString() => 'Timer Run Pause{duartion: $duration} ';
}

final class TimerRunInProgress extends TimerState {
  TimerRunInProgress(super.duration);
  @override
  String toString() => 'Timer Run In Progress{duartion: $duration} ';
}

final class TimerRunComplete extends TimerState {
  TimerRunComplete() :super(0);

}
