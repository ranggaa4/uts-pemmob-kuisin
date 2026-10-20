import '../models/question.dart';

// soal sementara, nanti ditambah lagi
const List<Question> dummyQuestions = [
  Question(
    text: 'Widget yang tidak memiliki state internal disebut...',
    options: [
      'StatelessWidget',
      'StatefulWidget',
      'InheritedWidget',
      'RenderObjectWidget',
    ],
    correctIndex: 0,
  ),
  Question(
    text: 'Method apa yang dipanggil agar Flutter membangun ulang tampilan setelah data berubah?',
    options: ['rebuild()', 'setState()', 'refresh()', 'notify()'],
    correctIndex: 1,
  ),
  Question(
    text: 'Flutter menggunakan bahasa pemrograman apa?',
    options: ['Kotlin', 'Swift', 'Dart', 'JavaScript'],
    correctIndex: 2,
  ),
  Question(
    text: 'Widget untuk menyusun anak-anaknya secara vertikal adalah...',
    options: ['Row', 'Stack', 'ListTile', 'Column'],
    correctIndex: 3,
  ),
  Question(
    text: 'File yang dipakai untuk mendaftarkan aset dan dependency proyek Flutter adalah...',
    options: ['main.dart', 'pubspec.yaml', 'build.gradle', 'README.md'],
    correctIndex: 1,
  ),
];
