import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/hasil_kuis.dart';
import '../services/score_storage.dart';
import '../theme/app_theme.dart';
import '../utils/responsive.dart';
import '../widgets/riwayat_tile.dart';
import '../widgets/theme_toggle_button.dart';

class RiwayatScreen extends StatefulWidget {
  const RiwayatScreen({super.key});

  @override
  State<RiwayatScreen> createState() => _RiwayatScreenState();
}

class _RiwayatScreenState extends State<RiwayatScreen> {
  late final Future<List<HasilKuis>> _data;

  @override
  void initState() {
    super.initState();
    _data = context.read<ScoreStorage>().ambilTerbaik();
  }

  @override
  Widget build(BuildContext context) {
    final u = context.unit;
    final w = context.warna;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Skor Tertinggi',
          style: TextStyle(
            fontSize: u * 0.045,
            fontWeight: FontWeight.w700,
            color: w.judul,
          ),
        ),
        actions: const [ThemeToggleButton()],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(maxWidth: context.lebarKonten),
            child: FutureBuilder<List<HasilKuis>>(
              future: _data,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return Center(
                    child: CircularProgressIndicator(color: w.accent),
                  );
                }

                final daftar = snapshot.data ?? [];
                if (daftar.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: EdgeInsets.all(u * 0.08),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.emoji_events_outlined,
                            size: u * 0.2,
                            color: w.textMuted,
                          ),
                          SizedBox(height: u * 0.04),
                          Text(
                            'Belum ada yang main.\nJadi yang pertama yuk!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: u * 0.04,
                              color: w.textMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }

                return ListView.builder(
                  padding: EdgeInsets.all(u * 0.06),
                  itemCount: daftar.length,
                  itemBuilder: (context, i) =>
                      RiwayatTile(peringkat: i + 1, hasil: daftar[i]),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
