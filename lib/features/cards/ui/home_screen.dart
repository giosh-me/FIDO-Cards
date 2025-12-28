import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:fido_cards/core/app_strings.dart';
import 'package:fido_cards/features/cards/data/card_repository.dart';
import 'package:fido_cards/core/database/app_database.dart'; 

final searchQueryProvider = StateProvider<String>((ref) => '');

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Osserviamo la query di ricerca
    final searchQuery = ref.watch(searchQueryProvider);
    // Osserviamo lo stream delle carte filtrato
    final cardsAsync = ref.watch(allCardsProvider(searchQuery));

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.medium(
            title: const Text(AppStrings.homeTitle),
            floating: true,
          ),
           SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: AppStrings.searchPlaceholder,
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (v) {
                  ref.read(searchQueryProvider.notifier).state = v;
                },
              ),
            ),
          ),
          cardsAsync.when(
            data: (cards) {
              if (cards.isEmpty) {
                return const SliverFillRemaining(
                  child: _EmptyState(),
                );
              }
              return SliverPadding(
                padding: const EdgeInsets.all(16),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.5,
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final FidoCard card = cards[index];
                      bool isFav = card.isFavorite; 
                      return Card(
                        color: isFav ? Theme.of(context).colorScheme.tertiaryContainer : null,
                        child: InkWell(
                          onTap: () => context.go('/card/${card.id}'),
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(Icons.credit_card, color: Theme.of(context).colorScheme.primary),
                                    if (isFav) const Icon(Icons.star, size: 16, color: Colors.orange),
                                  ],
                                ),
                                Text(
                                  card.displayName,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: cards.length,
                  ),
                ),
              );
            },
            loading: () => const SliverFillRemaining(child: Center(child: CircularProgressIndicator())),
            error: (err, st) => SliverFillRemaining(child: Center(child: Text("Errore: $err"))),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.go('/add'),
        label: const Text(AppStrings.emptyCta),
        icon: const Icon(Icons.add),
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.wallet, size: 64, color: Theme.of(context).colorScheme.outline),
          const SizedBox(height: 16),
          Text(AppStrings.emptyTitle, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 8),
          Text(
            AppStrings.emptySub, 
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}
