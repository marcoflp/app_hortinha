import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/usecases/get_garden_items.dart';
import 'portfolio_event.dart';
import 'portfolio_state.dart';

class PortfolioBloc extends Bloc<PortfolioEvent, PortfolioState> {
  final GetGardenItems getGardenItems;

  PortfolioBloc({required this.getGardenItems}) : super(PortfolioInitial()) {
    on<LoadPortfolioEvent>(_onLoadPortfolio);
  }

  Future<void> _onLoadPortfolio(LoadPortfolioEvent event, Emitter<PortfolioState> emit) async {
    emit(PortfolioLoading());
    try {
      final items = await getGardenItems();
      emit(PortfolioLoaded(items));
    } catch (e) {
      emit(PortfolioError('Erro: $e'));
    }
  }
}
