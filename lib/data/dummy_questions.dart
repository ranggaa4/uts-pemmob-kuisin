import '../models/question.dart';

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
  Question(
    text: 'Widget yang dipakai untuk menumpuk beberapa widget di atas satu sama lain adalah...',
    options: ['Column', 'Stack', 'Expanded', 'Wrap'],
    correctIndex: 1,
  ),
  Question(
    text: 'Widget yang cocok untuk menampilkan daftar item yang bisa di-scroll adalah...',
    options: ['Container', 'SizedBox', 'ListView', 'Center'],
    correctIndex: 2,
  ),
  Question(
    text: 'Perintah untuk menjalankan aplikasi Flutter lewat terminal adalah...',
    options: ['flutter start', 'flutter launch', 'flutter go', 'flutter run'],
    correctIndex: 3,
  ),
  Question(
    text: 'Fitur yang membuat perubahan kode langsung terlihat tanpa menjalankan ulang aplikasi dari awal disebut...',
    options: ['Hot Reload', 'Hot Spot', 'Quick Build', 'Live Share'],
    correctIndex: 0,
  ),
  Question(
    text: 'Widget yang sering dipakai untuk memberi jarak kosong dengan ukuran tertentu adalah...',
    options: ['Opacity', 'Align', 'SizedBox', 'Visibility'],
    correctIndex: 2,
  ),
];
