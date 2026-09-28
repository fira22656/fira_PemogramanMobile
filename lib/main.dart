import 'package:flutter/material.dart';

void main() {
  runApp(const PortofolioApp());
}

class PortofolioApp extends StatelessWidget {
  const PortofolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portofolio Fira Salimah',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0F172A),
        colorScheme: const ColorScheme.dark(
          primary: Colors.indigoAccent,
          secondary: Colors.purpleAccent,
          surface: Color(0xFF1E293B),
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0F172A),
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const ProfilPage(),
    );
  }
}

// ==================== HALAMAN 1: PROFIL ====================
class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.white10),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image.asset(
                      'assets/foto.jpg',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          width: 100,
                          height: 100,
                          color: Colors.indigoAccent,
                          child: const Icon(Icons.person, size: 50, color: Colors.white),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 14),
                  const Text(
                    'Fira Salimah',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'NIM: 253140707111156',
                    style: TextStyle(color: Colors.indigoAccent, fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Mahasiswi Teknologi Informasi yang berfokus pada pengembangan aplikasi mobile Flutter & UI/UX Design.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white70, fontSize: 13),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            // Tombol Lanjut ke Halaman Berikutnya
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                  // Berpindah ke Halaman Portofolio
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PortofolioPage()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Lanjut ke Portofolio', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward, color: Colors.white),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== HALAMAN 2: PORTOFOLIO ====================
class PortofolioPage extends StatelessWidget {
  const PortofolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            'Klik Kartu Proyek untuk Detail:',
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 12),

          // Kartu Proyek 1 (Klik untuk Buka Detail)
          _buildProjectItem(
            context,
            title: 'E-Commerce GalonKu',
            category: 'Aplikasi Pemesanan Galon',
            desc: 'Sistem pemesanan air galon isi ulang berbasis lokasi dan pengantaran cepat.',
            icon: Icons.local_drink,
            color: Colors.cyanAccent,
          ),
          const SizedBox(height: 12),

          // Kartu Proyek 2 (Klik untuk Buka Detail)
          _buildProjectItem(
            context,
            title: 'Pencari Beasiswa ID',
            category: 'Portal Informasi Pendidikan',
            desc: 'Platform pencari informasi beasiswa terintegrasi untuk mahasiswa.',
            icon: Icons.school,
            color: Colors.purpleAccent,
          ),

          const SizedBox(height: 30),

          // Tombol Lanjut ke Hitung IPK
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purpleAccent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const KalkulatorIpkPage()),
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text('Lanjut ke Hitung IPK', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward, color: Colors.white),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectItem(
    BuildContext context, {
    required String title,
    required String category,
    required String desc,
    required IconData icon,
    required Color color,
  }) {
    return InkWell(
      onTap: () {
        // Klik kartu untuk menuju ke Halaman Detail Proyek
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailProyekPage(title: title, category: category, desc: desc, icon: icon, color: color),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.white10),
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withValues(alpha: 0.2),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  Text(category, style: TextStyle(color: color, fontSize: 12)),
                ],
              ),
            ),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}

// ==================== HALAMAN DETAIL PROYEK ====================
class DetailProyekPage extends StatelessWidget {
  final String title;
  final String category;
  final String desc;
  final IconData icon;
  final Color color;

  const DetailProyekPage({
    super.key,
    required this.title,
    required this.category,
    required this.desc,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(icon, size: 80, color: color),
            const SizedBox(height: 16),
            Text(category, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            Text(desc, textAlign: TextAlign.center, style: const TextStyle(fontSize: 15, height: 1.5)),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 48,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Kembali ke Portofolio'),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ==================== HALAMAN 3: KALKULATOR IPK ====================
class KalkulatorIpkPage extends StatefulWidget {
  const KalkulatorIpkPage({super.key});

  @override
  State<KalkulatorIpkPage> createState() => _KalkulatorIpkPageState();
}

class _KalkulatorIpkPageState extends State<KalkulatorIpkPage> {
  double _nilai1 = 4.0;
  double _nilai2 = 4.0;

  double get _ipk => ((_nilai1 * 3) + (_nilai2 * 3)) / 6.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
    
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text('Simulasi IPK Fira', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Pemrograman Mobile'),
                      DropdownButton<double>(
                        value: _nilai1,
                        items: const [
                          DropdownMenuItem(value: 4.0, child: Text('A')),
                          DropdownMenuItem(value: 3.5, child: Text('B+')),
                          DropdownMenuItem(value: 3.0, child: Text('B')),
                        ],
                        onChanged: (v) => setState(() => _nilai1 = v!),
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('UI/UX Design'),
                      DropdownButton<double>(
                        value: _nilai2,
                        items: const [
                          DropdownMenuItem(value: 4.0, child: Text('A')),
                          DropdownMenuItem(value: 3.5, child: Text('B+')),
                          DropdownMenuItem(value: 3.0, child: Text('B')),
                        ],
                        onChanged: (v) => setState(() => _nilai2 = v!),
                      )
                    ],
                  ),
                  const Divider(),
                  Text('Hasil IPK: ${_ipk.toStringAsFixed(2)}', style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.tealAccent)),
                ],
              ),
            ),
            const Spacer(),

            // Tombol Lanjut ke Jadwal Kuliah
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.tealAccent,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const JadwalPage()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Lanjut ke Jadwal Kuliah', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    SizedBox(width: 8),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ==================== HALAMAN 4: JADWAL KULIAH ====================
class JadwalPage extends StatelessWidget {
  const JadwalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              color: const Color(0xFF1E293B),
              child: const ListTile(
                leading: Icon(Icons.calendar_today, color: Colors.indigoAccent),
                title: Text('Senin - Pemrograman Mobile'),
                subtitle: Text('08:00 - 10:30 | Lab Komputer 3'),
              ),
            ),
            Card(
              color: const Color(0xFF1E293B),
              child: const ListTile(
                leading: Icon(Icons.calendar_today, color: Colors.pinkAccent),
                title: Text('Selasa - UI/UX Design'),
                subtitle: Text('09:30 - 12:00 | Studio Design'),
              ),
            ),
            const Spacer(),

            // Tombol Selesai (Kembali ke Awal)
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigoAccent,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                onPressed: () {
                  // Kembali ke halaman pertama paling awal (Profil)
                  Navigator.popUntil(context, (route) => route.isFirst);
                },
                child: const Text('Selesai & Kembali ke Profil', style: TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}