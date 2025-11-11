import '../../domain/entities/garden_item.dart';
import '../../domain/repositories/portfolio_repository.dart';

class PortfolioRepositoryImpl implements PortfolioRepository {
  @override
  Future<List<GardenItem>> getGardenItems() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return const [
      GardenItem(
        id: '1',
        name: 'Tomates',
        description: 'Tomates orgânicos',
        imageUrl: 'https://via.placeholder.com/150',
      ),
      GardenItem(
        id: '2',
        name: 'Alface',
        description: 'Alface crespa',
        imageUrl: 'https://via.placeholder.com/150',
      ),
    ];
  }
}
