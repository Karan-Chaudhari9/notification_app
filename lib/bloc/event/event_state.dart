part of 'event_bloc.dart';

abstract class ProductState extends Equatable {
  const ProductState();
}

class ProductLoading extends ProductState {
  @override
  List<Object> get props => [];
}

class ProductLoaded extends ProductState {
  ProductLoaded({this.products = const <Event>[]});

  final List<Event> products;

  @override
  List<Object?> get props => [products];
}