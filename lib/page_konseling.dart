import 'package:flutter/material.dart';
import 'shared_sidebar.dart';

class PageKonseling extends StatelessWidget {
  const PageKonseling({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F5F9), 
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SharedSidebar(activeRoute: '/konseling'),
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeaderBar(context, 'Layanan Konseling'),
                  const SizedBox(height: 24),

                  // Banner Informasi Utama Atas (Biru Navy Gelap)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 28),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFF1E40AF), Color(0xFF1E3A8A)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'LAYANAN KESEJAHTERAAN MAHASISWA',
                                style: TextStyle(
                                  color: Colors.white.withAlpha(160),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.1,
                                ),
                              ),
                              const SizedBox(height: 6),
                              const Text(
                                'Bimbingan & Konseling',
                                style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Kami hadir untuk mendukung kesehatan mental dan akademik Anda',
                                style: TextStyle(color: Colors.white.withAlpha(200), fontSize: 14),
                              ),
                              const SizedBox(height: 18),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFFEA580C), 
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                                ),
                                onPressed: () {},
                                child: const Text(
                                  '+ Buat Janji Konseling →',
                                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                                ),
                              )
                            ],
                          ),
                        ),
                        const SizedBox(width: 20),
                        Row(
                          children: [
                            _buildBannerStatCard('TOTAL SESI', '5'),
                            const SizedBox(width: 12),
                            _buildBannerStatCard('SESI AKTIF', '1'),
                            const SizedBox(width: 12),
                            _buildBannerStatusBadge('STATUS', '✓ Terdaftar'),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Bagian Tengah: Form Booking & List Konselor Tersedia
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: _buildBookingFormCard(),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 2,
                        child: _buildKonselorTersediaCard(),
                      )
                    ],
                  ),
                  const SizedBox(height: 24),

                  // Baris Tabel Riwayat Bimbingan Konseling (Lebar Penuh)
                  _buildRiwayatBimbinganCard(),
                  const SizedBox(height: 24),

                  // Bagian Bawah: Catatan Sesi Terakhir & Sumber Daya Edukasi Mental
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: _buildCatatanSesiTerakhirCard(),
                      ),
                      const SizedBox(width: 24),
                      Expanded(
                        flex: 2,
                        child: _buildSumberDayaMentalCard(),
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
            const Text(
              'BERANDA / KONSELING',
              style: TextStyle(color: Colors.grey, fontSize: 10, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 2),
            Text(
              currentPath,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Color(0xFF1E293B)),
            ),
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
            const CircleAvatar(
              radius: 18,
              backgroundColor: Color(0xFF1E40AF),
              child: Text('BL', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildBannerStatCard(String label, String val) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(color: Colors.white.withAlpha(30), borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(val, style: const TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildBannerStatusBadge(String label, String val) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(color: Colors.white.withAlpha(30), borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          Text(label, style: const TextStyle(color: Colors.white70, fontSize: 10, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(val, style: const TextStyle(color: Color(0xFF4ADE80), fontSize: 14, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildBookingFormCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('📑 Form Booking Konseling', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF1E293B))),
          const SizedBox(height: 20),
          const Text('JENIS KONSELING', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 10),
          Row(
            children: [
              _buildFormRadioChip('Akademik', true),
              const SizedBox(width: 12),
              _buildFormRadioChip('Personal / Sosial', false),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              _buildFormRadioChip('Karir & Masa Depan', false),
              const SizedBox(width: 12),
              _buildFormRadioChip('Kesehatan Mental', false),
            ],
          ),
          const SizedBox(height: 20),
          const Text('TOPIK KONSELING', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 8),
          TextField(
            decoration: InputDecoration(
              hintText: 'Kesulitan dalam manajemen waktu dan pengelolaan tugas akademik',
              filled: true,
              fillColor: const Color(0xFFF8FAFC),
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              enabledBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color(0xFFCBD5E1)), borderRadius: BorderRadius.circular(8)),
              focusedBorder: OutlineInputBorder(borderSide: const BorderSide(color: Color(0xFF1E40AF)), borderRadius: BorderRadius.circular(8)),
            ),
          ),
          const SizedBox(height: 20),
          const Text('PILIH KONSELOR', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: const Color(0xFFCBD5E1)),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: 'rina',
                isExpanded: true,
                items: const [
                  DropdownMenuItem(value: 'rina', child: Text('Dr. Rina Wahyuni, M.Psi — Psikolog Klinis')),
                  DropdownMenuItem(value: 'fauzan', child: Text('Ahmad Fauzan, M.Psi — Konselor Karir')),
                ],
                onChanged: (val) {},
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('TANGGAL SESI', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey)),
                    const SizedBox(height: 8),
                    TextField(
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: 'Selasa, 2 Juni 2026',
                        suffixIcon: const Icon(Icons.calendar_today_rounded, size: 18),
                        filled: true,
                        fillColor: const Color(0xFFF8FAFC),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('WAKTU SESI', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey)),
                    const SizedBox(height: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                      decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFCBD5E1))),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: '10',
                          isExpanded: true,
                          items: const [DropdownMenuItem(value: '10', child: Text('10:00 - 11:00 WIB'))],
                          onChanged: (v) {},
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          const Text('MODE KONSELING', style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold, color: Colors.grey)),
          const SizedBox(height: 8),
          Row(
            children: [
              _buildModeButton(Icons.groups_rounded, 'Tatap Muka', true),
              const SizedBox(width: 10),
              _buildModeButton(Icons.video_camera_front_rounded, 'Online', false),
              const SizedBox(width: 10),
              _buildModeButton(Icons.phone_in_talk_rounded, 'Telepon', false),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildFormRadioChip(String title, bool isSelected) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFEFF6FF) : Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: isSelected ? const Color(0xFF2563EB) : const Color(0xFFE2E8F0), width: isSelected ? 2 : 1),
        ),
        child: Row(
          children: [
            Icon(isSelected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded, color: isSelected ? const Color(0xFF2563EB) : Colors.grey, size: 18),
            const SizedBox(width: 10),
            Text(title, style: TextStyle(fontWeight: isSelected ? FontWeight.bold : FontWeight.normal, color: const Color(0xFF0F172A), fontSize: 13)),
          ],
        ),
      ),
    );
  }

  Widget _buildModeButton(IconData icon, String label, bool isActive) {
    return Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          backgroundColor: isActive ? const Color(0xFFEFF6FF) : Colors.white,
          side: BorderSide(color: isActive ? const Color(0xFF2563EB) : const Color(0xFFCBD5E1)),
          padding: const EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 16, color: isActive ? const Color(0xFF2563EB) : Colors.grey),
            const SizedBox(width: 6),
            Text(label, style: TextStyle(fontSize: 12, fontWeight: isActive ? FontWeight.bold : FontWeight.normal, color: isActive ? const Color(0xFF2563EB) : Colors.black87)),
          ],
        ),
      ),
    );
  }

  Widget _buildKonselorTersediaCard() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 6)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('🧑‍⚕️ Konselor Tersedia', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF1E293B))),
              TextButton(onPressed: () {}, child: const Text('Lihat Semua →', style: TextStyle(fontSize: 11))),
            ],
          ),
          const SizedBox(height: 12),
          _buildItemKonselorCard('Dr. Rina Wahyuni, M.Psi', 'Psikolog Klinis • FILKOM UB', ['Akademik', 'Mental Health'], '⭐ 4.9 • 120 sesi', 'Tersedia Selasa & Kamis', Colors.blue, true),
          const SizedBox(height: 12),
          _buildItemKonselorCard('Ahmad Fauzan, M.Psi', 'Konselor Karir • FILKOM UB', ['Karir', 'Personal'], '⭐ 4.7 • 95 sesi', 'Tersedia Senin & Rabu', Colors.green, false),
          const SizedBox(height: 12),
          _buildItemKonselorCard('Siti Nur Aini, M.Psi', 'Psikolog Pendidikan', ['Sosial'], '⭐ 4.8 • 102 sesi', 'Tersedia Jumat', Colors.orange, false),
          const SizedBox(height: 12),
          _buildItemKonselorCard('Budi Prasetyo, S.Psi', 'Konselor Umum', [], '', '', Colors.grey, false),
        ],
      ),
    );
  }

  Widget _buildItemKonselorCard(String nama, String sub, List<String> tags, String rating, String jadwal, Color sideColor, bool isSelected) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(8),
        border: Border(left: BorderSide(color: sideColor, width: 4)),
      ),
      child: Row(
        children: [
          const CircleAvatar(radius: 20, backgroundColor: Color(0xFFCBD5E1), child: Icon(Icons.person_rounded, color: Colors.white)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(nama, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: Color(0xFF0F172A))),
                Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 11)),
                if (tags.isNotEmpty) ...[
                  const SizedBox(height: 6),
                  Wrap(
                    spacing: 4,
                    children: tags.map((t) => Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: Colors.blue.withAlpha(20), borderRadius: BorderRadius.circular(4)), child: Text(t, style: const TextStyle(fontSize: 9, color: Colors.blue, fontWeight: FontWeight.bold)))).toList(),
                  )
                ],
                if (rating.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Text('$rating • $jadwal', style: const TextStyle(fontSize: 10, color: Colors.blueGrey, fontWeight: FontWeight.w500))
                ]
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: isSelected ? const Color(0xFFEA580C) : const Color(0xFFE2E8F0),
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
            ),
            onPressed: () {},
            child: Text(isSelected ? 'Pilih →' : 'Pilih', style: TextStyle(fontSize: 11, color: isSelected ? Colors.white : Colors.black87, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }

  Widget _buildRiwayatBimbinganCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 6)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('📜 Riwayat Bimbingan Konseling', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF1E293B))),
              Row(
                children: [
                  _buildTabFilter('Semua', true),
                  const SizedBox(width: 6),
                  _buildTabFilter('Selesai', false),
                  const SizedBox(width: 6),
                  _buildTabFilter('Aktif', false),
                ],
              )
            ],
          ),
          const Divider(),
          const SizedBox(height: 16),
          Table(
            defaultVerticalAlignment: TableCellVerticalAlignment.middle, // PERBAIKAN ERROR 1: properti yang benar adalah defaultVerticalAlignment
            columnWidths: const {
              0: FlexColumnWidth(0.5),
              1: FlexColumnWidth(1.5),
              2: FlexColumnWidth(1.5),
              3: FlexColumnWidth(1),
              4: FlexColumnWidth(2),
              5: FlexColumnWidth(1),
              6: FlexColumnWidth(1),
              7: FlexColumnWidth(1.8),
            },
            children: [
              const TableRow(
                decoration: BoxDecoration(color: Color(0xFFF1F5F9)),
                children: [
                  Padding(padding: EdgeInsets.all(10), child: Text('No', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                  Padding(padding: EdgeInsets.all(10), child: Text('Tanggal', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                  Padding(padding: EdgeInsets.all(10), child: Text('Konselor', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                  Padding(padding: EdgeInsets.all(10), child: Text('Jenis', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                  Padding(padding: EdgeInsets.all(10), child: Text('Topik', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                  Padding(padding: EdgeInsets.all(10), child: Text('Mode', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                  Padding(padding: EdgeInsets.all(10), child: Text('Status', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                  Padding(padding: EdgeInsets.all(10), child: Text('Aksi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12), textAlign: TextAlign.center)),
                ]
              ),
              _buildRiwayatRow('1', '15 Mei 2025\nSelasa, 10:00 WIB', 'Dr. Rina Wahyuni\nPsikolog Klinis', 'Akademik', 'Manajemen Waktu\nStres Kuliah', 'Tatap Muka', 'Dijadwalkan', Colors.orange, true),
              _buildRiwayatRow('2', '28 Apr 2025\nSenin, 09:00 WIB', 'Ahmad Fauzan\nKonselor Karir', 'Karir', 'Rencana Magang\nPilihan perusahaan', 'Online', 'Selesai', Colors.green, false),
              _buildRiwayatRow('3', '10 Apr 2025\nKamis, 13:00 WIB', 'Dr. Rina Wahyuni\nPsikolog Klinis', 'Akademik', 'Persiapan Skripsi\nMetode penelitian', 'Tatap Muka', 'Selesai', Colors.green, false),
              _buildRiwayatRow('4', '01 Mar 2025\nJumat, 10:00 WIB', 'Siti Nur Aini\nPsikolog Pend.', 'Sosial', 'Adaptasi Lingkungan\nTeman & pergaulan', 'Online', 'Selesai', Colors.green, false),
              _buildRiwayatRow('5', '10 Jan 2025\nSenin, 14:00 WIB', 'Ahmad Fauzan\nKonselor Karir', 'Karir', 'Pilihan Lanjut Studi\nS2 vs Kerja', 'Tatap Muka', 'Selesai', Colors.green, false),
            ],
          ),
          const SizedBox(height: 16),
          Center(child: TextButton(onPressed: () {}, child: const Text('Menampilkan 5 dari 5 riwayat'))),
        ],
      ),
    );
  }

  Widget _buildTabFilter(String label, bool isActive) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(color: isActive ? const Color(0xFF1E40AF) : const Color(0xFFF1F5F9), borderRadius: BorderRadius.circular(20)),
      child: Text(label, style: TextStyle(color: isActive ? Colors.white : Colors.black87, fontSize: 11, fontWeight: FontWeight.bold)),
    );
  }

  TableRow _buildRiwayatRow(String no, String tgl, String konselor, String jenis, String topik, String mode, String status, Color statusCol, bool isActionable) {
    return TableRow(
      decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFE2E8F0)))),
      children: [
        Padding(padding: const EdgeInsets.all(10), child: Text(no, style: const TextStyle(fontSize: 12))),
        Padding(padding: const EdgeInsets.all(10), child: Text(tgl, style: const TextStyle(fontSize: 11, height: 1.3))), // PERBAIKAN ERROR 2: Proper parameter height diletakkan di dalam TextStyle
        Padding(padding: const EdgeInsets.all(10), child: Text(konselor, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500))),
        Padding(padding: const EdgeInsets.all(10), child: Container(padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2), decoration: BoxDecoration(color: Colors.blue.withAlpha(15), borderRadius: BorderRadius.circular(4)), child: Text(jenis, style: const TextStyle(fontSize: 10, color: Colors.blue, fontWeight: FontWeight.bold)))),
        Padding(padding: const EdgeInsets.all(10), child: Text(topik, style: const TextStyle(fontSize: 11, height: 1.3))), // PERBAIKAN ERROR 2: Proper parameter height diletakkan di dalam TextStyle
        Padding(padding: const EdgeInsets.all(10), child: Text(mode, style: const TextStyle(fontSize: 12))),
        Padding(padding: const EdgeInsets.all(10), child: Container(padding: const EdgeInsets.all(4), decoration: BoxDecoration(color: statusCol.withAlpha(20), borderRadius: BorderRadius.circular(4)), child: Text(status, textAlign: TextAlign.center, style: TextStyle(color: statusCol, fontSize: 10, fontWeight: FontWeight.bold)))),
        Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), minimumSize: Size.zero), onPressed: () {}, child: const Text('Detail', style: TextStyle(fontSize: 10))),
              const SizedBox(width: 4),
              if (isActionable) ...[
                OutlinedButton(style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), backgroundColor: Colors.orange.withAlpha(20)), onPressed: () {}, child: const Text('Batal', style: TextStyle(fontSize: 10, color: Colors.orange))),
              ] else ...[
                OutlinedButton(style: OutlinedButton.styleFrom(padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), backgroundColor: Colors.green.withAlpha(20)), onPressed: () {}, child: const Text('Catatan', style: TextStyle(fontSize: 10, color: Colors.green))),
              ]
            ],
          ),
        ),
      ]
    );
  }

  Widget _buildCatatanSesiTerakhirCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 6)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('📝 Catatan Sesi Terakhir', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF1E293B))),
          const Text('Sesi 28 Apr 2026 — Ahmad Fauzan, M.Psi', style: TextStyle(color: Colors.grey, fontSize: 11)),
          const Divider(),
          const SizedBox(height: 12),
          const Text('Ringkasan Sesi', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 4),
          const Text(
            'Mahasiswa mengungkapkan kekhawatiran terkait pilihan karir setelah lulus. Diskusi meliputi opsi magang di perusahaan teknologi.',
            style: TextStyle(fontSize: 13, color: Colors.black87, height: 1.4),
          ),
          const SizedBox(height: 14),
          const Text('Rekomendasi Konselor', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
          const SizedBox(height: 6),
          _buildBulletPoint('Ikuti program magang MBKM semester depan'),
          _buildBulletPoint('Perkuat portofolio proyek open-source di GitHub'),
          const SizedBox(height: 14),
          Row(
            children: [
              WidgetActionBuatUnduh(),
              const SizedBox(width: 12),
              OutlinedButton(onPressed: () {}, child: const Text('Bagikan')),
            ],
          )
        ],
      ),
    );
  }

  Widget WidgetActionBuatUnduh() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFFEA580C)), 
      onPressed: () {}, 
      child: const Text('Unduh PDF', style: TextStyle(color: Colors.white))
    );
  }

  Widget _buildBulletPoint(String txt) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('• ', style: TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(txt, style: const TextStyle(fontSize: 12, color: Colors.black87))),
        ],
      ),
    );
  }

  Widget _buildSumberDayaMentalCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12), boxShadow: [BoxShadow(color: Colors.black.withAlpha(10), blurRadius: 6)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('🔮 Sumber Daya Kesehatan Mental', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Color(0xFF1E293B))),
          const SizedBox(height: 16),
          _buildEdukasiItemTile(Icons.article_outlined, 'Mengelola Stres Akademik', 'Tips praktis menjelang ujian akhir', 'Baca', Colors.blue),
          const SizedBox(height: 12),
          _buildEdukasiItemTile(Icons.headset_mic_outlined, 'Mindfulness Mahasiswa', 'Teknik relaksasi meditasi ringan', 'Dengar', Colors.green),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: const Color(0xFF0F172A), borderRadius: BorderRadius.circular(8)),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone_in_talk_rounded, color: Colors.white, size: 18),
                SizedBox(width: 10),
                Text(
                  'Hotline UB: (0341) 551611 ext. 115',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 12),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildEdukasiItemTile(IconData icon, String title, String sub, String btnText, Color col) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFFF8FAFC), borderRadius: BorderRadius.circular(8), border: Border.all(color: const Color(0xFFE2E8F0))),
      child: Row(
        children: [
          Icon(icon, color: col, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Color(0xFF0F172A))),
                Text(sub, style: const TextStyle(color: Colors.grey, fontSize: 10, height: 1.3)),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: col, padding: const EdgeInsets.symmetric(horizontal: 12), minimumSize: const Size(50, 30)),
            onPressed: () {},
            child: Text(btnText, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
          )
        ],
      ),
    );
  }
}