import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:fido_cards/core/app_strings.dart';
import 'package:fido_cards/features/cards/data/card_repository.dart';

class AddCardScreen extends ConsumerStatefulWidget {
  const AddCardScreen({super.key});

  @override
  ConsumerState<AddCardScreen> createState() => _AddCardScreenState();
}

class _AddCardScreenState extends ConsumerState<AddCardScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  String _selectedType = 'ean13'; // Default
  
  // Controller per lo scanner
  final MobileScannerController _scannerController = MobileScannerController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    _nameController.dispose();
    _codeController.dispose();
    _scannerController.dispose();
    super.dispose();
  }

  void _onBarcodeDetected(BarcodeCapture capture) {
    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isNotEmpty) {
      final code = barcodes.first;
      if (code.rawValue != null) {
        _scannerController.stop(); // Ferma la scansione una volta trovato
        
        // Mostra foglio di conferma
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          builder: (ctx) => _ConfirmScanSheet(
            rawValue: code.rawValue!,
            format: code.format,
            onSave: (name) {
              _saveCard(name, code.rawValue!, code.format.toString().split('.').last);
              Navigator.pop(ctx);
            },
            onEdit: () {
              Navigator.pop(ctx);
              setState(() {
                _codeController.text = code.rawValue!;
                _selectedType = code.format.toString().split('.').last;
                _tabController.animateTo(1); // Passa alla tab manuale
              });
            },
          ),
        );
      }
    }
  }

  void _saveCard(String name, String code, String type) async {
    if (name.isEmpty || code.isEmpty) return;
    
    await ref.read(cardRepositoryProvider).addCard(
      displayName: name,
      barcodeValue: code,
      barcodeType: type,
    );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text(AppStrings.successToast)),
      );
      context.pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.addCardTitle),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: AppStrings.scanTab),
            Tab(text: AppStrings.manualTab),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Tab Scansione
          Stack(
            children: [
              MobileScanner(
                controller: _scannerController,
                onDetect: _onBarcodeDetected,
              ),
              Center(
                child: Container(
                  width: 250,
                  height: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                left: 0,
                right: 0,
                child: Text(
                  "${AppStrings.scanHint}\n${AppStrings.scanHelp}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, shadows: [
                    Shadow(blurRadius: 4, color: Colors.black)
                  ]),
                ),
              ),
            ],
          ),
          
          // Tab Manuale
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(labelText: AppStrings.labelName),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _codeController,
                  decoration: const InputDecoration(labelText: AppStrings.labelCode),
                ),
                const SizedBox(height: 16),
                // Dropdown semplificato per MVP
                DropdownButtonFormField<String>(
                  value: _selectedType,
                  decoration: const InputDecoration(labelText: AppStrings.labelCodeType),
                  items: const [
                    DropdownMenuItem(value: 'ean13', child: Text("EAN 13")),
                    DropdownMenuItem(value: 'ean8', child: Text("EAN 8")),
                    DropdownMenuItem(value: 'code128', child: Text("Code 128")),
                    DropdownMenuItem(value: 'qr', child: Text("QR Code")),
                    // Aggiungere altri se necessario
                  ],
                  onChanged: (v) => setState(() => _selectedType = v!),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: FilledButton(
                    onPressed: () => _saveCard(_nameController.text, _codeController.text, _selectedType),
                    child: const Text(AppStrings.btnSave),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ConfirmScanSheet extends StatefulWidget {
  final String rawValue;
  final BarcodeFormat format;
  final Function(String) onSave;
  final VoidCallback onEdit;

  const _ConfirmScanSheet({
    required this.rawValue,
    required this.format,
    required this.onSave,
    required this.onEdit,
  });

  @override
  State<_ConfirmScanSheet> createState() => _ConfirmScanSheetState();
}

class _ConfirmScanSheetState extends State<_ConfirmScanSheet> {
  final _nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 16,
        right: 16,
        top: 24,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(AppStrings.cardFoundTitle, style: Theme.of(context).textTheme.headlineSmall),
          Text(AppStrings.cardFoundSub, style: Theme.of(context).textTheme.bodyMedium),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.qr_code),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.rawValue, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text(widget.format.name, style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: AppStrings.labelName, hintText: "Es. Conad, Coop..."),
            autofocus: true,
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              TextButton(onPressed: widget.onEdit, child: const Text(AppStrings.btnEdit)),
              const Spacer(),
              FilledButton(
                onPressed: () => widget.onSave(_nameController.text),
                child: const Text(AppStrings.btnSave),
              ),
            ],
          ),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
