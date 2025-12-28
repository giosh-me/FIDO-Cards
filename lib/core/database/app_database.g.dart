// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CardsTable extends Cards with TableInfo<$CardsTable, FidoCard> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _displayNameMeta =
      const VerificationMeta('displayName');
  @override
  late final GeneratedColumn<String> displayName = GeneratedColumn<String>(
      'display_name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 100),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _brandIdMeta =
      const VerificationMeta('brandId');
  @override
  late final GeneratedColumn<String> brandId = GeneratedColumn<String>(
      'brand_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _barcodeTypeMeta =
      const VerificationMeta('barcodeType');
  @override
  late final GeneratedColumn<String> barcodeType = GeneratedColumn<String>(
      'barcode_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _barcodeValueMeta =
      const VerificationMeta('barcodeValue');
  @override
  late final GeneratedColumn<String> barcodeValue = GeneratedColumn<String>(
      'barcode_value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isFavoriteMeta =
      const VerificationMeta('isFavorite');
  @override
  late final GeneratedColumn<bool> isFavorite = GeneratedColumn<bool>(
      'is_favorite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_favorite" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime,
      requiredDuringInsert: false,
      defaultValue: currentDateAndTime);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<int> syncStatus = GeneratedColumn<int>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  List<GeneratedColumn> get $columns => [
        id,
        displayName,
        brandId,
        barcodeType,
        barcodeValue,
        isFavorite,
        createdAt,
        updatedAt,
        syncStatus
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'cards';
  @override
  VerificationContext validateIntegrity(Insertable<FidoCard> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('display_name')) {
      context.handle(
          _displayNameMeta,
          displayName.isAcceptableOrUnknown(
              data['display_name']!, _displayNameMeta));
    } else if (isInserting) {
      context.missing(_displayNameMeta);
    }
    if (data.containsKey('brand_id')) {
      context.handle(_brandIdMeta,
          brandId.isAcceptableOrUnknown(data['brand_id']!, _brandIdMeta));
    }
    if (data.containsKey('barcode_type')) {
      context.handle(
          _barcodeTypeMeta,
          barcodeType.isAcceptableOrUnknown(
              data['barcode_type']!, _barcodeTypeMeta));
    } else if (isInserting) {
      context.missing(_barcodeTypeMeta);
    }
    if (data.containsKey('barcode_value')) {
      context.handle(
          _barcodeValueMeta,
          barcodeValue.isAcceptableOrUnknown(
              data['barcode_value']!, _barcodeValueMeta));
    } else if (isInserting) {
      context.missing(_barcodeValueMeta);
    }
    if (data.containsKey('is_favorite')) {
      context.handle(
          _isFavoriteMeta,
          isFavorite.isAcceptableOrUnknown(
              data['is_favorite']!, _isFavoriteMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  FidoCard map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return FidoCard(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      displayName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}display_name'])!,
      brandId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}brand_id']),
      barcodeType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode_type'])!,
      barcodeValue: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode_value'])!,
      isFavorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_favorite'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sync_status'])!,
    );
  }

  @override
  $CardsTable createAlias(String alias) {
    return $CardsTable(attachedDatabase, alias);
  }
}

class FidoCard extends DataClass implements Insertable<FidoCard> {
  final String id;
  final String displayName;
  final String? brandId;
  final String barcodeType;
  final String barcodeValue;
  final bool isFavorite;
  final DateTime createdAt;
  final DateTime? updatedAt;
  final int syncStatus;
  const FidoCard(
      {required this.id,
      required this.displayName,
      this.brandId,
      required this.barcodeType,
      required this.barcodeValue,
      required this.isFavorite,
      required this.createdAt,
      this.updatedAt,
      required this.syncStatus});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['display_name'] = Variable<String>(displayName);
    if (!nullToAbsent || brandId != null) {
      map['brand_id'] = Variable<String>(brandId);
    }
    map['barcode_type'] = Variable<String>(barcodeType);
    map['barcode_value'] = Variable<String>(barcodeValue);
    map['is_favorite'] = Variable<bool>(isFavorite);
    map['created_at'] = Variable<DateTime>(createdAt);
    if (!nullToAbsent || updatedAt != null) {
      map['updated_at'] = Variable<DateTime>(updatedAt);
    }
    map['sync_status'] = Variable<int>(syncStatus);
    return map;
  }

  CardsCompanion toCompanion(bool nullToAbsent) {
    return CardsCompanion(
      id: Value(id),
      displayName: Value(displayName),
      brandId: brandId == null && nullToAbsent
          ? const Value.absent()
          : Value(brandId),
      barcodeType: Value(barcodeType),
      barcodeValue: Value(barcodeValue),
      isFavorite: Value(isFavorite),
      createdAt: Value(createdAt),
      updatedAt: updatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(updatedAt),
      syncStatus: Value(syncStatus),
    );
  }

  factory FidoCard.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return FidoCard(
      id: serializer.fromJson<String>(json['id']),
      displayName: serializer.fromJson<String>(json['displayName']),
      brandId: serializer.fromJson<String?>(json['brandId']),
      barcodeType: serializer.fromJson<String>(json['barcodeType']),
      barcodeValue: serializer.fromJson<String>(json['barcodeValue']),
      isFavorite: serializer.fromJson<bool>(json['isFavorite']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime?>(json['updatedAt']),
      syncStatus: serializer.fromJson<int>(json['syncStatus']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'displayName': serializer.toJson<String>(displayName),
      'brandId': serializer.toJson<String?>(brandId),
      'barcodeType': serializer.toJson<String>(barcodeType),
      'barcodeValue': serializer.toJson<String>(barcodeValue),
      'isFavorite': serializer.toJson<bool>(isFavorite),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime?>(updatedAt),
      'syncStatus': serializer.toJson<int>(syncStatus),
    };
  }

  FidoCard copyWith(
          {String? id,
          String? displayName,
          Value<String?> brandId = const Value.absent(),
          String? barcodeType,
          String? barcodeValue,
          bool? isFavorite,
          DateTime? createdAt,
          Value<DateTime?> updatedAt = const Value.absent(),
          int? syncStatus}) =>
      FidoCard(
        id: id ?? this.id,
        displayName: displayName ?? this.displayName,
        brandId: brandId.present ? brandId.value : this.brandId,
        barcodeType: barcodeType ?? this.barcodeType,
        barcodeValue: barcodeValue ?? this.barcodeValue,
        isFavorite: isFavorite ?? this.isFavorite,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt.present ? updatedAt.value : this.updatedAt,
        syncStatus: syncStatus ?? this.syncStatus,
      );
  FidoCard copyWithCompanion(CardsCompanion data) {
    return FidoCard(
      id: data.id.present ? data.id.value : this.id,
      displayName:
          data.displayName.present ? data.displayName.value : this.displayName,
      brandId: data.brandId.present ? data.brandId.value : this.brandId,
      barcodeType:
          data.barcodeType.present ? data.barcodeType.value : this.barcodeType,
      barcodeValue: data.barcodeValue.present
          ? data.barcodeValue.value
          : this.barcodeValue,
      isFavorite:
          data.isFavorite.present ? data.isFavorite.value : this.isFavorite,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
    );
  }

  @override
  String toString() {
    return (StringBuffer('FidoCard(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('brandId: $brandId, ')
          ..write('barcodeType: $barcodeType, ')
          ..write('barcodeValue: $barcodeValue, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, displayName, brandId, barcodeType,
      barcodeValue, isFavorite, createdAt, updatedAt, syncStatus);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is FidoCard &&
          other.id == this.id &&
          other.displayName == this.displayName &&
          other.brandId == this.brandId &&
          other.barcodeType == this.barcodeType &&
          other.barcodeValue == this.barcodeValue &&
          other.isFavorite == this.isFavorite &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.syncStatus == this.syncStatus);
}

class CardsCompanion extends UpdateCompanion<FidoCard> {
  final Value<String> id;
  final Value<String> displayName;
  final Value<String?> brandId;
  final Value<String> barcodeType;
  final Value<String> barcodeValue;
  final Value<bool> isFavorite;
  final Value<DateTime> createdAt;
  final Value<DateTime?> updatedAt;
  final Value<int> syncStatus;
  final Value<int> rowid;
  const CardsCompanion({
    this.id = const Value.absent(),
    this.displayName = const Value.absent(),
    this.brandId = const Value.absent(),
    this.barcodeType = const Value.absent(),
    this.barcodeValue = const Value.absent(),
    this.isFavorite = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CardsCompanion.insert({
    required String id,
    required String displayName,
    this.brandId = const Value.absent(),
    required String barcodeType,
    required String barcodeValue,
    this.isFavorite = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        displayName = Value(displayName),
        barcodeType = Value(barcodeType),
        barcodeValue = Value(barcodeValue);
  static Insertable<FidoCard> custom({
    Expression<String>? id,
    Expression<String>? displayName,
    Expression<String>? brandId,
    Expression<String>? barcodeType,
    Expression<String>? barcodeValue,
    Expression<bool>? isFavorite,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? syncStatus,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (displayName != null) 'display_name': displayName,
      if (brandId != null) 'brand_id': brandId,
      if (barcodeType != null) 'barcode_type': barcodeType,
      if (barcodeValue != null) 'barcode_value': barcodeValue,
      if (isFavorite != null) 'is_favorite': isFavorite,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CardsCompanion copyWith(
      {Value<String>? id,
      Value<String>? displayName,
      Value<String?>? brandId,
      Value<String>? barcodeType,
      Value<String>? barcodeValue,
      Value<bool>? isFavorite,
      Value<DateTime>? createdAt,
      Value<DateTime?>? updatedAt,
      Value<int>? syncStatus,
      Value<int>? rowid}) {
    return CardsCompanion(
      id: id ?? this.id,
      displayName: displayName ?? this.displayName,
      brandId: brandId ?? this.brandId,
      barcodeType: barcodeType ?? this.barcodeType,
      barcodeValue: barcodeValue ?? this.barcodeValue,
      isFavorite: isFavorite ?? this.isFavorite,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      syncStatus: syncStatus ?? this.syncStatus,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (displayName.present) {
      map['display_name'] = Variable<String>(displayName.value);
    }
    if (brandId.present) {
      map['brand_id'] = Variable<String>(brandId.value);
    }
    if (barcodeType.present) {
      map['barcode_type'] = Variable<String>(barcodeType.value);
    }
    if (barcodeValue.present) {
      map['barcode_value'] = Variable<String>(barcodeValue.value);
    }
    if (isFavorite.present) {
      map['is_favorite'] = Variable<bool>(isFavorite.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<int>(syncStatus.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardsCompanion(')
          ..write('id: $id, ')
          ..write('displayName: $displayName, ')
          ..write('brandId: $brandId, ')
          ..write('barcodeType: $barcodeType, ')
          ..write('barcodeValue: $barcodeValue, ')
          ..write('isFavorite: $isFavorite, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $BrandsTable extends Brands with TableInfo<$BrandsTable, Brand> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $BrandsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _logoAssetMeta =
      const VerificationMeta('logoAsset');
  @override
  late final GeneratedColumn<String> logoAsset = GeneratedColumn<String>(
      'logo_asset', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _suggestedBarcodeTypesMeta =
      const VerificationMeta('suggestedBarcodeTypes');
  @override
  late final GeneratedColumn<String> suggestedBarcodeTypes =
      GeneratedColumn<String>('suggested_barcode_types', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('IT'));
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, logoAsset, suggestedBarcodeTypes, country];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'brands';
  @override
  VerificationContext validateIntegrity(Insertable<Brand> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('logo_asset')) {
      context.handle(_logoAssetMeta,
          logoAsset.isAcceptableOrUnknown(data['logo_asset']!, _logoAssetMeta));
    }
    if (data.containsKey('suggested_barcode_types')) {
      context.handle(
          _suggestedBarcodeTypesMeta,
          suggestedBarcodeTypes.isAcceptableOrUnknown(
              data['suggested_barcode_types']!, _suggestedBarcodeTypesMeta));
    } else if (isInserting) {
      context.missing(_suggestedBarcodeTypesMeta);
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Brand map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Brand(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      logoAsset: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}logo_asset']),
      suggestedBarcodeTypes: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}suggested_barcode_types'])!,
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country'])!,
    );
  }

  @override
  $BrandsTable createAlias(String alias) {
    return $BrandsTable(attachedDatabase, alias);
  }
}

class Brand extends DataClass implements Insertable<Brand> {
  final String id;
  final String name;
  final String? logoAsset;
  final String suggestedBarcodeTypes;
  final String country;
  const Brand(
      {required this.id,
      required this.name,
      this.logoAsset,
      required this.suggestedBarcodeTypes,
      required this.country});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || logoAsset != null) {
      map['logo_asset'] = Variable<String>(logoAsset);
    }
    map['suggested_barcode_types'] = Variable<String>(suggestedBarcodeTypes);
    map['country'] = Variable<String>(country);
    return map;
  }

  BrandsCompanion toCompanion(bool nullToAbsent) {
    return BrandsCompanion(
      id: Value(id),
      name: Value(name),
      logoAsset: logoAsset == null && nullToAbsent
          ? const Value.absent()
          : Value(logoAsset),
      suggestedBarcodeTypes: Value(suggestedBarcodeTypes),
      country: Value(country),
    );
  }

  factory Brand.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Brand(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      logoAsset: serializer.fromJson<String?>(json['logoAsset']),
      suggestedBarcodeTypes:
          serializer.fromJson<String>(json['suggestedBarcodeTypes']),
      country: serializer.fromJson<String>(json['country']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'logoAsset': serializer.toJson<String?>(logoAsset),
      'suggestedBarcodeTypes': serializer.toJson<String>(suggestedBarcodeTypes),
      'country': serializer.toJson<String>(country),
    };
  }

  Brand copyWith(
          {String? id,
          String? name,
          Value<String?> logoAsset = const Value.absent(),
          String? suggestedBarcodeTypes,
          String? country}) =>
      Brand(
        id: id ?? this.id,
        name: name ?? this.name,
        logoAsset: logoAsset.present ? logoAsset.value : this.logoAsset,
        suggestedBarcodeTypes:
            suggestedBarcodeTypes ?? this.suggestedBarcodeTypes,
        country: country ?? this.country,
      );
  Brand copyWithCompanion(BrandsCompanion data) {
    return Brand(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      logoAsset: data.logoAsset.present ? data.logoAsset.value : this.logoAsset,
      suggestedBarcodeTypes: data.suggestedBarcodeTypes.present
          ? data.suggestedBarcodeTypes.value
          : this.suggestedBarcodeTypes,
      country: data.country.present ? data.country.value : this.country,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Brand(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('logoAsset: $logoAsset, ')
          ..write('suggestedBarcodeTypes: $suggestedBarcodeTypes, ')
          ..write('country: $country')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, logoAsset, suggestedBarcodeTypes, country);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Brand &&
          other.id == this.id &&
          other.name == this.name &&
          other.logoAsset == this.logoAsset &&
          other.suggestedBarcodeTypes == this.suggestedBarcodeTypes &&
          other.country == this.country);
}

class BrandsCompanion extends UpdateCompanion<Brand> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> logoAsset;
  final Value<String> suggestedBarcodeTypes;
  final Value<String> country;
  final Value<int> rowid;
  const BrandsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.logoAsset = const Value.absent(),
    this.suggestedBarcodeTypes = const Value.absent(),
    this.country = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  BrandsCompanion.insert({
    required String id,
    required String name,
    this.logoAsset = const Value.absent(),
    required String suggestedBarcodeTypes,
    this.country = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        suggestedBarcodeTypes = Value(suggestedBarcodeTypes);
  static Insertable<Brand> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? logoAsset,
    Expression<String>? suggestedBarcodeTypes,
    Expression<String>? country,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (logoAsset != null) 'logo_asset': logoAsset,
      if (suggestedBarcodeTypes != null)
        'suggested_barcode_types': suggestedBarcodeTypes,
      if (country != null) 'country': country,
      if (rowid != null) 'rowid': rowid,
    });
  }

  BrandsCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? logoAsset,
      Value<String>? suggestedBarcodeTypes,
      Value<String>? country,
      Value<int>? rowid}) {
    return BrandsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      logoAsset: logoAsset ?? this.logoAsset,
      suggestedBarcodeTypes:
          suggestedBarcodeTypes ?? this.suggestedBarcodeTypes,
      country: country ?? this.country,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (logoAsset.present) {
      map['logo_asset'] = Variable<String>(logoAsset.value);
    }
    if (suggestedBarcodeTypes.present) {
      map['suggested_barcode_types'] =
          Variable<String>(suggestedBarcodeTypes.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('BrandsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('logoAsset: $logoAsset, ')
          ..write('suggestedBarcodeTypes: $suggestedBarcodeTypes, ')
          ..write('country: $country, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CardsTable cards = $CardsTable(this);
  late final $BrandsTable brands = $BrandsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cards, brands];
}

typedef $$CardsTableCreateCompanionBuilder = CardsCompanion Function({
  required String id,
  required String displayName,
  Value<String?> brandId,
  required String barcodeType,
  required String barcodeValue,
  Value<bool> isFavorite,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> syncStatus,
  Value<int> rowid,
});
typedef $$CardsTableUpdateCompanionBuilder = CardsCompanion Function({
  Value<String> id,
  Value<String> displayName,
  Value<String?> brandId,
  Value<String> barcodeType,
  Value<String> barcodeValue,
  Value<bool> isFavorite,
  Value<DateTime> createdAt,
  Value<DateTime?> updatedAt,
  Value<int> syncStatus,
  Value<int> rowid,
});

class $$CardsTableFilterComposer extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get brandId => $composableBuilder(
      column: $table.brandId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barcodeType => $composableBuilder(
      column: $table.barcodeType, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barcodeValue => $composableBuilder(
      column: $table.barcodeValue, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isFavorite => $composableBuilder(
      column: $table.isFavorite, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));
}

class $$CardsTableOrderingComposer
    extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get brandId => $composableBuilder(
      column: $table.brandId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barcodeType => $composableBuilder(
      column: $table.barcodeType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barcodeValue => $composableBuilder(
      column: $table.barcodeValue,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isFavorite => $composableBuilder(
      column: $table.isFavorite, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));
}

class $$CardsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CardsTable> {
  $$CardsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get displayName => $composableBuilder(
      column: $table.displayName, builder: (column) => column);

  GeneratedColumn<String> get brandId =>
      $composableBuilder(column: $table.brandId, builder: (column) => column);

  GeneratedColumn<String> get barcodeType => $composableBuilder(
      column: $table.barcodeType, builder: (column) => column);

  GeneratedColumn<String> get barcodeValue => $composableBuilder(
      column: $table.barcodeValue, builder: (column) => column);

  GeneratedColumn<bool> get isFavorite => $composableBuilder(
      column: $table.isFavorite, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<int> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);
}

class $$CardsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CardsTable,
    FidoCard,
    $$CardsTableFilterComposer,
    $$CardsTableOrderingComposer,
    $$CardsTableAnnotationComposer,
    $$CardsTableCreateCompanionBuilder,
    $$CardsTableUpdateCompanionBuilder,
    (FidoCard, BaseReferences<_$AppDatabase, $CardsTable, FidoCard>),
    FidoCard,
    PrefetchHooks Function()> {
  $$CardsTableTableManager(_$AppDatabase db, $CardsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CardsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CardsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CardsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> displayName = const Value.absent(),
            Value<String?> brandId = const Value.absent(),
            Value<String> barcodeType = const Value.absent(),
            Value<String> barcodeValue = const Value.absent(),
            Value<bool> isFavorite = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CardsCompanion(
            id: id,
            displayName: displayName,
            brandId: brandId,
            barcodeType: barcodeType,
            barcodeValue: barcodeValue,
            isFavorite: isFavorite,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String displayName,
            Value<String?> brandId = const Value.absent(),
            required String barcodeType,
            required String barcodeValue,
            Value<bool> isFavorite = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime?> updatedAt = const Value.absent(),
            Value<int> syncStatus = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CardsCompanion.insert(
            id: id,
            displayName: displayName,
            brandId: brandId,
            barcodeType: barcodeType,
            barcodeValue: barcodeValue,
            isFavorite: isFavorite,
            createdAt: createdAt,
            updatedAt: updatedAt,
            syncStatus: syncStatus,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CardsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CardsTable,
    FidoCard,
    $$CardsTableFilterComposer,
    $$CardsTableOrderingComposer,
    $$CardsTableAnnotationComposer,
    $$CardsTableCreateCompanionBuilder,
    $$CardsTableUpdateCompanionBuilder,
    (FidoCard, BaseReferences<_$AppDatabase, $CardsTable, FidoCard>),
    FidoCard,
    PrefetchHooks Function()>;
typedef $$BrandsTableCreateCompanionBuilder = BrandsCompanion Function({
  required String id,
  required String name,
  Value<String?> logoAsset,
  required String suggestedBarcodeTypes,
  Value<String> country,
  Value<int> rowid,
});
typedef $$BrandsTableUpdateCompanionBuilder = BrandsCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> logoAsset,
  Value<String> suggestedBarcodeTypes,
  Value<String> country,
  Value<int> rowid,
});

class $$BrandsTableFilterComposer
    extends Composer<_$AppDatabase, $BrandsTable> {
  $$BrandsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get logoAsset => $composableBuilder(
      column: $table.logoAsset, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get suggestedBarcodeTypes => $composableBuilder(
      column: $table.suggestedBarcodeTypes,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnFilters(column));
}

class $$BrandsTableOrderingComposer
    extends Composer<_$AppDatabase, $BrandsTable> {
  $$BrandsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get logoAsset => $composableBuilder(
      column: $table.logoAsset, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get suggestedBarcodeTypes => $composableBuilder(
      column: $table.suggestedBarcodeTypes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnOrderings(column));
}

class $$BrandsTableAnnotationComposer
    extends Composer<_$AppDatabase, $BrandsTable> {
  $$BrandsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get logoAsset =>
      $composableBuilder(column: $table.logoAsset, builder: (column) => column);

  GeneratedColumn<String> get suggestedBarcodeTypes => $composableBuilder(
      column: $table.suggestedBarcodeTypes, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);
}

class $$BrandsTableTableManager extends RootTableManager<
    _$AppDatabase,
    $BrandsTable,
    Brand,
    $$BrandsTableFilterComposer,
    $$BrandsTableOrderingComposer,
    $$BrandsTableAnnotationComposer,
    $$BrandsTableCreateCompanionBuilder,
    $$BrandsTableUpdateCompanionBuilder,
    (Brand, BaseReferences<_$AppDatabase, $BrandsTable, Brand>),
    Brand,
    PrefetchHooks Function()> {
  $$BrandsTableTableManager(_$AppDatabase db, $BrandsTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$BrandsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$BrandsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$BrandsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> logoAsset = const Value.absent(),
            Value<String> suggestedBarcodeTypes = const Value.absent(),
            Value<String> country = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BrandsCompanion(
            id: id,
            name: name,
            logoAsset: logoAsset,
            suggestedBarcodeTypes: suggestedBarcodeTypes,
            country: country,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> logoAsset = const Value.absent(),
            required String suggestedBarcodeTypes,
            Value<String> country = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              BrandsCompanion.insert(
            id: id,
            name: name,
            logoAsset: logoAsset,
            suggestedBarcodeTypes: suggestedBarcodeTypes,
            country: country,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$BrandsTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $BrandsTable,
    Brand,
    $$BrandsTableFilterComposer,
    $$BrandsTableOrderingComposer,
    $$BrandsTableAnnotationComposer,
    $$BrandsTableCreateCompanionBuilder,
    $$BrandsTableUpdateCompanionBuilder,
    (Brand, BaseReferences<_$AppDatabase, $BrandsTable, Brand>),
    Brand,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CardsTableTableManager get cards =>
      $$CardsTableTableManager(_db, _db.cards);
  $$BrandsTableTableManager get brands =>
      $$BrandsTableTableManager(_db, _db.brands);
}
