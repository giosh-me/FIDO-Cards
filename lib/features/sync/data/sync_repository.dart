import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fido_cards/core/database/app_database.dart';
import 'package:fido_cards/features/cards/data/card_repository.dart';
import 'package:fido_cards/features/brands/data/brand_repository.dart';

class SyncRepository {
  final AppDatabase _db;
  
  // Mock API endpoint
  final String _mockApiUrl = 'https://api.fidocards.com/v1/sync';

  SyncRepository(this._db);

  /// Esegue la sincronizzazione: Push dei dati locali -> Pull dei dati remoti.
  Future<void> sync() async {
    // 1. PUSH: Trova le carte con modifiche pendenti (syncStatus != 0)
    final pendingCards = await (_db.select(_db.cards)..where((tbl) => tbl.syncStatus.isNotValue(0))).get();

    if (pendingCards.isNotEmpty) {
      // Simula invio al server
      await Future.delayed(const Duration(seconds: 2)); 
      
      // Se successo, resetta lo stato a 0 (Synced) o elimina fisicamente se era 3
      for (final card in pendingCards) {
        if (card.syncStatus == 3) {
           // Hard delete dopo conferma server
           await (_db.delete(_db.cards)..where((tbl) => tbl.id.equals(card.id))).go();
        } else {
           // Mark as synced
           await (_db.update(_db.cards)..where((tbl) => tbl.id.equals(card.id))).write(CardsCompanion(
             syncStatus: Value(0),
           ));
        }
      }
    }

    // 2. PULL: Scarica nuovi dati (Mocked)
    // Qui si chiamerebbe l'API per ottenere le carte modificate dopo l'ultimo sync
  }
}

final syncRepositoryProvider = Provider<SyncRepository>((ref) {
  return SyncRepository(ref.watch(databaseProvider));
});
