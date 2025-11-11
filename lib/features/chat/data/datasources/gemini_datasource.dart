// fala c a api gemini

import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiDatasource {
  final GenerativeModel model;

  GeminiDatasource(String apiKey)
      : model = GenerativeModel(
          model: 'gemini-2.5-flash',
          apiKey: apiKey,
        );

  Future<String> sendMessage(String message) async {
    print('Enviando para Gemini: $message');
    final prompt = 'Você é um especialista em hortas. Responda: $message';
    final response = await model.generateContent([Content.text(prompt)]);
    print('Resposta do Gemini: ${response.text}');
    return response.text ?? 'Erro ao processar';
  }
}
