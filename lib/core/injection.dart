import '../features/chat/data/datasources/gemini_datasource.dart';
import '../features/chat/data/repositories/chat_repository_impl.dart';
import '../features/chat/domain/usecases/send_message.dart';
import '../features/chat/presentation/bloc/chat_bloc.dart';
import '../features/portfolio/data/repositories/portfolio_repository_impl.dart';
import '../features/portfolio/domain/usecases/get_garden_items.dart';
import '../features/portfolio/presentation/bloc/portfolio_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Injection {
  static final String geminiApiKey = dotenv.env['GEMINI_API_KEY'] ?? '';

  static ChatBloc chatBloc() {
    final datasource = GeminiDatasource(geminiApiKey);
    final repository = ChatRepositoryImpl(datasource);
    final usecase = SendMessage(repository);
    return ChatBloc(sendMessage: usecase);
  }

  static PortfolioBloc portfolioBloc() {
    final repository = PortfolioRepositoryImpl();
    final usecase = GetGardenItems(repository);
    return PortfolioBloc(getGardenItems: usecase);
  }
}
