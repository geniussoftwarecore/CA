import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ComplaintFormScreen extends StatefulWidget {
  const ComplaintFormScreen({super.key});

  @override
  State<ComplaintFormScreen> createState() => _ComplaintFormScreenState();
}

class _ComplaintFormScreenState extends State<ComplaintFormScreen> {
  final PageController _pageController = PageController();
  int _currentStep = 0;
  final int _totalSteps = 5;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تقديم شكوى جديدة'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => context.go('/client'),
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                // TODO: Save draft
              },
            ),
          ],
        ),
        body: Column(
          children: [
            // Progress Indicator
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'الخطوة ${_currentStep + 1} من $_totalSteps',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        '${((_currentStep + 1) / _totalSteps * 100).round()}%',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: (_currentStep + 1) / _totalSteps,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),
            
            // Form Pages
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentStep = index;
                  });
                },
                children: [
                  _buildPersonalInfoStep(),
                  _buildOnBehalfStep(),
                  _buildComplaintDetailsStep(),
                  _buildComplaintSummaryStep(),
                  _buildAttachmentsStep(),
                ],
              ),
            ),
            
            // Navigation Buttons
            Container(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  if (_currentStep > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          _pageController.previousPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        },
                        child: const Text('السابق'),
                      ),
                    ),
                  if (_currentStep > 0) const SizedBox(width: 16),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_currentStep < _totalSteps - 1) {
                          _pageController.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.ease,
                          );
                        } else {
                          _submitComplaint();
                        }
                      },
                      child: Text(
                        _currentStep < _totalSteps - 1 ? 'التالي' : 'تقديم الشكوى',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInfoStep() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'بيانات مقدم الشكوى',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'الاسم الأول *',
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'الاسم الأخير *',
              prefixIcon: Icon(Icons.person),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'رقم الهاتف *',
              prefixIcon: Icon(Icons.phone),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'العنوان *',
              prefixIcon: Icon(Icons.location_on),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOnBehalfStep() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'تقديم الشكوى',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text('تقديم الشكوى:'),
          RadioListTile<String>(
            title: const Text('باسمي الشخصي'),
            value: 'self',
            groupValue: 'self',
            onChanged: (value) {},
          ),
          RadioListTile<String>(
            title: const Text('باسم منظمة/شركة'),
            value: 'organization',
            groupValue: 'self',
            onChanged: (value) {},
          ),
          RadioListTile<String>(
            title: const Text('باسم شخص آخر'),
            value: 'other',
            groupValue: 'self',
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }

  Widget _buildComplaintDetailsStep() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'تفاصيل الشكوى',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'فئة الشكوى *',
              prefixIcon: Icon(Icons.category),
            ),
            items: const [
              DropdownMenuItem(
                value: 'specs',
                child: Text('المواصفات والمقاييس'),
              ),
              DropdownMenuItem(
                value: 'customs',
                child: Text('الجمارك'),
              ),
              DropdownMenuItem(
                value: 'tax',
                child: Text('الضرائب'),
              ),
            ],
            onChanged: (value) {},
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'نوع الطلب من الجهة',
              prefixIcon: Icon(Icons.description),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            decoration: InputDecoration(
              labelText: 'تاريخ الحادثة',
              prefixIcon: Icon(Icons.calendar_today),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildComplaintSummaryStep() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'ملخص الشكوى والمطالب',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const TextField(
            maxLines: 5,
            decoration: InputDecoration(
              labelText: 'ملخص الشكوى (مفصل) *',
              prefixIcon: Icon(Icons.description),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'الحل المطلوب',
              prefixIcon: Icon(Icons.lightbulb),
            ),
          ),
          const SizedBox(height: 16),
          const Text('هل سبق تقديم شكوى مماثلة؟'),
          Row(
            children: [
              Expanded(
                child: RadioListTile<bool>(
                  title: const Text('نعم'),
                  value: true,
                  groupValue: false,
                  onChanged: (value) {},
                ),
              ),
              Expanded(
                child: RadioListTile<bool>(
                  title: const Text('لا'),
                  value: false,
                  groupValue: false,
                  onChanged: (value) {},
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAttachmentsStep() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'المرفقات (اختياري)',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Card(
            child: InkWell(
              onTap: () {
                // TODO: Pick files
              },
              child: const Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  children: [
                    Icon(
                      Icons.cloud_upload,
                      size: 64,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 16),
                    Text(
                      'اضغط لإضافة المرفقات',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'يمكن إرفاق الصور والمستندات (PDF, DOC, DOCX)',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          const TextField(
            maxLines: 3,
            decoration: InputDecoration(
              labelText: 'ملاحظات على المرفقات',
              prefixIcon: Icon(Icons.note),
            ),
          ),
        ],
      ),
    );
  }

  void _submitComplaint() {
    // TODO: Submit complaint to database
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('تم تقديم الشكوى بنجاح'),
        backgroundColor: Colors.green,
      ),
    );
    context.go('/client');
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}