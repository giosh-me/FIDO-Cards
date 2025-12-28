import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fido_cards/core/database/app_database.dart';
import 'package:fido_cards/features/brands/data/brand_repository.dart'; // per databaseProvider
import 'package:uuid/uuid.dart';

class CardRepository {
  final AppDatabase _db;

  CardRepository(this._db);

  /// Recupera tutte le carte ordinate per preferiti e data di creazione.
  Future<List<FidoCard>> getAllCards() {
    return (_db.select(_db.cards)
          ..where((tbl) => tbl.syncStatus.isNotValue(3)) // Exclude deleted
          ..orderBy([
            (t) => OrderingTerm(expression: t.isFavorite, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)
          ]))
        .get();
  }

  /// Stream di tutte le carte per aggiornamenti in tempo reale.
  Stream<List<FidoCard>> watchAllCards({String query = ''}) {
    final statement = _db.select(_db.cards)..where((tbl) => tbl.syncStatus.isNotValue(3));
    if (query.isNotEmpty) {
      statement.where((tbl) => tbl.displayName.contains(query.toLowerCase()));
    }
    return (statement
          ..orderBy([
            (t) => OrderingTerm(expression: t.isFavorite, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.createdAt, mode: OrderingMode.desc)
          ]))
        .watch();
  }

  /// Recupera una singola carta per ID.
  Future<FidoCard?> getCard(String id) {
    return (_db.select(_db.cards)
          ..where((tbl) => tbl.id.equals(id) & tbl.syncStatus.isNotValue(3)))
        .getSingleOrNull();
  }

  /// Aggiunge una nuova carta.
  Future<void> addCard({
    required String displayName,
    required String barcodeValue,
    required String barcodeType,
    String? brandId,
  }) async {
    await _db.into(_db.cards).insert(CardsCompanion.insert(
      id: const Uuid().v4(),
      displayName: displayName,
      barcodeValue: barcodeValue,
      barcodeType: barcodeType,
      brandId: Value(brandId),
      createdAt: Value(DateTime.now()),
      syncStatus: const Value(1), // 1: Created
    ));
  }

  /// Attiva/disattiva stato preferito.
  Future<void> toggleFavorite(String id) async {
    final card = await (_db.select(_db.cards)..where((tbl) => tbl.id.equals(id))).getSingle();
    await (_db.update(_db.cards)..where((tbl) => tbl.id.equals(id))).write(CardsCompanion(
      isFavorite: Value(!card.isFavorite),
      syncStatus: const Value(2), // 2: Updated
    ));
  }

  /// Elimina una carta.
  Future<void> deleteCard(String id) async {
    // Soft Delete
    await (_db.update(_db.cards)..where((tbl) => tbl.id.equals(id))).write(const CardsCompanion(
      syncStatus: Value(3), // 3: Deleted
    ));
  }
}

final cardRepositoryProvider = Provider<CardRepository>((ref) {
  return CardRepository(ref.watch(databaseProvider));
});

final allCardsProvider = StreamProvider.family<List<FidoCard>, String>((ref, query) {
  return ref.watch(cardRepositoryProvider).watchAllCards(query: query);
});

final cardDetailProvider = FutureProvider.family<FidoCard?, String>((ref, id) {
  return ref.watch(cardRepositoryProvider).getCard(id);
});
