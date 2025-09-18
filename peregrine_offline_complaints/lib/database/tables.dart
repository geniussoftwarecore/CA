import 'package:drift/drift.dart';
import 'database.dart';

@DataClassName('Complaint')
class Complaints extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get firstName => text()();
  TextColumn get middleName => text().nullable()();
  TextColumn get lastName => text()();
  TextColumn get address => text()();
  TextColumn get phone => text()();
  TextColumn get altPhone => text().nullable()();
  TextColumn get whatsapp => text().nullable()();
  TextColumn get telegram => text().nullable()();
  TextColumn get email => text().nullable()();
  
  // On behalf information
  TextColumn get onBehalfOf => text().withDefault(const Constant('self'))(); // self, organization, other
  TextColumn get behalfName => text().nullable()();
  TextColumn get behalfAddress => text().nullable()();
  TextColumn get behalfPhone => text().nullable()();
  TextColumn get behalfWhatsapp => text().nullable()();
  TextColumn get behalfTelegram => text().nullable()();
  TextColumn get relation => text().nullable()();
  
  // Complaint details
  IntColumn get categoryId => integer().references(Categories, #id)();
  IntColumn get authorityId => integer().references(Authorities, #id).nullable()();
  TextColumn get requestType => text().nullable()();
  DateTimeColumn get incidentDate => dateTime().nullable()();
  DateTimeColumn get awarenessDate => dateTime().nullable()();
  TextColumn get summary => text()();
  BoolColumn get authorityOfferProvided => boolean().withDefault(const Constant(false))();
  TextColumn get desiredResolution => text().nullable()();
  BoolColumn get previousComplaint => boolean().withDefault(const Constant(false))();
  BoolColumn get legalActionExists => boolean().withDefault(const Constant(false))();
  TextColumn get attachmentNotes => text().nullable()();
  
  // Status and workflow
  TextColumn get status => textEnum<ComplaintStatus>().withDefault(const Constant('NEW'))();
  IntColumn get assignedToUserId => integer().references(Users, #id).nullable()();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get resolvedAt => dateTime().nullable()();
  
  // Metadata
  TextColumn get submissionId => text().unique()(); // UUID for tracking
  BoolColumn get isDuplicate => boolean().withDefault(const Constant(false))();
  TextColumn get duplicateReason => text().nullable()();
}

@DataClassName('Category')
class Categories extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nameAr => text()();
  TextColumn get groupAr => text()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('Authority')
class Authorities extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get nameAr => text()();
  IntColumn get categoryId => integer().references(Categories, #id)();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('Attachment')
class Attachments extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get complaintId => integer().references(Complaints, #id)();
  TextColumn get originalName => text()();
  TextColumn get storedPath => text()();
  TextColumn get mimeType => text()();
  IntColumn get fileSize => integer()();
  DateTimeColumn get uploadedAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('ActionLog')
class ActionsLog extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get complaintId => integer().references(Complaints, #id)();
  IntColumn get userId => integer().references(Users, #id).nullable()();
  TextColumn get actionType => textEnum<ActionType>()();
  TextColumn get note => text().nullable()();
  DateTimeColumn get happenedAt => dateTime().withDefault(currentDateAndTime)();
}

@DataClassName('User')
class Users extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get role => textEnum<UserRole>()();
  TextColumn get pinHash => text()();
  TextColumn get name => text().nullable()();
  BoolColumn get isActive => boolean().withDefault(const Constant(true))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get lastLoginAt => dateTime().nullable()();
}