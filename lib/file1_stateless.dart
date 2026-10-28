import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stateless Widget',
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const DaftarMahasiswaPage(),
    );
  }
}

//Kartu Mahasiswa
class KartuMahasiswa extends StatelessWidget {
  final String nama;
  final String nim;
  final String prodi;

  const KartuMahasiswa({
    super.key,
    required this.nama,
    required this.nim,
    required this.prodi,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ProfilPage(nama: nama, nim: nim, prodi: prodi),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              const CircleAvatar(
                radius: 28,
                child: Icon(Icons.school, size: 28),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nama,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text('NIM: $nim'),
                    Text('Prodi: $prodi'),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right),
            ],
          ),
        ),
      ),
    );
  }
}

//Halaman yang menampilkan 3 kartu di dalam Column
class DaftarMahasiswaPage extends StatelessWidget {
  const DaftarMahasiswaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Mahasiswa'),
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
      ),
      body: Column(
        children: const [
          SizedBox(height: 8),
          KartuMahasiswa(
            nama: 'Ahmad Andi Alfiansyah',
            nim: '3012410053',
            prodi: 'Informatika',
          ),
          KartuMahasiswa(
            nama: 'Carl Johnson',
            nim: '3012410054',
            prodi: 'Sistem Informasi',
          ),
          KartuMahasiswa(
            nama: 'Mikasa Ackerman',
            nim: '3012410055',
            prodi: 'Teknik Komputer',
          ),
        ],
      ),
    );
  }
}

//Halaman profil
class ProfilPage extends StatelessWidget {
  final String nama;
  final String nim;
  final String prodi;

  const ProfilPage({
    super.key,
    required this.nama,
    required this.nim,
    required this.prodi,
  });

  Widget _ikonKontak(IconData icon, Color warna) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: warna.withOpacity(0.15),
        shape: BoxShape.circle,
        border: Border.all(color: warna, width: 1.5),
      ),
      child: Icon(icon, color: warna),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil'),
      backgroundColor: Colors.indigo,
      foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Foto profil
            const CircleAvatar(
              radius: 60,
              backgroundColor: Colors.indigo,
              child: Icon(Icons.person, size: 70, color: Colors.white),
            ),
            const SizedBox(height: 16),
            Text(
              nama,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            Text('$nim • $prodi'),
            const SizedBox(height: 24),
            // Satu baris ikon kontak
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ikonKontak(Icons.email, Colors.red),
                const SizedBox(width: 16),
                _ikonKontak(Icons.phone, Colors.green),
                const SizedBox(width: 16),
                _ikonKontak(Icons.chat, Colors.blue),
                const SizedBox(width: 16),
                _ikonKontak(Icons.location_on, Colors.orange),
              ],
            ),
          ],
        ),
      ),
    );
  }
}