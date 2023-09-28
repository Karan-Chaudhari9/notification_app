part of 'event_bloc.dart';

abstract class EventEvent extends Equatable {
  const EventEvent();

  @override
  List<Object?> get props => [];
}

class LoadEvents extends EventEvent {

}

class UpdateEvents extends EventEvent {
  UpdateEvents({this.Events = const <Event>[]});

  final List<Event> Events;

  @override
  List<Object?> get props => [Events];
}