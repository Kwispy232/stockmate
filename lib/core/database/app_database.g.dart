// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $StoredInventoriesTable extends StoredInventories
    with TableInfo<$StoredInventoriesTable, StoredInventory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StoredInventoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, payload, updatedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'stored_inventories';
  @override
  VerificationContext validateIntegrity(
    Insertable<StoredInventory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StoredInventory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StoredInventory(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $StoredInventoriesTable createAlias(String alias) {
    return $StoredInventoriesTable(attachedDatabase, alias);
  }
}

class StoredInventory extends DataClass implements Insertable<StoredInventory> {
  final String id;
  final String payload;
  final DateTime updatedAt;
  const StoredInventory({
    required this.id,
    required this.payload,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['payload'] = Variable<String>(payload);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  StoredInventoriesCompanion toCompanion(bool nullToAbsent) {
    return StoredInventoriesCompanion(
      id: Value(id),
      payload: Value(payload),
      updatedAt: Value(updatedAt),
    );
  }

  factory StoredInventory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StoredInventory(
      id: serializer.fromJson<String>(json['id']),
      payload: serializer.fromJson<String>(json['payload']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'payload': serializer.toJson<String>(payload),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  StoredInventory copyWith({
    String? id,
    String? payload,
    DateTime? updatedAt,
  }) => StoredInventory(
    id: id ?? this.id,
    payload: payload ?? this.payload,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  StoredInventory copyWithCompanion(StoredInventoriesCompanion data) {
    return StoredInventory(
      id: data.id.present ? data.id.value : this.id,
      payload: data.payload.present ? data.payload.value : this.payload,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StoredInventory(')
          ..write('id: $id, ')
          ..write('payload: $payload, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, payload, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StoredInventory &&
          other.id == this.id &&
          other.payload == this.payload &&
          other.updatedAt == this.updatedAt);
}

class StoredInventoriesCompanion extends UpdateCompanion<StoredInventory> {
  final Value<String> id;
  final Value<String> payload;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const StoredInventoriesCompanion({
    this.id = const Value.absent(),
    this.payload = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StoredInventoriesCompanion.insert({
    required String id,
    required String payload,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       payload = Value(payload),
       updatedAt = Value(updatedAt);
  static Insertable<StoredInventory> custom({
    Expression<String>? id,
    Expression<String>? payload,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (payload != null) 'payload': payload,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StoredInventoriesCompanion copyWith({
    Value<String>? id,
    Value<String>? payload,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return StoredInventoriesCompanion(
      id: id ?? this.id,
      payload: payload ?? this.payload,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StoredInventoriesCompanion(')
          ..write('id: $id, ')
          ..write('payload: $payload, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PendingSubmissionsTable extends PendingSubmissions
    with TableInfo<$PendingSubmissionsTable, PendingSubmission> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PendingSubmissionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _inventoryIdMeta = const VerificationMeta(
    'inventoryId',
  );
  @override
  late final GeneratedColumn<String> inventoryId = GeneratedColumn<String>(
    'inventory_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES stored_inventories (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [inventoryId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'pending_submissions';
  @override
  VerificationContext validateIntegrity(
    Insertable<PendingSubmission> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('inventory_id')) {
      context.handle(
        _inventoryIdMeta,
        inventoryId.isAcceptableOrUnknown(
          data['inventory_id']!,
          _inventoryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_inventoryIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {inventoryId};
  @override
  PendingSubmission map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PendingSubmission(
      inventoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}inventory_id'],
      )!,
    );
  }

  @override
  $PendingSubmissionsTable createAlias(String alias) {
    return $PendingSubmissionsTable(attachedDatabase, alias);
  }
}

class PendingSubmission extends DataClass
    implements Insertable<PendingSubmission> {
  final String inventoryId;
  const PendingSubmission({required this.inventoryId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['inventory_id'] = Variable<String>(inventoryId);
    return map;
  }

  PendingSubmissionsCompanion toCompanion(bool nullToAbsent) {
    return PendingSubmissionsCompanion(inventoryId: Value(inventoryId));
  }

  factory PendingSubmission.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PendingSubmission(
      inventoryId: serializer.fromJson<String>(json['inventoryId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'inventoryId': serializer.toJson<String>(inventoryId),
    };
  }

  PendingSubmission copyWith({String? inventoryId}) =>
      PendingSubmission(inventoryId: inventoryId ?? this.inventoryId);
  PendingSubmission copyWithCompanion(PendingSubmissionsCompanion data) {
    return PendingSubmission(
      inventoryId: data.inventoryId.present
          ? data.inventoryId.value
          : this.inventoryId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PendingSubmission(')
          ..write('inventoryId: $inventoryId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => inventoryId.hashCode;
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PendingSubmission && other.inventoryId == this.inventoryId);
}

class PendingSubmissionsCompanion extends UpdateCompanion<PendingSubmission> {
  final Value<String> inventoryId;
  final Value<int> rowid;
  const PendingSubmissionsCompanion({
    this.inventoryId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PendingSubmissionsCompanion.insert({
    required String inventoryId,
    this.rowid = const Value.absent(),
  }) : inventoryId = Value(inventoryId);
  static Insertable<PendingSubmission> custom({
    Expression<String>? inventoryId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (inventoryId != null) 'inventory_id': inventoryId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PendingSubmissionsCompanion copyWith({
    Value<String>? inventoryId,
    Value<int>? rowid,
  }) {
    return PendingSubmissionsCompanion(
      inventoryId: inventoryId ?? this.inventoryId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (inventoryId.present) {
      map['inventory_id'] = Variable<String>(inventoryId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PendingSubmissionsCompanion(')
          ..write('inventoryId: $inventoryId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CachedCatalogsTable extends CachedCatalogs
    with TableInfo<$CachedCatalogsTable, CachedCatalog> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CachedCatalogsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _payloadMeta = const VerificationMeta(
    'payload',
  );
  @override
  late final GeneratedColumn<String> payload = GeneratedColumn<String>(
    'payload',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, payload];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cached_catalogs';
  @override
  VerificationContext validateIntegrity(
    Insertable<CachedCatalog> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('payload')) {
      context.handle(
        _payloadMeta,
        payload.isAcceptableOrUnknown(data['payload']!, _payloadMeta),
      );
    } else if (isInserting) {
      context.missing(_payloadMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CachedCatalog map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CachedCatalog(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      payload: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}payload'],
      )!,
    );
  }

  @override
  $CachedCatalogsTable createAlias(String alias) {
    return $CachedCatalogsTable(attachedDatabase, alias);
  }
}

class CachedCatalog extends DataClass implements Insertable<CachedCatalog> {
  final int id;
  final String payload;
  const CachedCatalog({required this.id, required this.payload});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['payload'] = Variable<String>(payload);
    return map;
  }

  CachedCatalogsCompanion toCompanion(bool nullToAbsent) {
    return CachedCatalogsCompanion(id: Value(id), payload: Value(payload));
  }

  factory CachedCatalog.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CachedCatalog(
      id: serializer.fromJson<int>(json['id']),
      payload: serializer.fromJson<String>(json['payload']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'payload': serializer.toJson<String>(payload),
    };
  }

  CachedCatalog copyWith({int? id, String? payload}) =>
      CachedCatalog(id: id ?? this.id, payload: payload ?? this.payload);
  CachedCatalog copyWithCompanion(CachedCatalogsCompanion data) {
    return CachedCatalog(
      id: data.id.present ? data.id.value : this.id,
      payload: data.payload.present ? data.payload.value : this.payload,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CachedCatalog(')
          ..write('id: $id, ')
          ..write('payload: $payload')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, payload);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CachedCatalog &&
          other.id == this.id &&
          other.payload == this.payload);
}

class CachedCatalogsCompanion extends UpdateCompanion<CachedCatalog> {
  final Value<int> id;
  final Value<String> payload;
  const CachedCatalogsCompanion({
    this.id = const Value.absent(),
    this.payload = const Value.absent(),
  });
  CachedCatalogsCompanion.insert({
    this.id = const Value.absent(),
    required String payload,
  }) : payload = Value(payload);
  static Insertable<CachedCatalog> custom({
    Expression<int>? id,
    Expression<String>? payload,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (payload != null) 'payload': payload,
    });
  }

  CachedCatalogsCompanion copyWith({Value<int>? id, Value<String>? payload}) {
    return CachedCatalogsCompanion(
      id: id ?? this.id,
      payload: payload ?? this.payload,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (payload.present) {
      map['payload'] = Variable<String>(payload.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CachedCatalogsCompanion(')
          ..write('id: $id, ')
          ..write('payload: $payload')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $StoredInventoriesTable storedInventories =
      $StoredInventoriesTable(this);
  late final $PendingSubmissionsTable pendingSubmissions =
      $PendingSubmissionsTable(this);
  late final $CachedCatalogsTable cachedCatalogs = $CachedCatalogsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    storedInventories,
    pendingSubmissions,
    cachedCatalogs,
  ];
}

typedef $$StoredInventoriesTableCreateCompanionBuilder =
    StoredInventoriesCompanion Function({
      required String id,
      required String payload,
      required DateTime updatedAt,
      Value<int> rowid,
    });
typedef $$StoredInventoriesTableUpdateCompanionBuilder =
    StoredInventoriesCompanion Function({
      Value<String> id,
      Value<String> payload,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

final class $$StoredInventoriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $StoredInventoriesTable,
          StoredInventory
        > {
  $$StoredInventoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$PendingSubmissionsTable, List<PendingSubmission>>
  _pendingSubmissionsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.pendingSubmissions,
        aliasName: 'stored_inventories__id__pending_submissions__inventory_id',
      );

  $$PendingSubmissionsTableProcessedTableManager get pendingSubmissionsRefs {
    final manager = $$PendingSubmissionsTableTableManager(
      $_db,
      $_db.pendingSubmissions,
    ).filter((f) => f.inventoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _pendingSubmissionsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StoredInventoriesTableFilterComposer
    extends Composer<_$AppDatabase, $StoredInventoriesTable> {
  $$StoredInventoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> pendingSubmissionsRefs(
    Expression<bool> Function($$PendingSubmissionsTableFilterComposer f) f,
  ) {
    final $$PendingSubmissionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.pendingSubmissions,
      getReferencedColumn: (t) => t.inventoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$PendingSubmissionsTableFilterComposer(
            $db: $db,
            $table: $db.pendingSubmissions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StoredInventoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $StoredInventoriesTable> {
  $$StoredInventoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$StoredInventoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $StoredInventoriesTable> {
  $$StoredInventoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> pendingSubmissionsRefs<T extends Object>(
    Expression<T> Function($$PendingSubmissionsTableAnnotationComposer a) f,
  ) {
    final $$PendingSubmissionsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.pendingSubmissions,
          getReferencedColumn: (t) => t.inventoryId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$PendingSubmissionsTableAnnotationComposer(
                $db: $db,
                $table: $db.pendingSubmissions,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$StoredInventoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StoredInventoriesTable,
          StoredInventory,
          $$StoredInventoriesTableFilterComposer,
          $$StoredInventoriesTableOrderingComposer,
          $$StoredInventoriesTableAnnotationComposer,
          $$StoredInventoriesTableCreateCompanionBuilder,
          $$StoredInventoriesTableUpdateCompanionBuilder,
          (StoredInventory, $$StoredInventoriesTableReferences),
          StoredInventory,
          PrefetchHooks Function({bool pendingSubmissionsRefs})
        > {
  $$StoredInventoriesTableTableManager(
    _$AppDatabase db,
    $StoredInventoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StoredInventoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StoredInventoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StoredInventoriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> payload = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StoredInventoriesCompanion(
                id: id,
                payload: payload,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String payload,
                required DateTime updatedAt,
                Value<int> rowid = const Value.absent(),
              }) => StoredInventoriesCompanion.insert(
                id: id,
                payload: payload,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$StoredInventoriesTable, StoredInventory>(table),
                  $$StoredInventoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({pendingSubmissionsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (pendingSubmissionsRefs) db.pendingSubmissions,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (pendingSubmissionsRefs)
                    await $_getPrefetchedDataByColumns<
                      StoredInventory,
                      $StoredInventoriesTable,
                      PendingSubmission,
                      $PendingSubmissionsTable
                    >(
                      currentTable: table,
                      referencedTable: $$StoredInventoriesTableReferences
                          ._pendingSubmissionsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$StoredInventoriesTableReferences(
                            db,
                            table,
                            p0,
                          ).pendingSubmissionsRefs,
                      currentColumn: 'id',
                      referencedColumn: 'inventory_id',
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$StoredInventoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StoredInventoriesTable,
      StoredInventory,
      $$StoredInventoriesTableFilterComposer,
      $$StoredInventoriesTableOrderingComposer,
      $$StoredInventoriesTableAnnotationComposer,
      $$StoredInventoriesTableCreateCompanionBuilder,
      $$StoredInventoriesTableUpdateCompanionBuilder,
      (StoredInventory, $$StoredInventoriesTableReferences),
      StoredInventory,
      PrefetchHooks Function({bool pendingSubmissionsRefs})
    >;
typedef $$PendingSubmissionsTableCreateCompanionBuilder =
    PendingSubmissionsCompanion Function({
      required String inventoryId,
      Value<int> rowid,
    });
typedef $$PendingSubmissionsTableUpdateCompanionBuilder =
    PendingSubmissionsCompanion Function({
      Value<String> inventoryId,
      Value<int> rowid,
    });

final class $$PendingSubmissionsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $PendingSubmissionsTable,
          PendingSubmission
        > {
  $$PendingSubmissionsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $StoredInventoriesTable _inventoryIdTable(_$AppDatabase db) => db
      .storedInventories
      .createAlias('pending_submissions__inventory_id__stored_inventories__id');

  $$StoredInventoriesTableProcessedTableManager get inventoryId {
    final $_column = $_itemColumn<String>('inventory_id')!;

    final manager = $$StoredInventoriesTableTableManager(
      $_db,
      $_db.storedInventories,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_inventoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$PendingSubmissionsTableFilterComposer
    extends Composer<_$AppDatabase, $PendingSubmissionsTable> {
  $$PendingSubmissionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$StoredInventoriesTableFilterComposer get inventoryId {
    final $$StoredInventoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inventoryId,
      referencedTable: $db.storedInventories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoredInventoriesTableFilterComposer(
            $db: $db,
            $table: $db.storedInventories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PendingSubmissionsTableOrderingComposer
    extends Composer<_$AppDatabase, $PendingSubmissionsTable> {
  $$PendingSubmissionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$StoredInventoriesTableOrderingComposer get inventoryId {
    final $$StoredInventoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.inventoryId,
      referencedTable: $db.storedInventories,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StoredInventoriesTableOrderingComposer(
            $db: $db,
            $table: $db.storedInventories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$PendingSubmissionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $PendingSubmissionsTable> {
  $$PendingSubmissionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  $$StoredInventoriesTableAnnotationComposer get inventoryId {
    final $$StoredInventoriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.inventoryId,
          referencedTable: $db.storedInventories,
          getReferencedColumn: (t) => t.id,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$StoredInventoriesTableAnnotationComposer(
                $db: $db,
                $table: $db.storedInventories,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return composer;
  }
}

class $$PendingSubmissionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PendingSubmissionsTable,
          PendingSubmission,
          $$PendingSubmissionsTableFilterComposer,
          $$PendingSubmissionsTableOrderingComposer,
          $$PendingSubmissionsTableAnnotationComposer,
          $$PendingSubmissionsTableCreateCompanionBuilder,
          $$PendingSubmissionsTableUpdateCompanionBuilder,
          (PendingSubmission, $$PendingSubmissionsTableReferences),
          PendingSubmission,
          PrefetchHooks Function({bool inventoryId})
        > {
  $$PendingSubmissionsTableTableManager(
    _$AppDatabase db,
    $PendingSubmissionsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PendingSubmissionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PendingSubmissionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PendingSubmissionsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> inventoryId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => PendingSubmissionsCompanion(
                inventoryId: inventoryId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String inventoryId,
                Value<int> rowid = const Value.absent(),
              }) => PendingSubmissionsCompanion.insert(
                inventoryId: inventoryId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$PendingSubmissionsTable, PendingSubmission>(
                    table,
                  ),
                  $$PendingSubmissionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({inventoryId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (inventoryId) {
                      state = state.withJoin(
                        currentTable: table,
                        currentColumn: table.inventoryId,
                        referencedTable: $$PendingSubmissionsTableReferences
                            ._inventoryIdTable(db),
                        referencedColumn: $$PendingSubmissionsTableReferences
                            ._inventoryIdTable(db)
                            .id,
                      ) as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$PendingSubmissionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PendingSubmissionsTable,
      PendingSubmission,
      $$PendingSubmissionsTableFilterComposer,
      $$PendingSubmissionsTableOrderingComposer,
      $$PendingSubmissionsTableAnnotationComposer,
      $$PendingSubmissionsTableCreateCompanionBuilder,
      $$PendingSubmissionsTableUpdateCompanionBuilder,
      (PendingSubmission, $$PendingSubmissionsTableReferences),
      PendingSubmission,
      PrefetchHooks Function({bool inventoryId})
    >;
typedef $$CachedCatalogsTableCreateCompanionBuilder =
    CachedCatalogsCompanion Function({Value<int> id, required String payload});
typedef $$CachedCatalogsTableUpdateCompanionBuilder =
    CachedCatalogsCompanion Function({Value<int> id, Value<String> payload});

class $$CachedCatalogsTableFilterComposer
    extends Composer<_$AppDatabase, $CachedCatalogsTable> {
  $$CachedCatalogsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CachedCatalogsTableOrderingComposer
    extends Composer<_$AppDatabase, $CachedCatalogsTable> {
  $$CachedCatalogsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get payload => $composableBuilder(
    column: $table.payload,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CachedCatalogsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CachedCatalogsTable> {
  $$CachedCatalogsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get payload =>
      $composableBuilder(column: $table.payload, builder: (column) => column);
}

class $$CachedCatalogsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CachedCatalogsTable,
          CachedCatalog,
          $$CachedCatalogsTableFilterComposer,
          $$CachedCatalogsTableOrderingComposer,
          $$CachedCatalogsTableAnnotationComposer,
          $$CachedCatalogsTableCreateCompanionBuilder,
          $$CachedCatalogsTableUpdateCompanionBuilder,
          (
            CachedCatalog,
            BaseReferences<_$AppDatabase, $CachedCatalogsTable, CachedCatalog>,
          ),
          CachedCatalog,
          PrefetchHooks Function()
        > {
  $$CachedCatalogsTableTableManager(
    _$AppDatabase db,
    $CachedCatalogsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CachedCatalogsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CachedCatalogsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CachedCatalogsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> payload = const Value.absent(),
          }) => CachedCatalogsCompanion(id: id, payload: payload),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String payload,
          }) => CachedCatalogsCompanion.insert(id: id, payload: payload),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable<$CachedCatalogsTable, CachedCatalog>(table),
                  BaseReferences<
                    _$AppDatabase,
                    $CachedCatalogsTable,
                    CachedCatalog
                  >(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CachedCatalogsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CachedCatalogsTable,
      CachedCatalog,
      $$CachedCatalogsTableFilterComposer,
      $$CachedCatalogsTableOrderingComposer,
      $$CachedCatalogsTableAnnotationComposer,
      $$CachedCatalogsTableCreateCompanionBuilder,
      $$CachedCatalogsTableUpdateCompanionBuilder,
      (
        CachedCatalog,
        BaseReferences<_$AppDatabase, $CachedCatalogsTable, CachedCatalog>,
      ),
      CachedCatalog,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$StoredInventoriesTableTableManager get storedInventories =>
      $$StoredInventoriesTableTableManager(_db, _db.storedInventories);
  $$PendingSubmissionsTableTableManager get pendingSubmissions =>
      $$PendingSubmissionsTableTableManager(_db, _db.pendingSubmissions);
  $$CachedCatalogsTableTableManager get cachedCatalogs =>
      $$CachedCatalogsTableTableManager(_db, _db.cachedCatalogs);
}
