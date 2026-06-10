import 'package:flutter/material.dart';
import 'shared_sidebar.dart';

class PageProfil extends StatefulWidget {
  const PageProfil({super.key});

  @override
  State<PageProfil> createState() => _PageProfilState();
}

class _PageProfilState extends State<PageProfil> {
  bool notifJadwal = true;
  bool notifPengumuman = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const SharedSidebar(activeRoute: '/profil'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderBar(context, 'Profil Mahasiswa'),
                  const SizedBox(height: 24),

                  // Banner Profil Card Atas
                  Container(
                    padding: const EdgeInsets.all(28),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: [Color(0xFF1E3A8A), Color(0xFF1D4ED8)]),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 42,
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('BL', style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('Bahlil Lahadalia', style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              const Text('255150700111001 • Teknik Informatika', style: TextStyle(color: Colors.white70, fontSize: 14)),
                              const Text('Angkatan 2025 • Semester 2', style: TextStyle(color: Colors.white70, fontSize: 14)),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  _buildBadgeChip('🟢 Aktif'),
                                  const SizedBox(width: 8),
                                  _buildBadgeChip('📍 Malang, Jawa Timur'),
                                ],
                              )
                            ],
                          ),
                        ),
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF59E0B), padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12)),
                          onPressed: () {},
                          icon: const Icon(Icons.edit, color: Colors.white, size: 16),
                          label: const Text('Edit Profil', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Layout Dua Grid Fleksibel Utama
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Kolom Kiri (Flex 3) - Form Input Data & Ganti Password
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            _buildDataPribadiCard(),
                            const SizedBox(height: 24),
                            _buildGantiPasswordCard(),
                            const SizedBox(height: 24),
                            _buildFotoDanDokumenCard(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      // Kolom Kanan (Flex 2) - Info Akademik, Riwayat Login, Notifikasi
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            _buildInfoAkademikCard(),
                            const SizedBox(height: 24),
                            _buildRiwayatLoginCard(),
                            const SizedBox(height: 24),
                            _buildPreferensiNotifCard(),
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
            const Text('BERANDA / PROFIL', style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold)),
            const SizedBox(height: 2),
            Text(currentPath, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
          ],
        ),
        Row(
          children: [
            Container(
              width: 260,
              height: 38,
              decoration: BoxDecoration(color: const Color(0xFFE2E8F0), borderRadius: BorderRadius.circular(20)),
              child: const TextField(
                decoration: InputDecoration(hintText: 'Cari layanan...', prefixIcon: Icon(Icons.search, size: 16), border: InputBorder.none, contentPadding: EdgeInsets.symmetric(vertical: 9)),
              ),
            ),
            const SizedBox(width: 12),
            const CircleAvatar(radius: 16, backgroundColor: Color(0xFF1E40AF), child: Text('BL', style: TextStyle(color: Colors.white, fontSize: 11))),
          ],
        )
      ],
    );
  }

  Widget _buildBadgeChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(color: Colors.black.withAlpha(50), borderRadius: BorderRadius.circular(20)),
      child: Text(label, style: const TextStyle(color: Colors.white, fontSize: 11)),
    );
  }

  Widget _buildDataPribadiCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 6)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('👤 Data Pribadi', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(child: _buildProfilInput('NAMA LENGKAP', 'Bahlil Lahadalia')),
              const SizedBox(width: 16),
              Expanded(child: _buildProfilInput('EMAIL AKTIF', 'bahlil.mbg@student.ub.ac.id')),
            ],
          ),
          Row(
            children: [
              Expanded(child: _buildProfilInput('NIM', '255150700111001')),
              const SizedBox(width: 16),
              Expanded(child: _buildProfilInput('NO. TELEPON', '+62 812-3456-7890')),
            ],
          ),
          Row(
            children: [
              Expanded(child: _buildProfilInput('TEMPAT LAHIR', 'Malang')),
              const SizedBox(width: 16),
              Expanded(child: _buildProfilInput('ALAMAT ASAL', 'Jl. Soekarno-Hatta No. 12, Malang')),
            ],
          ),
          Row(
            children: [
              Expanded(child: _buildProfilInput('TANGGAL LAHIR', '17 Agustus 2006')),
              const SizedBox(width: 16),
              Expanded(child: _buildProfilInput('NOMOR KTP', '3573012203020001')),
            ],
          ),
          Row(
            children: [
              Expanded(child: _buildProfilInput('JENIS KELAMIN', 'Laki-laki')),
              const SizedBox(width: 16),
              Expanded(child: _buildProfilInput('GOLONGAN DARAH', 'O')),
            ],
          ),
          Row(
            children: [
              Expanded(child: _buildProfilInput('AGAMA', 'Islam')),
              const SizedBox(width: 16),
              Expanded(child: _buildProfilInput('KEWARGANEGARAAN', 'Indonesia')),
            ],
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFF59E0B), padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14)),
              onPressed: () {},
              child: const Text('Simpan Perubahan', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProfilInput(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
          const SizedBox(height: 6),
          SizedBox(
            height: 40,
            child: TextField(
              controller: TextEditingController(text: value),
              style: const TextStyle(fontSize: 13),
              decoration: const InputDecoration(border: OutlineInputBorder(), contentPadding: EdgeInsets.symmetric(horizontal: 12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGantiPasswordCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 6)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('🔒 Ganti Password', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 16),
          _buildPasswordInput('PASSWORD LAMA', '•••••••••••••'),
          _buildPasswordInput('PASSWORD BARU', ''),
          _buildPasswordInput('KONFIRMASI PASSWORD BARU', ''),
          Row(
            children: [
              ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.orange.shade700), onPressed: () {}, child: const Text('Ganti Password', style: TextStyle(color: Colors.white))),
              const SizedBox(width: 12),
              OutlinedButton(onPressed: () {}, child: const Text('Batal')),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildPasswordInput(String label, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, color: Colors.blueGrey)),
          const SizedBox(height: 4),
          SizedBox(
            height: 40,
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: hint,
                suffixIcon: const Icon(Icons.visibility_off_outlined, size: 18),
                border: const OutlineInputBorder(),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12)
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildFotoDanDokumenCard() {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                const CircleAvatar(radius: 30, child: Text('BL')),
                const SizedBox(height: 8),
                OutlinedButton(onPressed: () {}, child: const Text('Ganti Foto', style: TextStyle(fontSize: 12))),
              ],
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('📄 KTM (Kartu Mahasiswa)', style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
                Text('Valid hingga Agustus 2029', style: TextStyle(color: Colors.green, fontSize: 11)),
                const Divider(),
                ElevatedButton(onPressed: () {}, child: const Text('Unduh KTM', style: TextStyle(fontSize: 11))),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildInfoAkademikCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 6)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('🎓 Info Akademik', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const Divider(height: 24),
          _buildAcademicItem('PROGRAM STUDI', 'Teknik Informatika'),
          _buildAcademicItem('FAKULTAS', 'Fakultas Ilmu Komputer'),
          _buildAcademicItem('ANGKATAN', '2025'),
          _buildAcademicItem('DOSEN PEMBIMBING', 'Dr. Budi Santoso, M.Kom'),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMiniScoreBox('IPK', '4.00', Colors.blue),
              _buildMiniScoreBox('SKS Tempuh', '40', Colors.orange),
              _buildMiniScoreBox('Sisa SKS', '104', Colors.green),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildAcademicItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
          const SizedBox(height: 2),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF0F172A))),
        ],
      ),
    );
  }

  Widget _buildMiniScoreBox(String label, String score, Color col) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: col.withAlpha(15), borderRadius: BorderRadius.circular(8)),
      child: Column(
        children: [
          Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
          Text(score, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: col)),
        ],
      ),
    );
  }

  Widget _buildRiwayatLoginCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('🕒 Riwayat Login', style: TextStyle(fontWeight: FontWeight.bold)),
          const Divider(),
          _buildRiwayatTile('Login berhasil', '30 Mei 2026 • Chrome / Windows', Colors.green),
          _buildRiwayatTile('Percobaan gagal', '10 Mei 2026 • Mobile / Android', Colors.red),
        ],
      ),
    );
  }

  Widget _buildRiwayatTile(String status, String desc, Color col) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(Icons.devices, color: col, size: 20),
      title: Text(status, style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: col)),
      subtitle: Text(desc, style: const TextStyle(fontSize: 11)),
    );
  }

  Widget _buildPreferensiNotifCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('🔔 Preferensi Notifikasi', style: TextStyle(fontWeight: FontWeight.bold)),
          SwitchListTile(title: const Text('Jadwal Kuliah', style: TextStyle(fontSize: 13)), value: notifJadwal, onChanged: (v) => setState(() => notifJadwal = v)),
          SwitchListTile(title: const Text('Pengumuman', style: TextStyle(fontSize: 13)), value: notifPengumuman, onChanged: (v) => setState(() => notifPengumuman = v)),
        ],
      ),
    );
  }
}