import 'package:flutter/material.dart';
import 'package:fido_cards/core/app_strings.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fido_cards/features/sync/data/sync_repository.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text(AppStrings.settingsTitle)),
      body: ListView(
        children: [
          const ListTile(
            title: Text(AppStrings.notifToggle),
            // TODO: collegare a stato reale
            trailing: Switch(value: true, onChanged: null),
          ),
          const ListTile(title: Text(AppStrings.privacy)),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.sync),
            title: const Text("Sincronizza ora"),
            subtitle: const Text("Invia le modifiche al server"),
            onTap: () async {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sincronizzazione in corso...")));
              await ref.read(syncRepositoryProvider).sync();
              if(context.mounted) {
                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sincronizzazione completata!")));
              }
            },
          ),
          const Divider(),
          const ListTile(title: Text(AppStrings.version), subtitle: Text("1.0.0")),
        ],
      ),
    );
  }
}
