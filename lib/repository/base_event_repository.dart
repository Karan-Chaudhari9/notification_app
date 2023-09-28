
import 'package:notification_app/model/event_details_model.dart';

abstract class BaseProductRepository {
  Stream<List<Event>> getAllEvents();
}