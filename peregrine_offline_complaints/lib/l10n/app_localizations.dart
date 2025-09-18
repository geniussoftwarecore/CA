import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of S
/// returned by `S.of(context)`.
///
/// Applications need to include `S.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: S.localizationsDelegates,
///   supportedLocales: S.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the S.supportedLocales
/// property.
abstract class S {
  S(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static S? of(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  static const LocalizationsDelegate<S> delegate = _SDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('ar')];

  /// No description provided for @appTitle.
  ///
  /// In ar, this message translates to:
  /// **'شكاوى بيريجراين'**
  String get appTitle;

  /// No description provided for @role_client.
  ///
  /// In ar, this message translates to:
  /// **'عميل'**
  String get role_client;

  /// No description provided for @role_support.
  ///
  /// In ar, this message translates to:
  /// **'لجنة الدعم الفني'**
  String get role_support;

  /// No description provided for @role_coord.
  ///
  /// In ar, this message translates to:
  /// **'لجنة التنسيق الأعلى'**
  String get role_coord;

  /// No description provided for @nav_home.
  ///
  /// In ar, this message translates to:
  /// **'الرئيسية'**
  String get nav_home;

  /// No description provided for @nav_my_complaints.
  ///
  /// In ar, this message translates to:
  /// **'شكاواي'**
  String get nav_my_complaints;

  /// No description provided for @nav_daily_report.
  ///
  /// In ar, this message translates to:
  /// **'تقرير يومي'**
  String get nav_daily_report;

  /// No description provided for @nav_settings.
  ///
  /// In ar, this message translates to:
  /// **'الإعدادات'**
  String get nav_settings;

  /// No description provided for @pin_title.
  ///
  /// In ar, this message translates to:
  /// **'إدخال رمز PIN'**
  String get pin_title;

  /// No description provided for @pin_hint.
  ///
  /// In ar, this message translates to:
  /// **'أدخل الرمز للوصول للوضع الإداري'**
  String get pin_hint;

  /// No description provided for @pin_error.
  ///
  /// In ar, this message translates to:
  /// **'رمز غير صحيح'**
  String get pin_error;

  /// No description provided for @form_step1_title.
  ///
  /// In ar, this message translates to:
  /// **'بيانات مقدم الشكوى'**
  String get form_step1_title;

  /// No description provided for @first_name.
  ///
  /// In ar, this message translates to:
  /// **'الاسم الأول'**
  String get first_name;

  /// No description provided for @middle_name.
  ///
  /// In ar, this message translates to:
  /// **'الاسم الثاني'**
  String get middle_name;

  /// No description provided for @last_name.
  ///
  /// In ar, this message translates to:
  /// **'اللقب'**
  String get last_name;

  /// No description provided for @address.
  ///
  /// In ar, this message translates to:
  /// **'العنوان'**
  String get address;

  /// No description provided for @phone.
  ///
  /// In ar, this message translates to:
  /// **'الهاتف'**
  String get phone;

  /// No description provided for @alt_phone.
  ///
  /// In ar, this message translates to:
  /// **'هاتف بديل'**
  String get alt_phone;

  /// No description provided for @whatsapp.
  ///
  /// In ar, this message translates to:
  /// **'واتساب'**
  String get whatsapp;

  /// No description provided for @telegram.
  ///
  /// In ar, this message translates to:
  /// **'تيليجرام'**
  String get telegram;

  /// No description provided for @email.
  ///
  /// In ar, this message translates to:
  /// **'البريد الإلكتروني'**
  String get email;

  /// No description provided for @form_step2_title.
  ///
  /// In ar, this message translates to:
  /// **'التقديم بالنيابة'**
  String get form_step2_title;

  /// No description provided for @on_behalf.
  ///
  /// In ar, this message translates to:
  /// **'التقديم بالنيابة'**
  String get on_behalf;

  /// No description provided for @on_behalf_self.
  ///
  /// In ar, this message translates to:
  /// **'عن نفسي'**
  String get on_behalf_self;

  /// No description provided for @on_behalf_org.
  ///
  /// In ar, this message translates to:
  /// **'عن جهة'**
  String get on_behalf_org;

  /// No description provided for @on_behalf_other.
  ///
  /// In ar, this message translates to:
  /// **'عن شخص آخر'**
  String get on_behalf_other;

  /// No description provided for @behalf_full_name.
  ///
  /// In ar, this message translates to:
  /// **'الاسم الكامل للنيابة'**
  String get behalf_full_name;

  /// No description provided for @behalf_relation.
  ///
  /// In ar, this message translates to:
  /// **'صلة القرابة/العلاقة'**
  String get behalf_relation;

  /// No description provided for @form_step3_title.
  ///
  /// In ar, this message translates to:
  /// **'التصنيف والجهة والتواريخ'**
  String get form_step3_title;

  /// No description provided for @category.
  ///
  /// In ar, this message translates to:
  /// **'التصنيف'**
  String get category;

  /// No description provided for @authority.
  ///
  /// In ar, this message translates to:
  /// **'الجهة'**
  String get authority;

  /// No description provided for @incident_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ الواقعة'**
  String get incident_date;

  /// No description provided for @awareness_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ العلم'**
  String get awareness_date;

  /// No description provided for @form_step4_title.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل الشكوى'**
  String get form_step4_title;

  /// No description provided for @summary.
  ///
  /// In ar, this message translates to:
  /// **'تفاصيل الشكوى'**
  String get summary;

  /// No description provided for @authority_offer.
  ///
  /// In ar, this message translates to:
  /// **'هل قُدم عرض/حل من الجهة؟'**
  String get authority_offer;

  /// No description provided for @desired_resolution.
  ///
  /// In ar, this message translates to:
  /// **'المطلوب لوضع الأمور في نصابها'**
  String get desired_resolution;

  /// No description provided for @previous_complaint.
  ///
  /// In ar, this message translates to:
  /// **'هل سبق تقديم شكوى؟'**
  String get previous_complaint;

  /// No description provided for @legal_action_exists.
  ///
  /// In ar, this message translates to:
  /// **'هل توجد قضية/إجراء قانوني؟'**
  String get legal_action_exists;

  /// No description provided for @form_step5_title.
  ///
  /// In ar, this message translates to:
  /// **'المرفقات'**
  String get form_step5_title;

  /// No description provided for @add_attachment.
  ///
  /// In ar, this message translates to:
  /// **'إضافة مرفق'**
  String get add_attachment;

  /// No description provided for @submit_complaint.
  ///
  /// In ar, this message translates to:
  /// **'إرسال الشكوى'**
  String get submit_complaint;

  /// No description provided for @save_draft.
  ///
  /// In ar, this message translates to:
  /// **'حفظ مسودة'**
  String get save_draft;

  /// No description provided for @validation_required.
  ///
  /// In ar, this message translates to:
  /// **'هذا الحقل مطلوب'**
  String get validation_required;

  /// No description provided for @validation_invalid_email.
  ///
  /// In ar, this message translates to:
  /// **'بريد إلكتروني غير صالح'**
  String get validation_invalid_email;

  /// No description provided for @validation_date.
  ///
  /// In ar, this message translates to:
  /// **'تاريخ غير صالح'**
  String get validation_date;

  /// No description provided for @status_new.
  ///
  /// In ar, this message translates to:
  /// **'جديدة'**
  String get status_new;

  /// No description provided for @status_in_review.
  ///
  /// In ar, this message translates to:
  /// **'قيد المراجعة'**
  String get status_in_review;

  /// No description provided for @status_resolved_support.
  ///
  /// In ar, this message translates to:
  /// **'تم الحل (الدعم)'**
  String get status_resolved_support;

  /// No description provided for @status_escalated.
  ///
  /// In ar, this message translates to:
  /// **'محوّلة للتنسيق الأعلى'**
  String get status_escalated;

  /// No description provided for @status_resolved_coord.
  ///
  /// In ar, this message translates to:
  /// **'تم الحل (التنسيق الأعلى)'**
  String get status_resolved_coord;

  /// No description provided for @status_closed.
  ///
  /// In ar, this message translates to:
  /// **'مغلقة'**
  String get status_closed;

  /// No description provided for @status_rejected.
  ///
  /// In ar, this message translates to:
  /// **'مرفوضة'**
  String get status_rejected;

  /// No description provided for @support_inbox.
  ///
  /// In ar, this message translates to:
  /// **'الوارد'**
  String get support_inbox;

  /// No description provided for @assigned_to_me.
  ///
  /// In ar, this message translates to:
  /// **'المُسندة إليّ'**
  String get assigned_to_me;

  /// No description provided for @resolved_by_support.
  ///
  /// In ar, this message translates to:
  /// **'تم حلها (الدعم)'**
  String get resolved_by_support;

  /// No description provided for @escalated_list.
  ///
  /// In ar, this message translates to:
  /// **'المحوّلة'**
  String get escalated_list;

  /// No description provided for @action_assign_to_me.
  ///
  /// In ar, this message translates to:
  /// **'إسناد لنفسي'**
  String get action_assign_to_me;

  /// No description provided for @action_add_note.
  ///
  /// In ar, this message translates to:
  /// **'إضافة ملاحظة'**
  String get action_add_note;

  /// No description provided for @action_resolve.
  ///
  /// In ar, this message translates to:
  /// **'تأشير تم الحل'**
  String get action_resolve;

  /// No description provided for @action_escalate.
  ///
  /// In ar, this message translates to:
  /// **'تحويل للتنسيق الأعلى'**
  String get action_escalate;

  /// No description provided for @action_close.
  ///
  /// In ar, this message translates to:
  /// **'إغلاق'**
  String get action_close;

  /// No description provided for @action_reject.
  ///
  /// In ar, this message translates to:
  /// **'رفض'**
  String get action_reject;

  /// No description provided for @possible_duplicate.
  ///
  /// In ar, this message translates to:
  /// **'شكوى محتمل تكرارها'**
  String get possible_duplicate;

  /// No description provided for @duplicate_found.
  ///
  /// In ar, this message translates to:
  /// **'تم رصد شكوى مشابهة في نفس التصنيف/الجهة'**
  String get duplicate_found;

  /// No description provided for @empty_state_no_complaints.
  ///
  /// In ar, this message translates to:
  /// **'لا توجد شكاوى بعد'**
  String get empty_state_no_complaints;

  /// No description provided for @empty_state_try_create.
  ///
  /// In ar, this message translates to:
  /// **'ابدأ بإنشاء شكوى جديدة من الزر أدناه'**
  String get empty_state_try_create;

  /// No description provided for @report_daily_title.
  ///
  /// In ar, this message translates to:
  /// **'التقرير اليومي'**
  String get report_daily_title;

  /// No description provided for @report_generate_pdf.
  ///
  /// In ar, this message translates to:
  /// **'توليد PDF'**
  String get report_generate_pdf;

  /// No description provided for @report_saved.
  ///
  /// In ar, this message translates to:
  /// **'تم حفظ التقرير'**
  String get report_saved;

  /// No description provided for @report_share.
  ///
  /// In ar, this message translates to:
  /// **'مشاركة التقرير'**
  String get report_share;

  /// No description provided for @export_json.
  ///
  /// In ar, this message translates to:
  /// **'تصدير JSON'**
  String get export_json;

  /// No description provided for @import_json.
  ///
  /// In ar, this message translates to:
  /// **'استيراد JSON'**
  String get import_json;

  /// No description provided for @export_done.
  ///
  /// In ar, this message translates to:
  /// **'تم التصدير بنجاح'**
  String get export_done;

  /// No description provided for @import_done.
  ///
  /// In ar, this message translates to:
  /// **'تم الاستيراد بنجاح'**
  String get import_done;

  /// No description provided for @welcome_message.
  ///
  /// In ar, this message translates to:
  /// **'مرحباً بك'**
  String get welcome_message;

  /// No description provided for @welcome_subtitle.
  ///
  /// In ar, this message translates to:
  /// **'يمكنك تقديم شكوى جديدة أو متابعة شكاويك السابقة'**
  String get welcome_subtitle;

  /// No description provided for @new_complaint.
  ///
  /// In ar, this message translates to:
  /// **'شكوى جديدة'**
  String get new_complaint;

  /// No description provided for @new_complaint_subtitle.
  ///
  /// In ar, this message translates to:
  /// **'تقديم شكوى جديدة'**
  String get new_complaint_subtitle;

  /// No description provided for @my_complaints_subtitle.
  ///
  /// In ar, this message translates to:
  /// **'عرض الشكاوى المقدمة'**
  String get my_complaints_subtitle;

  /// No description provided for @export_import.
  ///
  /// In ar, this message translates to:
  /// **'تصدير/استيراد'**
  String get export_import;

  /// No description provided for @data_management.
  ///
  /// In ar, this message translates to:
  /// **'إدارة البيانات'**
  String get data_management;

  /// No description provided for @app_settings.
  ///
  /// In ar, this message translates to:
  /// **'إعدادات التطبيق'**
  String get app_settings;

  /// No description provided for @login.
  ///
  /// In ar, this message translates to:
  /// **'تسجيل الدخول'**
  String get login;

  /// No description provided for @previous.
  ///
  /// In ar, this message translates to:
  /// **'السابق'**
  String get previous;

  /// No description provided for @next.
  ///
  /// In ar, this message translates to:
  /// **'التالي'**
  String get next;

  /// No description provided for @step_progress.
  ///
  /// In ar, this message translates to:
  /// **'الخطوة {current} من {total}'**
  String step_progress(Object current, Object total);

  /// No description provided for @today_received.
  ///
  /// In ar, this message translates to:
  /// **'الواردة اليوم'**
  String get today_received;

  /// No description provided for @resolved.
  ///
  /// In ar, this message translates to:
  /// **'المحلولة'**
  String get resolved;

  /// No description provided for @transferred.
  ///
  /// In ar, this message translates to:
  /// **'المحولة'**
  String get transferred;

  /// No description provided for @new_and_reviewing.
  ///
  /// In ar, this message translates to:
  /// **'شكاوى جديدة وقيد المراجعة'**
  String get new_and_reviewing;

  /// No description provided for @comprehensive_summary.
  ///
  /// In ar, this message translates to:
  /// **'الملخص الشامل'**
  String get comprehensive_summary;

  /// No description provided for @total_complaints.
  ///
  /// In ar, this message translates to:
  /// **'إجمالي الشكاوى'**
  String get total_complaints;

  /// No description provided for @resolution_rate.
  ///
  /// In ar, this message translates to:
  /// **'معدل الحل'**
  String get resolution_rate;

  /// No description provided for @avg_resolution_time.
  ///
  /// In ar, this message translates to:
  /// **'متوسط وقت الحل'**
  String get avg_resolution_time;

  /// No description provided for @system_subtitle.
  ///
  /// In ar, this message translates to:
  /// **'نظام إدارة الشكاوى المحلي'**
  String get system_subtitle;

  /// No description provided for @pin_required.
  ///
  /// In ar, this message translates to:
  /// **'يتطلب رمز PIN'**
  String get pin_required;

  /// No description provided for @welcome_role.
  ///
  /// In ar, this message translates to:
  /// **'مرحباً بك في {role}'**
  String welcome_role(Object role);
}

class _SDelegate extends LocalizationsDelegate<S> {
  const _SDelegate();

  @override
  Future<S> load(Locale locale) {
    return SynchronousFuture<S>(lookupS(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar'].contains(locale.languageCode);

  @override
  bool shouldReload(_SDelegate old) => false;
}

S lookupS(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return SAr();
  }

  throw FlutterError(
      'S.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
