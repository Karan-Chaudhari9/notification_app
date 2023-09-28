part of 'event_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object?> get props => [];
}

class LoadProducts extends ProductEvent {

}

class UpdateProducts extends ProductEvent {
  UpdateProducts({this.products = const <Event>[]});

  final List<Event> products;

  @override
  List<Object?> get props => [products];
}