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
    final prompt = '''
Você é um especialista em jardinagem e hortas domésticas. Responda de forma simples e direta, SEM usar markdown, asteriscos, hashtags ou formatação especial.

Responda em texto simples, como se estivesse conversando pessoalmente. Use apenas pontos para separar ideias quando necessário.

Pergunta: $message''';
    final response = await model.generateContent([Content.text(prompt)]);
    String cleanText = response.text ?? 'Erro ao processar';
    
    // Remove formatação markdown
    cleanText = cleanText.replaceAll(RegExp(r'\*+'), '');
    cleanText = cleanText.replaceAll(RegExp(r'#+'), '');
    cleanText = cleanText.replaceAll(RegExp(r'_+'), '');
    cleanText = cleanText.replaceAll(RegExp(r'`+'), '');
    
    return cleanText.trim();
  }
}
