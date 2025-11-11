import '../entities/garden_item.dart';

abstract class PortfolioRepository {
  Future<List<GardenItem>> getGardenItems();
}
