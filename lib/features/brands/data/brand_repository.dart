import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fido_cards/core/database/app_database.dart';
import 'package:fido_cards/features/brands/data/brand_seed.dart';

// Provider globale per il database
final databaseProvider = Provider<AppDatabase>((ref) => AppDatabase());

class BrandRepository {
  final AppDatabase _db;

  BrandRepository(this._db);

  /// Inserisce i brand nel DB se la tabella è vuota.
  Future<void> seedBrandsIfNeeded() async {
    final count = await _db.select(_db.brands).get().then((l) => l.length);
    if (count == 0) {
      await _db.batch((batch) {
        batch.insertAll(_db.brands, kItalianBrandsSeed.map((e) => BrandsCompanion.insert(
          id: e.id,
          name: e.name,
          suggestedBarcodeTypes: e.suggestedBarcodeTypes,
          country: Value(e.country),
        )));
      });
    }
  }

  /// Recupera tutti i brand disponibili.
  Future<List<Brand>> getAllBrands() {
    return _db.select(_db.brands).get();
  }

  /// Cerca un brand per nome (case insensitive).
  Future<List<Brand>> searchBrands(String query) {
    return (_db.select(_db.brands)
      ..where((tbl) => tbl.name.contains(query.toLowerCase())))
      .get();
  }
}

final brandRepositoryProvider = Provider<BrandRepository>((ref) {
  return BrandRepository(ref.watch(databaseProvider));
});

/// Provider che restituisce la lista dei brand, assicurandosi che il seed sia stato fatto.
final brandsListProvider = FutureProvider<List<Brand>>((ref) async {
  final repo = ref.watch(brandRepositoryProvider);
  await repo.seedBrandsIfNeeded();
  return repo.getAllBrands();
});
