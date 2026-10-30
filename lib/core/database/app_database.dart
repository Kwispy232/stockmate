import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

part 'app_database.g.dart';

class StoredInventories extends Table {
  TextColumn get id => text()();
  TextColumn get payload => text()();
  DateTimeColumn get updatedAt => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}

class PendingSubmissions extends Table {
  TextColumn get inventoryId => text().references(StoredInventories, #id)();

  @override
  Set<Column> get primaryKey => {inventoryId};
}

class CachedCatalogs extends Table {
  IntColumn get id => integer()();
  TextColumn get payload => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DriftDatabase(tables: [StoredInventories, PendingSubmissions, CachedCatalogs])
class AppDatabase extends _$AppDatabase {
  AppDatabase(String workspace) : super(driftDatabase(name: 'stockmate_$workspace'));
  AppDatabase.forTesting(super.connection);

  @override
  int get schemaVersion => 1;
}
