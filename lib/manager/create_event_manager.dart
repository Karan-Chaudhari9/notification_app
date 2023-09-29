import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth/auth_create_event.dart';
import '../bloc/register/register_create_events.dart';

class EventBloc extends Cubit<EventState> {
  final EventFirebaseService _firebaseService = EventFirebaseService();

  EventBloc() : super(EventInitial());

  Future<void> addEvent(Map<String, dynamic> eventData) async {
    try {
      await _firebaseService.addEvent(eventData);
      emit(EventAdded());
    } catch (e) {
      // Handle errors
      emit(EventError(e.toString()));
    }
  }
}
