import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoleSelectionScreen extends StatelessWidget {
  const RoleSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF002855), Color(0xFF004080)],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Logo
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(60),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.assignment_outlined,
                      size: 60,
                      color: Color(0xFF002855),
                    ),
                  ),
                  const SizedBox(height: 32),
                  
                  // Title
                  const Text(
                    'نظام شكاوى بيرقرين',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'نظام إدارة الشكاوى المحلي',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),
                  
                  // Role Cards
                  _buildRoleCard(
                    context,
                    title: 'عميل',
                    subtitle: 'تقديم شكوى جديدة أو متابعة الشكاوى المقدمة',
                    icon: Icons.person,
                    onTap: () => context.go('/client'),
                  ),
                  const SizedBox(height: 16),
                  _buildRoleCard(
                    context,
                    title: 'لجنة الدعم',
                    subtitle: 'مراجعة ومعالجة الشكاوى الواردة',
                    icon: Icons.support_agent,
                    requiresPIN: true,
                    onTap: () => context.go('/pin-entry/support'),
                  ),
                  const SizedBox(height: 16),
                  _buildRoleCard(
                    context,
                    title: 'لجنة التنسيق العليا',
                    subtitle: 'المراجعة النهائية والقرارات الإدارية',
                    icon: Icons.admin_panel_settings,
                    requiresPIN: true,
                    onTap: () => context.go('/pin-entry/coordination'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
    bool requiresPIN = false,
  }) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(
                  icon,
                  size: 30,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (requiresPIN) ...[
                          const SizedBox(width: 8),
                          const Icon(
                            Icons.lock,
                            size: 16,
                            color: Colors.orange,
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                    if (requiresPIN)
                      const Text(
                        'يتطلب رمز PIN',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.orange,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}