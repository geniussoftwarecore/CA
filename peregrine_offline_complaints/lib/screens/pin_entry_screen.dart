import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PinEntryScreen extends StatefulWidget {
  final String role;
  
  const PinEntryScreen({
    super.key,
    required this.role,
  });

  @override
  State<PinEntryScreen> createState() => _PinEntryScreenState();
}

class _PinEntryScreenState extends State<PinEntryScreen> {
  final _pinController = TextEditingController();
  String? _errorMessage;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('دخول ${_getRoleTitle()}'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/'),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _getRoleIcon(),
                size: 80,
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 32),
              Text(
                'مرحباً بك في ${_getRoleTitle()}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              const Text(
                'يرجى إدخال رمز PIN للمتابعة',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              TextField(
                controller: _pinController,
                obscureText: true,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  letterSpacing: 8,
                ),
                decoration: InputDecoration(
                  hintText: '••••',
                  hintStyle: const TextStyle(
                    fontSize: 24,
                    letterSpacing: 8,
                  ),
                  errorText: _errorMessage,
                  prefixIcon: const Icon(Icons.lock),
                ),
                onChanged: (value) {
                  if (_errorMessage != null) {
                    setState(() {
                      _errorMessage = null;
                    });
                  }
                },
                onSubmitted: (_) => _verifyPin(),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _isLoading ? null : _verifyPin,
                  child: _isLoading
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text(
                          'تسجيل الدخول',
                          style: TextStyle(fontSize: 18),
                        ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getRoleTitle() {
    switch (widget.role) {
      case 'support':
        return 'لجنة الدعم';
      case 'coordination':
        return 'لجنة التنسيق العليا';
      default:
        return 'Unknown';
    }
  }

  IconData _getRoleIcon() {
    switch (widget.role) {
      case 'support':
        return Icons.support_agent;
      case 'coordination':
        return Icons.admin_panel_settings;
      default:
        return Icons.person;
    }
  }

  void _verifyPin() async {
    final pin = _pinController.text.trim();
    
    if (pin.isEmpty) {
      setState(() {
        _errorMessage = 'يرجى إدخال رمز PIN';
      });
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });

    // Simulate PIN verification
    await Future.delayed(const Duration(seconds: 1));
    
    // For demo purposes, use default PINs
    bool isValid = false;
    if (widget.role == 'support' && pin == '1234') {
      isValid = true;
    } else if (widget.role == 'coordination' && pin == '5678') {
      isValid = true;
    }

    setState(() {
      _isLoading = false;
    });

    if (isValid) {
      context.go('/${widget.role}');
    } else {
      setState(() {
        _errorMessage = 'رمز PIN غير صحيح';
      });
      _pinController.clear();
    }
  }

  @override
  void dispose() {
    _pinController.dispose();
    super.dispose();
  }
}