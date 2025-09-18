import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ClientHomeScreen extends StatelessWidget {
  const ClientHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('لوحة العميل'),
          actions: [
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () => context.go('/'),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome message
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person,
                        size: 48,
                        color: Color(0xFF002855),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'مرحباً بك',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'يمكنك تقديم شكوى جديدة أو متابعة شكاويك السابقة',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              
              // Action Cards
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildActionCard(
                      context,
                      title: 'شكوى جديدة',
                      subtitle: 'تقديم شكوى جديدة',
                      icon: Icons.add_circle,
                      color: const Color(0xFF009639),
                      onTap: () => context.go('/complaint-form'),
                    ),
                    _buildActionCard(
                      context,
                      title: 'شكاويي',
                      subtitle: 'عرض الشكاوى المقدمة',
                      icon: Icons.list_alt,
                      color: const Color(0xFF002855),
                      onTap: () {
                        // TODO: Navigate to my complaints
                      },
                    ),
                    _buildActionCard(
                      context,
                      title: 'تصدير/استيراد',
                      subtitle: 'إدارة البيانات',
                      icon: Icons.import_export,
                      color: const Color(0xFFF4B400),
                      onTap: () {
                        // TODO: Navigate to export/import
                      },
                    ),
                    _buildActionCard(
                      context,
                      title: 'الإعدادات',
                      subtitle: 'إعدادات التطبيق',
                      icon: Icons.settings,
                      color: Colors.grey,
                      onTap: () {
                        // TODO: Navigate to settings
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  icon,
                  size: 30,
                  color: color,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}