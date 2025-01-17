import 'dart:ui';

import 'difficulty.dart';

class Quiz {
  final String imageUrl;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final QuizDifficulty diff;
  final int count;

  Quiz(
      {required this.imageUrl,
      required this.title,
      required this.subtitle,
      required this.onTap,
      required this.diff,
      required this.count});
}
