import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// MODEL DATA PROFIL PEMBUAT
class ProfilMahasiswa {
  final String nama;
  final String nim;
  final String kelas;

  const ProfilMahasiswa({
    required this.nama,
    required this.nim,
    required this.kelas,
  });
}

// OBJECT PROFIL: GANTI DENGAN DATA DIRIMU SENDIRI
const ProfilMahasiswa profilPembuat = ProfilMahasiswa(
  nama: 'Ivander Risq Azmi',
  nim: '202432057',
  kelas: 'PAB A',
);

// MODEL DATA TANAMAN
class Tanaman {
  final String nama;
  final int intervalSiram;
  final String kebutuhanCahaya;
  final double tinggiCm;
  final bool mudahDirawat;

  const Tanaman({
    required this.nama,
    required this.intervalSiram,
    required this.kebutuhanCahaya,
    required this.tinggiCm,
    required this.mudahDirawat,
  });
}

// DATA TANAMAN YANG DITAMPILKAN
const List<Tanaman> daftarTanaman = [
  Tanaman(
    nama: 'Lidah Mertua',
    intervalSiram: 7,
    kebutuhanCahaya: 'Cahaya tidak langsung',
    tinggiCm: 30.5,
    mudahDirawat: true,
  ),
  Tanaman(
    nama: 'Sirih Gading',
    intervalSiram: 4,
    kebutuhanCahaya: 'Cahaya terang tidak langsung',
    tinggiCm: 25.0,
    mudahDirawat: true,
  ),
  Tanaman(
    nama: 'Monstera',
    intervalSiram: 5,
    kebutuhanCahaya: 'Cahaya terang tidak langsung',
    tinggiCm: 45.5,
    mudahDirawat: false,
  ),
];

// APLIKASI UTAMA
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PlantCare',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF326B50),
        ),
        scaffoldBackgroundColor: const Color(0xFFF3F6F0),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF326B50),
          foregroundColor: Colors.white,
          centerTitle: false,
        ),
      ),
      home: const HalamanUtama(),
    );
  }
}

// HALAMAN UTAMA
class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.local_florist),
            SizedBox(width: 10),
            Text('PlantCare'),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Rawat Tanamanmu!',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF244C38),
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Panduan sederhana untuk tanaman hias di rumah.',
            style: TextStyle(fontSize: 14),
          ),
          const SizedBox(height: 20),

          // KARTU PROFIL PEMBUAT
          Card(
            elevation: 1,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Container(
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: const Color(0xFFDCEBDD),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.person,
                      size: 30,
                      color: Color(0xFF326B50),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Dibuat oleh',
                          style: TextStyle(fontSize: 12),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          profilPembuat.nama,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          '${profilPembuat.nim} • ${profilPembuat.kelas}',
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),
          const Text(
            'Pilihan Tanaman',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          // DAFTAR KARTU TANAMAN
          ...daftarTanaman.map(
            (tanaman) => TanamanCard(tanaman: tanaman),
          ),

          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xFFDCEBDD),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  Icons.eco,
                  color: Color(0xFF326B50),
                  size: 28,
                ),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Tips: Periksa kondisi tanah sebelum menyiram. '
                    'Kebutuhan air setiap tanaman bisa berbeda.',
                    style: TextStyle(fontSize: 13),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

// CUSTOM WIDGET KARTU TANAMAN
class TanamanCard extends StatelessWidget {
  final Tanaman tanaman;

  const TanamanCard({
    super.key,
    required this.tanaman,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 14),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: const Color(0xFFDCEBDD),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Icon(
                    Icons.local_florist,
                    size: 27,
                    color: Color(0xFF326B50),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tanaman.nama,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        tanaman.mudahDirawat
                            ? 'Mudah dirawat'
                            : 'Perlu perhatian ekstra',
                        style: TextStyle(
                          fontSize: 12,
                          color: tanaman.mudahDirawat
                              ? const Color(0xFF326B50)
                              : Colors.brown,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                const Icon(
                  Icons.water_drop_outlined,
                  size: 20,
                  color: Color(0xFF326B50),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Penyiraman: ${tanaman.intervalSiram} hari sekali',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.wb_sunny_outlined,
                  size: 20,
                  color: Color(0xFF326B50),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Cahaya: ${tanaman.kebutuhanCahaya}',
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Row(
              children: [
                const Icon(
                  Icons.straighten,
                  size: 20,
                  color: Color(0xFF326B50),
                ),
                const SizedBox(width: 8),
                Text(
                  'Tinggi contoh: ${tanaman.tinggiCm} cm',
                ),
              ],
            ),

            const SizedBox(height: 14),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        'Tips ${tanaman.nama}: periksa tanah '
                        'sebelum menyiram tanaman.',
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.lightbulb_outline),
                label: const Text('Lihat Tips Perawatan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}