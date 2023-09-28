
import 'package:notification_app/model/event_details_model.dart';

abstract class BaseEventRepository {
  Stream<List<Event>> getAllEvents();
}