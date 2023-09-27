import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:notification_app/model/event_details_model.dart';
import 'package:notification_app/repository/event_repository.dart';
import 'package:equatable/equatable.dart';

part 'event_state.dart';
part 'event_event.dart';

class EventBloc extends Bloc<EventEvent, EventState> {
  EventBloc({required EventRepository eventRepository}) : _EventRepository = eventRepository, super(EventLoading()) {
    on<LoadEvents>(_onLoadEvents);
    on<UpdateEvents>(_onUpdateEvents);
  }

  final EventRepository _EventRepository;
  StreamSubscription? _EventSubscription;

  void _onLoadEvents(LoadEvents event, Emitter<EventState> emit) {
    _EventSubscription?.cancel();
    _EventSubscription = _EventRepository.getAllEvents().listen((Events) {
      add(UpdateEvents(Events: Events));
    });
  }

  void _onUpdateEvents(UpdateEvents event, Emitter<EventState> emit) {
    emit(EventLoaded(Events: event.Events));
  }
}