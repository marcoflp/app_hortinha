import 'package:equatable/equatable.dart';
import '../../domain/entities/garden_item.dart';

abstract class PortfolioState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PortfolioInitial extends PortfolioState {}

class PortfolioLoading extends PortfolioState {}

class PortfolioLoaded extends PortfolioState {
  final List<GardenItem> items;

  PortfolioLoaded(this.items);

  @override
  List<Object?> get props => [items];
}

class PortfolioError extends PortfolioState {
  final String message;

  PortfolioError(this.message);

  @override
  List<Object?> get props => [message];
}
