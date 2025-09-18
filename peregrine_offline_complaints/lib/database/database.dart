// Simple placeholder for database until build_runner completes
// import 'dart:io';
// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart' as p;
// import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';
// import 'package:sqlite3/sqlite3.dart';
import 'package:json_annotation/json_annotation.dart';

// import 'tables.dart';

// part 'database.g.dart';

enum ComplaintStatus {
  @JsonValue('NEW')
  newComplaint,
  @JsonValue('IN_REVIEW')
  inReview,
  @JsonValue('RESOLVED_SUPPORT')
  resolvedSupport,
  @JsonValue('ESCALATED')
  escalated,
  @JsonValue('RESOLVED_COORD')
  resolvedCoordination,
  @JsonValue('CLOSED')
  closed,
  @JsonValue('REJECTED')
  rejected,
}

enum UserRole {
  @JsonValue('CLIENT')
  client,
  @JsonValue('SUPPORT')
  support,
  @JsonValue('COORDINATION')
  coordination,
}

enum ActionType {
  @JsonValue('CREATED')
  created,
  @JsonValue('ASSIGNED')
  assigned,
  @JsonValue('RESOLVED')
  resolved,
  @JsonValue('ESCALATED')
  escalated,
  @JsonValue('CLOSED')
  closed,
  @JsonValue('REJECTED')
  rejected,
  @JsonValue('UPDATED')
  updated,
}

// Placeholder class until build_runner completes
class AppDatabase {
  // TODO: Implement proper database after build_runner completes
}