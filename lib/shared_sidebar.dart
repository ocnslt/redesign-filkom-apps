import 'package:flutter/material.dart';

class SharedSidebar extends StatelessWidget {
  final String activeRoute;

  const SharedSidebar({super.key, required this.activeRoute});

  Widget _buildMenuItem(BuildContext context, {
    required IconData icon, 
    required String title, 
    required String route,
    bool isNotFound = false,
    String? badge,
  }) {
    final bool isActive = activeRoute == route;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF2244A0) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF94A3B8), size: 20),
        title: Text(
          title, 
          style: TextStyle(
            color: isActive ? Colors.white : const Color(0xFFE2E8F0), 
            fontWeight: isActive ? FontWeight.bold : FontWeight.w400,
            fontSize: 14,
          ),
        ),
        trailing: badge != null 
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(color: Colors.orange.shade700, borderRadius: BorderRadius.circular(10)),
              child: Text(badge, style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold)),
            )
          : null,
        dense: true,
        onTap: () {
          if (isNotFound) {
            Navigator.pushNamed(context, '/not-found');
          } else {
            Navigator.pushReplacementNamed(context, route);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 260,
      color: const Color(0xFF111E38), 
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    // Header Aplikasi
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: const BoxDecoration(color: Color(0xFFF59E0B), shape: BoxShape.circle),
                            child: const Text('F', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                          const SizedBox(width: 12),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('FILKOM Apps', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                              Text('Portal Mahasiswa UB', style: TextStyle(color: Color(0xFF64748B), fontSize: 11)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    // Detail Akun Singkat
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(color: const Color(0xFF1E293B), borderRadius: BorderRadius.circular(12)),
                      child: const Row(
                        children: [
                          CircleAvatar(radius: 18, backgroundColor: Color(0xFF3B82F6), child: Text('BL', style: TextStyle(color: Colors.white, fontSize: 12))),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Bahlil Lahadalia', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold)),
                                Text('255150700111001', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 11)),
                                Text('Teknik Informatika', style: TextStyle(color: Color(0xFFF59E0B), fontSize: 10, fontWeight: FontWeight.bold)),
                                Text('Semester 2', style: TextStyle(color: Color(0xFF94A3B8), fontSize: 10)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Padding(
                      padding: EdgeInsets.only(left: 24, bottom: 8),
                      child: Text('MENU UTAMA', style: TextStyle(color: Color(0xFF475569), fontSize: 11, fontWeight: FontWeight.bold)),
                    ),
                    _buildMenuItem(context, icon: Icons.grid_view_rounded, title: 'Dashboard', route: '/dashboard'),
                    _buildMenuItem(context, icon: Icons.auto_stories_rounded, title: 'Akademik', route: '/akademik', isNotFound: true),
                    _buildMenuItem(context, icon: Icons.science_rounded, title: 'Penelitian', route: '/penelitian', isNotFound: true),
                    _buildMenuItem(context, icon: Icons.business_rounded, title: 'Fasilitas', route: '/fasilitas', isNotFound: true),
                    _buildMenuItem(context, icon: Icons.forum_rounded, title: 'Konseling', route: '/konseling'),
                    _buildMenuItem(context, icon: Icons.person_rounded, title: 'Profil', route: '/profil'),
                    const SizedBox(height: 16),
                    const Padding(
                      padding: EdgeInsets.only(left: 24, bottom: 8),
                      child: Text('LAINNYA', style: TextStyle(color: Color(0xFF475569), fontSize: 11, fontWeight: FontWeight.bold)),
                    ),
                    _buildMenuItem(context, icon: Icons.notifications_rounded, title: 'Pengumuman', route: '/pengumuman', isNotFound: true, badge: '3'),
                    const Spacer(),
                    const Divider(color: Color(0xFF1E293B)),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: ListTile(
                        leading: const Icon(Icons.logout_rounded, color: Color(0xFFEF4444)),
                        title: const Text('Keluar Akun', style: TextStyle(color: Color(0xFFEF4444), fontSize: 14)),
                        dense: true,
                        onTap: () {},
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}