import 'package:drift/drift.dart';

@DataClassName('FidoCard')
class Cards extends Table {
  TextColumn get id => text()(); // Identificativo UUID
  TextColumn get displayName => text().withLength(min: 1, max: 100)();
  TextColumn get brandId => text().nullable()();
  TextColumn get barcodeType => text()(); // Enum salvata come stringa (es. 'ean13')
  TextColumn get barcodeValue => text()();
  BoolColumn get isFavorite => boolean().withDefault(const Constant(false))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();
  DateTimeColumn get updatedAt => dateTime().nullable()();
  IntColumn get syncStatus => integer().withDefault(const Constant(0))(); // 0:Synced, 1:Created, 2:Updated, 3:Deleted

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('Brand')
class Brands extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get logoAsset => text().nullable()();
  TextColumn get suggestedBarcodeTypes => text()(); // Lista separata da virgole
  TextColumn get country => text().withDefault(const Constant('IT'))();

  @override
  Set<Column> get primaryKey => {id};
}
