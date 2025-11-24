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
    print('ChatBloc: Recebendo mensagem: ${event.message}');
    
    final userMessage = Message(
      text: event.message,
      isUser: true,
      timestamp: DateTime.now(),
    );
    _messages.add(userMessage);
    print('ChatBloc: Mensagem do usuário adicionada');
    emit(ChatLoaded(List.from(_messages), isLoading: true));
    print('ChatBloc: Estado loading emitido');

    try {
      print('ChatBloc: Chamando usecase');
      final response = await sendMessage(event.message);
      print('ChatBloc: Resposta recebida: ${response.text}');
      _messages.add(response);
      emit(ChatLoaded(List.from(_messages)));
      print('ChatBloc: Estado final emitido');
    } catch (e) {
      print('ChatBloc: Erro: $e');
      final errorMessage = Message(
        text: 'Desculpe, ocorreu um erro. Verifique sua conexão e tente novamente.',
        isUser: false,
        timestamp: DateTime.now(),
      );
      _messages.add(errorMessage);
      emit(ChatLoaded(List.from(_messages)));
    }
  }
}
