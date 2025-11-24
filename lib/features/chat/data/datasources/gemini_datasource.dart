// fala c a api gemini

import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiDatasource {
  final GenerativeModel model;
  final String _apiKey;

  GeminiDatasource(String apiKey)
      : _apiKey = apiKey,
        model = GenerativeModel(
          model: 'gemini-2.5-flash',
          apiKey: apiKey,
        );

  Future<String> sendMessage(String message) async {
    try {
      print('GeminiDatasource: Enviando mensagem para API');
      print('GeminiDatasource: API Key presente: ${_apiKey.isNotEmpty}');
      
      if (_apiKey.isEmpty) {
        print('GeminiDatasource: API Key não configurada');
        return 'Desculpe, o chat não está configurado. Verifique se a API Key do Gemini foi adicionada no arquivo .env';
      }
      
      final prompt = '''
Você é um especialista em jardinagem e hortas domésticas. Responda de forma simples e direta, mas seja gentil, SEM usar markdown, asteriscos, hashtags ou formatação especial.

Responda em texto simples, como se estivesse conversando pessoalmente. Use apenas pontos para separar ideias quando necessário.

Pergunta: $message''';
      
      final response = await model.generateContent([Content.text(prompt)]);
      print('GeminiDatasource: Resposta recebida');
      
      String cleanText = response.text ?? 'Erro ao processar resposta';
      
      // Remove formatação markdown
      cleanText = cleanText.replaceAll(RegExp(r'\*+'), '');
      cleanText = cleanText.replaceAll(RegExp(r'#+'), '');
      cleanText = cleanText.replaceAll(RegExp(r'_+'), '');
      cleanText = cleanText.replaceAll(RegExp(r'`+'), '');
      
      return cleanText.trim();
    } catch (e) {
      print('GeminiDatasource: Erro na API: $e');
      return 'Desculpe, não consegui processar sua mensagem no momento. Verifique sua conexão com a internet e tente novamente.';
    }
  }

  String get apiKey => _apiKey;
}