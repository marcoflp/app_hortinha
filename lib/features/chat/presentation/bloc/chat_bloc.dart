import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/message.dart';
import '../../domain/usecases/send_message.dart';
import 'chat_event.dart';
import 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  final SendMessage sendMessage;
  final List<Message> _messages = [];

  ChatBloc({required this.sendMessage}) : super(ChatInitial()) {
    on<SendMessageEvent>(_onSendMessage);
  }

  Future<void> _onSendMessage(SendMessageEvent event, Emitter<ChatState> emit) async {
    print('recebeu mensagem: ${event.message}');
    
    final userMessage = Message(
      text: event.message,
      isUser: true,
      timestamp: DateTime.now(),
    );
    _messages.add(userMessage);
    emit(ChatLoaded(List.from(_messages)));
    print('mensagem do usuário adicionada');

    try {
      print('chamando api');
      final response = await sendMessage(event.message);
      print('resposta recebida: ${response.text}');
      _messages.add(response);
      emit(ChatLoaded(List.from(_messages)));
    } catch (e) {
      print('erro: $e');
      emit(ChatError('Erro: $e'));
      emit(ChatLoaded(List.from(_messages)));
    }
  }
}
