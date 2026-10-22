import 'dart:math';

class Question {
  final String text;
  final List<String> options;
  final int correctIndex;

  const Question({
    required this.text,
    required this.options,
    required this.correctIndex,
  });

  
  
  Question acak(Random rnd) {
    final urutan = List.generate(options.length, (i) => i)..shuffle(rnd);
    return Question(
      text: text,
      options: [for (final i in urutan) options[i]],
      correctIndex: urutan.indexOf(correctIndex),
    );
  }
}
