import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:fido_cards/core/encryption_service.dart';

import 'tables.dart';

part 'app_database.g.dart';

/// Configurazione del Database locale utilizzando Drift (astrazione su SQLite).
/// Gestisce le tabelle per Carte e Brand.
@DriftDatabase(tables: [Cards, Brands])
class AppDatabase extends _$AppDatabase {
  // Costruttore standard per l'app
  AppDatabase() : super(_openConnection());

  // Costruttore per i test (in-memory)
  AppDatabase.forTesting(QueryExecutor e) : super(e);

  @override
  int get schemaVersion => 1;
}

// Funzione helper per aprire la connessione al database
LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    // Ottiene la cartella dei documenti dell'app
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'fido_cards.sqlite')); // Assicuriamoci che il nome sia corretto per sqlcipher
    
    // Recupera la chiave di crittografia
    final encryptionKey = await EncryptionService.getDatabaseKey();
    
    return NativeDatabase(
      file,
      setup: (database) {
        // Configura la chiave di crittografia per SQLCipher
        database.execute("PRAGMA key = '$encryptionKey';");
      },
    );
  });
}
