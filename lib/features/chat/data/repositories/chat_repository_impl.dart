// implementa o chat repository utilizando o gemini data source

import '../../domain/entities/message.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/gemini_datasource.dart';

class ChatRepositoryImpl implements ChatRepository {
  final GeminiDatasource datasource;

  ChatRepositoryImpl(this.datasource);

  @override
  Future<Message> sendMessage(String message) async {
    final response = await datasource.sendMessage(message);
    return Message(
      text: response,
      isUser: false,
      timestamp: DateTime.now(),
    );
  }
}
