import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CoordinationHomeScreen extends StatelessWidget {
  const CoordinationHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('لوحة لجنة التنسيق العليا'),
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
            children: [
              // Summary Stats
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'الملخص الشامل',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buildSummaryItem(
                              'إجمالي الشكاوى',
                              '147',
                              const Color(0xFF002855),
                            ),
                          ),
                          Expanded(
                            child: _buildSummaryItem(
                              'معدل الحل',
                              '89%',
                              const Color(0xFF009639),
                            ),
                          ),
                          Expanded(
                            child: _buildSummaryItem(
                              'متوسط وقت الحل',
                              '3.2 يوم',
                              const Color(0xFFF4B400),
                            ),
                          ),
                        ],
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
                      title: 'المحولة للتنسيق',
                      subtitle: 'الشكاوى المحولة من الدعم',
                      icon: Icons.forward_to_inbox,
                      badge: '7',
                      color: const Color(0xFFFF9800),
                      onTap: () {
                        // TODO: Navigate to escalated complaints
                      },
                    ),
                    _buildActionCard(
                      context,
                      title: 'المنجزة نهائياً',
                      subtitle: 'الشكاوى المحلولة والمغلقة',
                      icon: Icons.task_alt,
                      badge: '132',
                      color: const Color(0xFF4CAF50),
                      onTap: () {
                        // TODO: Navigate to finalized complaints
                      },
                    ),
                    _buildActionCard(
                      context,
                      title: 'المرفوضة',
                      subtitle: 'الشكاوى المرفوضة',
                      icon: Icons.cancel,
                      badge: '8',
                      color: const Color(0xFFF44336),
                      onTap: () {
                        // TODO: Navigate to rejected complaints
                      },
                    ),
                    _buildActionCard(
                      context,
                      title: 'التقارير الشاملة',
                      subtitle: 'تصدير التقارير',
                      icon: Icons.analytics,
                      color: const Color(0xFF002855),
                      onTap: () {
                        // TODO: Navigate to comprehensive reports
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

  Widget _buildSummaryItem(String title, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
    String? badge,
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
              Stack(
                clipBehavior: Clip.none,
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
                  if (badge != null)
                    Positioned(
                      top: -8,
                      right: -8,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          badge,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 11,
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