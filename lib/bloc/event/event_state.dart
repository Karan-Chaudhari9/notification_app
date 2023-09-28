part of 'event_bloc.dart';

abstract class EventState extends Equatable {
  const EventState();
}

class EventLoading extends EventState {
  @override
  List<Object> get props => [];
}

class EventLoaded extends EventState {
  EventLoaded({this.Events = const <Event>[]});

  final List<Event> Events;

  @override
  List<Object?> get props => [Events];
}