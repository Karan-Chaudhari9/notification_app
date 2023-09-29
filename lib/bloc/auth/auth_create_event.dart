abstract class EventState {}

class EventInitial extends EventState {}

class EventAdded extends EventState {}

class EventError extends EventState {
  final String error;

  EventError(this.error);
}
