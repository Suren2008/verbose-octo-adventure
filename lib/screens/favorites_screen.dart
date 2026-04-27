import 'package:flutter/material.dart';

import '../services/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/food_tile.dart';
import 'detail_screen.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key, required this.state});

  final AppState state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AnimatedBuilder(
        animation: state,
        builder: (context, _) {
          final favs = state.favorites;
          return CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.bookmark_rounded,
                        color: AppColors.primary,
                        size: 28,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        'Избранное',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      const Spacer(),
                      Text(
                        '${favs.length}',
                        style: TextStyle(
                          color: Theme.of(context).hintColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (favs.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: _empty(context),
                )
              else
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  sliver: SliverList.separated(
                    itemCount: favs.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 10),
                    itemBuilder: (context, index) {
                      final item = favs[index];
                      return FoodTile(
                        item: item,
                        isFavorite: true,
                        onToggleFavorite: () => state.toggleFavorite(item.id),
                        onTap: () {
                          state.registerView(item.id);
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => DetailScreen(item: item, state: state),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
              const SliverToBoxAdapter(child: SizedBox(height: 32)),
            ],
          );
        },
      ),
    );
  }

  Widget _empty(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: AppColors.primary.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Icon(
                Icons.bookmark_outline_rounded,
                color: AppColors.primary,
                size: 40,
              ),
            ),
            const SizedBox(height: 18),
            Text(
              'Здесь пока пусто',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
            ),
            const SizedBox(height: 8),
            Text(
              'Добавляй блюда в избранное — они будут под рукой',
              textAlign: TextAlign.center,
              style: TextStyle(color: Theme.of(context).hintColor),
            ),
          ],
        ),
      ),
    );
  }
}
