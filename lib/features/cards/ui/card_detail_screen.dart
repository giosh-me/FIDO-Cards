import 'package:barcode_widget/barcode_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fido_cards/core/app_strings.dart';
import 'package:fido_cards/features/cards/data/card_repository.dart';
import 'package:fido_cards/core/database/app_database.dart';

class CardDetailScreen extends ConsumerWidget {
  final String cardId;
  const CardDetailScreen({super.key, required this.cardId});

  /// Determina il widget barcode corretto in base al tipo stringa.
  Barcode? _getBarcode(String type) {
    switch (type.toLowerCase()) {
      case 'ean13': return Barcode.ean13();
      case 'ean8': return Barcode.ean8();
      case 'code128': return Barcode.code128();
      case 'qr': return Barcode.qrCode();
      case 'aztec': return Barcode.aztec();
      case 'upca': return Barcode.upcA();
      case 'upce': return Barcode.upcE();
      case 'codabar': return Barcode.codabar();
      case 'pdf417': return Barcode.pdf417();
      // fallback
      default: return Barcode.code128();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cardAsync = ref.watch(cardDetailProvider(cardId));

    return Scaffold(
      appBar: AppBar(
        actions: [
          cardAsync.when(
            data: (card) {
               if (card == null) return const SizedBox();
               return IconButton(
                 icon: Icon(card.isFavorite ? Icons.star : Icons.star_border),
                 color: card.isFavorite ? Colors.orange : null,
                 onPressed: () {
                   ref.read(cardRepositoryProvider).toggleFavorite(cardId);
                   // Invalida il provider per ricaricare lo stato (o si potrebbe usare uno stream)
                   ref.invalidate(cardDetailProvider(cardId));
                   ref.invalidate(allCardsProvider);
                 },
               );
            },
            loading: () => const SizedBox(),
            error: (_,__) => const SizedBox(),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            onPressed: () {
              // Conferma eliminazione
              showDialog(context: context, builder: (ctx) => AlertDialog(
                title: const Text("Elimina carta"),
                content: const Text("Sei sicuro?"),
                actions: [
                  TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Annulla")),
                  TextButton(onPressed: () {
                    ref.read(cardRepositoryProvider).deleteCard(cardId);
                    Navigator.pop(ctx);
                    context.pop();
                  }, child: const Text("Elimina")),
                ],
              ));
            },
          )
        ],
      ),
      body: cardAsync.when(
        data: (card) {
          if (card == null) return const Center(child: Text("Carta non trovata"));
          final barcode = _getBarcode(card.barcodeType);
          
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 24),
                Text(card.displayName, style: Theme.of(context).textTheme.displaySmall),
                const SizedBox(height: 8),
                Text(AppStrings.detailSub, style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(height: 32),
                
                // Zona Carta
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  padding: const EdgeInsets.all(24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10, offset: const Offset(0, 4)),
                    ],
                  ),
                  child: Column(
                    children: [
                      if (barcode != null)
                        BarcodeWidget(
                          barcode: barcode,
                          data: card.barcodeValue,
                          height: 150,
                          width: double.infinity,
                          drawText: true,
                          style: const TextStyle(fontSize: 18, color: Colors.black),
                        ),
                    ],
                  ),
                ),
                
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () {
                     Navigator.of(context).push(MaterialPageRoute(
                       builder: (ctx) => _FullscreenCode(
                         barcode: barcode, 
                         value: card.barcodeValue,
                         name: card.displayName,
                       ),
                     ));
                  },
                  icon: const Icon(Icons.fullscreen),
                  label: const Text(AppStrings.btnFullscreen),
                ),
                
                const SizedBox(height: 48),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text(AppStrings.sectionDetails),
                  subtitle: Text("Aggiunta il ${card.createdAt.toString().split(' ')[0]}"), // Formato data semplice
                ),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, st) => Center(child: Text("Errore: $err")),
      ),
    );
  }
}

class _FullscreenCode extends StatelessWidget {
  final Barcode? barcode;
  final String value;
  final String name;
  const _FullscreenCode({this.barcode, required this.value, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (barcode != null)
              RotatedBox(
                quarterTurns: 1,
                child: BarcodeWidget(
                  barcode: barcode!,
                  data: value,
                  width: 400, 
                  height: 200,
                  drawText: true,
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
            const SizedBox(height: 32),
            Text(name, style: const TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }
}
