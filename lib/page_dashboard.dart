import 'package:flutter/material.dart';
import 'shared_sidebar.dart';

class PageDashboard extends StatelessWidget {
  const PageDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Row(
        children: [
          const SharedSidebar(activeRoute: '/dashboard'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header Bar Atas (Search & Notification)
                  _buildHeaderBar(context, 'Dashboard'),
                  const SizedBox(height: 24),

                  // Banner Utama Welcoming
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(32),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF1E56B9), Color(0xFF3B82F6)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('SELAMAT DATANG KEMBALI', style: TextStyle(color: Colors.white70, fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.1)),
                        const SizedBox(height: 6),
                        const Text('Bahlil Lahadalia 👋', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 6),
                        const Text('Semester 2 • Teknik Informatika • Angkatan 2025', style: TextStyle(color: Colors.white70, fontSize: 14)),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFF59E0B),
                            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          onPressed: () {},
                          child: const Text('Lihat Jadwal Hari Ini →', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // 4 Summary Statistik Row
                  Row(
                    children: [
                      _buildStatCard('Mata Kuliah Aktif', '2', '▲ Semester 2', Colors.blue, Icons.menu_book_rounded),
                      const SizedBox(width: 16),
                      _buildStatCard('Tugas Pending', '4', '2 deadline hari ini', Colors.orange, Icons.assignment_late_rounded),
                      const SizedBox(width: 16),
                      _buildStatCard('Rata-rata Presensi', '91%', '▲ Aman', Colors.green, Icons.check_circle_rounded),
                      const SizedBox(width: 16),
                      _buildStatCard('Progres Skripsi', '0%', 'Belum tersedia', Colors.amber, Icons.school_rounded),
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Dua Kolom Komponen Utama
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Sisi Kiri (Flex 3) - Jadwal dan Nilai
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            _buildJadwalSection(),
                            const SizedBox(height: 24),
                            _buildNilaiSection(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      // Sisi Kanan (Flex 2) - Pengumuman, Progres, Layanan Cepat, Kegiatan
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            _buildPengumumanSection(),
                            const SizedBox(height: 24),
                            _buildProgresStudiCard(),
                            const SizedBox(height: 24),
                            _buildLayananCepatCard(),
                            const SizedBox(height: 24),
                            _buildKegiatanMendatangCard(),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeaderBar(BuildContext context, String currentPath) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('BERANDA / ${currentPath.toUpperCase()}', style: const TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text(currentPath, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
          ],
        ),
        Row(
          children: [
            Container(
              width: 300,
              height: 40,
              decoration: BoxDecoration(color: const Color(0xFFE2E8F0), borderRadius: BorderRadius.circular(20)),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Cari layanan...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey, size: 18),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 11),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Stack(
              children: [
                IconButton(icon: const Icon(Icons.notifications_none_rounded, color: Colors.blueGrey, size: 26), onPressed: () {}),
                Positioned(
                  right: 6,
                  top: 6,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(color: Colors.orange, shape: BoxShape.circle),
                    child: const Text('2', style: TextStyle(color: Colors.white, fontSize: 8, fontWeight: FontWeight.bold)),
                  ),
                )
              ],
            ),
            const SizedBox(width: 12),
            const CircleAvatar(radius: 18, backgroundColor: Color(0xFF1E40AF), child: Text('BL', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold))),
          ],
        )
      ],
    );
  }

  Widget _buildStatCard(String title, String val, String sub, Color color, IconData icon) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border(left: BorderSide(color: color, width: 4)),
          boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 6, offset: const Offset(0, 2))],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.w500), overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 6),
                  Text(val, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF0F172A))),
                  const SizedBox(height: 4),
                  Text(sub, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold), overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            Icon(icon, color: color.withAlpha(50), size: 36),
          ],
        ),
      ),
    );
  }

  Widget _buildJadwalSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 6)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('📅 Jadwal Kuliah Hari Ini', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1E293B))),
                  Text('Senin, 1 Juni 2026', style: TextStyle(color: Colors.grey, fontSize: 12)),
                ],
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6))),
                onPressed: () {},
                child: const Text('Lihat Semua', style: TextStyle(fontSize: 12)),
              ),
            ],
          ),
          const Divider(height: 24),
          _buildJadwalTile('Pemrograman Lanjut', '08:00 - 10:00 • Ruang F2.4 • Dr. Budi Santoso', 'Presensi 85%', 'Selesai', Colors.green),
          _buildJadwalTile('Aljabar Linier', '10:00 - 12:00 • Ruang F3.6 • Prof. Siti Rahayu', 'Presensi 93%', 'Berlangsung', Colors.orange),
          _buildJadwalTile('Basis Data', '13:00 - 15:00 • Ruang F2.1 • Dr. Ahmad Hidayat', 'Presensi 78%', 'Akan Datang', Colors.blue),
          _buildJadwalTile('Kecerdasan Buatan', '15:00 - 17:00 • Online', '', 'Akan Datang', Colors.grey),
        ],
      ),
    );
  }

  Widget _buildJadwalTile(String title, String desc, String presensi, String status, Color color) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Container(width: 4, height: 40, decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(2))),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14, color: Color(0xFF0F172A))),
                Text(desc, style: const TextStyle(color: Colors.blueGrey, fontSize: 12)),
                if (presensi.isNotEmpty) Text(presensi, style: const TextStyle(color: Colors.blue, fontSize: 10, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(color: color.withAlpha(25), borderRadius: BorderRadius.circular(6)),
            child: Text(status, style: TextStyle(color: color, fontWeight: FontWeight.bold, fontSize: 11)),
          )
        ],
      ),
    );
  }

  Widget _buildNilaiSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 6)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('📊 Nilai Semester Lalu', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1E293B))),
          const Text('Semester 2 • IPS 4.00', style: TextStyle(color: Colors.grey, fontSize: 12)),
          const Divider(height: 24),
          Table(
            columnWidths: const {0: FlexColumnWidth(3), 1: FlexColumnWidth(1), 2: FlexColumnWidth(1), 3: FlexColumnWidth(1), 4: FlexColumnWidth(1)},
            children: [
              const TableRow(
                decoration: BoxDecoration(color: Color(0xFFF1F5F9)),
                children: [
                  Padding(padding: EdgeInsets.all(8), child: Text('Mata Kuliah', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                  Padding(padding: EdgeInsets.all(8), child: Text('SKS', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                  Padding(padding: EdgeInsets.all(8), child: Text('Nilai', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                  Padding(padding: EdgeInsets.all(8), child: Text('Grade', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                  Padding(padding: EdgeInsets.all(8), child: Text('Status', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                ]
              ),
              _buildNilaiRow('Kecerdasan Buatan', '3', '88', 'A', 'Lulus', Colors.green),
              _buildNilaiRow('Sistem Operasi', '3', '90', 'A', 'Lulus', Colors.green),
              _buildNilaiRow('Rekayasa Perangkat Lunak', '3', '87', 'A', 'Lulus', Colors.green),
              _buildNilaiRow('Jaringan Komputer', '2', '85', 'A', 'Lulus', Colors.green),
            ],
          )
        ],
      ),
    );
  }

  TableRow _buildNilaiRow(String mk, String sks, String nilai, String grade, String status, Color color) {
    return TableRow(
      children: [
        Padding(padding: const EdgeInsets.all(8), child: Text(mk, style: const TextStyle(fontSize: 13))),
        Padding(padding: const EdgeInsets.all(8), child: Text(sks, style: const TextStyle(fontSize: 13))),
        Padding(padding: const EdgeInsets.all(8), child: Text(nilai, style: const TextStyle(fontSize: 13))),
        Padding(padding: const EdgeInsets.all(8), child: Text(grade, style: TextStyle(fontWeight: FontWeight.bold, color: color, fontSize: 13))),
        Padding(padding: const EdgeInsets.all(8), child: Container(padding: const EdgeInsets.all(2), decoration: BoxDecoration(color: color.withAlpha(20), borderRadius: BorderRadius.circular(4)), child: Text(status, textAlign: TextAlign.center, style: TextStyle(color: color, fontSize: 11, fontWeight: FontWeight.bold)))),
      ]
    );
  }

  Widget _buildPengumumanSection() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 6)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('📢 Pengumuman Terbaru', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1E293B))),
          const SizedBox(height: 16),
          _buildPengumumanItem('Pendaftaran Sidang Skripsi Gel. 2 - 2026', 'Dibuka hingga 20 Mei 2026 • Akademik', true),
          const Divider(height: 20),
          _buildPengumumanItem('Jadwal UAS Semester Genap 2025/2026', '26 April 2026 • Akademik', false),
        ],
      ),
    );
  }

  Widget _buildPengumumanItem(String title, String sub, bool isNew) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF0F172A)))),
            if (isNew) Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: Colors.orange.shade100, borderRadius: BorderRadius.circular(4)), child: const Text('Baru', style: TextStyle(color: Colors.orange, fontSize: 10, fontWeight: FontWeight.bold))),
          ],
        ),
        const SizedBox(height: 4),
        Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 11)),
      ],
    );
  }

  Widget _buildProgresStudiCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 6)]),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Progres Studi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Target Lulus', style: TextStyle(fontSize: 11, color: Colors.grey)),
                  Text('Agustus 2025', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  SizedBox(height: 4),
                  Text('✓ On track\nSisa 36 SKS', style: TextStyle(color: Colors.green, fontSize: 11, fontWeight: FontWeight.w500)),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(width: 60, height: 60, child: CircularProgressIndicator(value: 0.75, strokeWidth: 6, backgroundColor: Color(0xFFF1F5F9), valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF1E88E5)))),
                  Column(
                    children: [
                      Text('75%', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold)),
                      Text('40/144 SKS', style: TextStyle(fontSize: 8, color: Colors.grey)),
                    ],
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildLayananCepatCard() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 6)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Layanan Cepat', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildLayananIcon(Icons.assignment_ind_outlined, 'KRS', Colors.blue.shade50, Colors.blue),
              _buildLayananIcon(Icons.badge_outlined, 'Transkip', Colors.orange.shade50, Colors.orange),
              _buildLayananIcon(Icons.chat_bubble_outline_rounded, 'Konseling', Colors.green.shade50, Colors.green),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildLayananIcon(IconData icon, String label, Color bg, Color iconColor) {
    return Column(
      children: [
        Container(padding: const EdgeInsets.all(12), decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(8)), child: Icon(icon, color: iconColor, size: 20)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w500))
      ],
    );
  }

  Widget _buildKegiatanMendatangCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 6)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('📅 Kegiatan Mendatang', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 12),
          _buildKegiatanItem('15', 'MEI', 'Deadline Tugas RPL', 'Rekayasa Perangkat Lunak • 23:59 WIB', '3 hari', Colors.orange),
          const SizedBox(height: 10),
          _buildKegiatanItem('20', 'MEI', 'Sidang Proposal Skripsi', 'Ruang Seminar • 09:00 WIB', '8 hari', Colors.blue),
          const SizedBox(height: 10),
          _buildKegiatanItem('02', 'JUN', 'UAS Basis Data', 'Gedung A • 08:00 - 10:00 WIB', '21 hari', Colors.green),
        ],
      ),
    );
  }

  Widget _buildKegiatanItem(String tgl, String bln, String title, String sub, String sisa, Color col) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
            decoration: BoxDecoration(color: col.withAlpha(20), borderRadius: BorderRadius.circular(6)),
            child: Column(
              children: [
                Text(tgl, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: col)),
                Text(bln, style: TextStyle(fontSize: 9, fontWeight: FontWeight.bold, color: col)),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12)),
                Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 11), overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4), decoration: BoxDecoration(color: col.withAlpha(15), borderRadius: BorderRadius.circular(4)), child: Text(sisa, style: TextStyle(color: col, fontSize: 10, fontWeight: FontWeight.bold)))
        ],
      ),
    );
  }
}