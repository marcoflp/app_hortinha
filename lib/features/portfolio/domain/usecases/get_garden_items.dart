import '../entities/garden_item.dart';
import '../repositories/portfolio_repository.dart';

class GetGardenItems {
  final PortfolioRepository repository;

  GetGardenItems(this.repository);

  Future<List<GardenItem>> call() async {
    return await repository.getGardenItems();
  }
}
