// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class SAr extends S {
  SAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'شكاوى بيريجراين';

  @override
  String get role_client => 'عميل';

  @override
  String get role_support => 'لجنة الدعم الفني';

  @override
  String get role_coord => 'لجنة التنسيق الأعلى';

  @override
  String get nav_home => 'الرئيسية';

  @override
  String get nav_my_complaints => 'شكاواي';

  @override
  String get nav_daily_report => 'تقرير يومي';

  @override
  String get nav_settings => 'الإعدادات';

  @override
  String get pin_title => 'إدخال رمز PIN';

  @override
  String get pin_hint => 'أدخل الرمز للوصول للوضع الإداري';

  @override
  String get pin_error => 'رمز غير صحيح';

  @override
  String get form_step1_title => 'بيانات مقدم الشكوى';

  @override
  String get first_name => 'الاسم الأول';

  @override
  String get middle_name => 'الاسم الثاني';

  @override
  String get last_name => 'اللقب';

  @override
  String get address => 'العنوان';

  @override
  String get phone => 'الهاتف';

  @override
  String get alt_phone => 'هاتف بديل';

  @override
  String get whatsapp => 'واتساب';

  @override
  String get telegram => 'تيليجرام';

  @override
  String get email => 'البريد الإلكتروني';

  @override
  String get form_step2_title => 'التقديم بالنيابة';

  @override
  String get on_behalf => 'التقديم بالنيابة';

  @override
  String get on_behalf_self => 'عن نفسي';

  @override
  String get on_behalf_org => 'عن جهة';

  @override
  String get on_behalf_other => 'عن شخص آخر';

  @override
  String get behalf_full_name => 'الاسم الكامل للنيابة';

  @override
  String get behalf_relation => 'صلة القرابة/العلاقة';

  @override
  String get form_step3_title => 'التصنيف والجهة والتواريخ';

  @override
  String get category => 'التصنيف';

  @override
  String get authority => 'الجهة';

  @override
  String get incident_date => 'تاريخ الواقعة';

  @override
  String get awareness_date => 'تاريخ العلم';

  @override
  String get form_step4_title => 'تفاصيل الشكوى';

  @override
  String get summary => 'تفاصيل الشكوى';

  @override
  String get authority_offer => 'هل قُدم عرض/حل من الجهة؟';

  @override
  String get desired_resolution => 'المطلوب لوضع الأمور في نصابها';

  @override
  String get previous_complaint => 'هل سبق تقديم شكوى؟';

  @override
  String get legal_action_exists => 'هل توجد قضية/إجراء قانوني؟';

  @override
  String get form_step5_title => 'المرفقات';

  @override
  String get add_attachment => 'إضافة مرفق';

  @override
  String get submit_complaint => 'إرسال الشكوى';

  @override
  String get save_draft => 'حفظ مسودة';

  @override
  String get validation_required => 'هذا الحقل مطلوب';

  @override
  String get validation_invalid_email => 'بريد إلكتروني غير صالح';

  @override
  String get validation_date => 'تاريخ غير صالح';

  @override
  String get status_new => 'جديدة';

  @override
  String get status_in_review => 'قيد المراجعة';

  @override
  String get status_resolved_support => 'تم الحل (الدعم)';

  @override
  String get status_escalated => 'محوّلة للتنسيق الأعلى';

  @override
  String get status_resolved_coord => 'تم الحل (التنسيق الأعلى)';

  @override
  String get status_closed => 'مغلقة';

  @override
  String get status_rejected => 'مرفوضة';

  @override
  String get support_inbox => 'الوارد';

  @override
  String get assigned_to_me => 'المُسندة إليّ';

  @override
  String get resolved_by_support => 'تم حلها (الدعم)';

  @override
  String get escalated_list => 'المحوّلة';

  @override
  String get action_assign_to_me => 'إسناد لنفسي';

  @override
  String get action_add_note => 'إضافة ملاحظة';

  @override
  String get action_resolve => 'تأشير تم الحل';

  @override
  String get action_escalate => 'تحويل للتنسيق الأعلى';

  @override
  String get action_close => 'إغلاق';

  @override
  String get action_reject => 'رفض';

  @override
  String get possible_duplicate => 'شكوى محتمل تكرارها';

  @override
  String get duplicate_found => 'تم رصد شكوى مشابهة في نفس التصنيف/الجهة';

  @override
  String get empty_state_no_complaints => 'لا توجد شكاوى بعد';

  @override
  String get empty_state_try_create => 'ابدأ بإنشاء شكوى جديدة من الزر أدناه';

  @override
  String get report_daily_title => 'التقرير اليومي';

  @override
  String get report_generate_pdf => 'توليد PDF';

  @override
  String get report_saved => 'تم حفظ التقرير';

  @override
  String get report_share => 'مشاركة التقرير';

  @override
  String get export_json => 'تصدير JSON';

  @override
  String get import_json => 'استيراد JSON';

  @override
  String get export_done => 'تم التصدير بنجاح';

  @override
  String get import_done => 'تم الاستيراد بنجاح';

  @override
  String get welcome_message => 'مرحباً بك';

  @override
  String get welcome_subtitle =>
      'يمكنك تقديم شكوى جديدة أو متابعة شكاويك السابقة';

  @override
  String get new_complaint => 'شكوى جديدة';

  @override
  String get new_complaint_subtitle => 'تقديم شكوى جديدة';

  @override
  String get my_complaints_subtitle => 'عرض الشكاوى المقدمة';

  @override
  String get export_import => 'تصدير/استيراد';

  @override
  String get data_management => 'إدارة البيانات';

  @override
  String get app_settings => 'إعدادات التطبيق';

  @override
  String get login => 'تسجيل الدخول';

  @override
  String get previous => 'السابق';

  @override
  String get next => 'التالي';

  @override
  String step_progress(Object current, Object total) {
    return 'الخطوة $current من $total';
  }

  @override
  String get today_received => 'الواردة اليوم';

  @override
  String get resolved => 'المحلولة';

  @override
  String get transferred => 'المحولة';

  @override
  String get new_and_reviewing => 'شكاوى جديدة وقيد المراجعة';

  @override
  String get comprehensive_summary => 'الملخص الشامل';

  @override
  String get total_complaints => 'إجمالي الشكاوى';

  @override
  String get resolution_rate => 'معدل الحل';

  @override
  String get avg_resolution_time => 'متوسط وقت الحل';

  @override
  String get system_subtitle => 'نظام إدارة الشكاوى المحلي';

  @override
  String get pin_required => 'يتطلب رمز PIN';

  @override
  String welcome_role(Object role) {
    return 'مرحباً بك في $role';
  }
}
