import 'package:flutter/material.dart';
import '../../../../core/theme.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  final List<Map<String, String>> _portfolioImages = const [
    {
      'image': 'assets/images/portfolio/horta1.jpg',
      'caption': 'Na lida do tomate! 🍅',
      'likes': '24',
    },
    {
      'image': 'assets/images/portfolio/horta2.jpg', 
      'caption': 'Tomates crescendo lindos na horta dos guri 🍅🍅',
      'likes': '18',
    },
    {
      'image': 'assets/images/portfolio/horta3.jpg',
      'caption': 'Nossa horta vertical! 🌿',
      'likes': '31',
    },
    {
      'image': 'assets/images/portfolio/horta4.jpg',
      'caption': 'Na lida do tomate parte 2 🍅🍅',
      'likes': '27',
    },
    {
      'image': 'assets/images/portfolio/horta5.jpg',
      'caption': 'Nossa plantação de tomate bem caprichada 🍅',
      'likes': '22',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppTheme.lightGreen.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(Icons.eco, color: AppTheme.primaryGreen),
            ),
            const SizedBox(width: 12),
            const Text('Minha Horta'),
          ],
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemCount: _portfolioImages.length,
        itemBuilder: (context, index) {
          final post = _portfolioImages[index];
          return Container(
            margin: const EdgeInsets.only(bottom: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header do post
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppTheme.lightGreen.withOpacity(0.3),
                        child: const Icon(Icons.person, color: AppTheme.primaryGreen),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'minha_horta',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            'Horta doméstica',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Imagem
                Container(
                  width: double.infinity,
                  height: 300,
                  color: AppTheme.lightGreen.withOpacity(0.1),
                  child: Image.asset(
                    post['image']!,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Container(
                      color: AppTheme.lightGreen.withOpacity(0.2),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.eco,
                            size: 48,
                            color: AppTheme.primaryGreen,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Adicione sua imagem aqui:\n${post['image']}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: AppTheme.primaryGreen,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // Ações
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Icon(Icons.favorite_border, size: 24),
                          SizedBox(width: 16),
                          Icon(Icons.chat_bubble_outline, size: 24),
                          SizedBox(width: 16),
                          Icon(Icons.share_outlined, size: 24),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${post['likes']} curtidas',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                          children: [
                            const TextSpan(
                              text: 'minha_horta ',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            TextSpan(text: post['caption']),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}