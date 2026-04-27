import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../data/food_database.dart';
import '../models/food_item.dart';
import '../services/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/category_chip.dart';
import '../widgets/food_tile.dart';
import 'detail_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key, required this.state});

  final AppState state;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SafeArea(
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
              child: Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppColors.primary, AppColors.primaryDark],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(Icons.eco_rounded, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'NutriScan',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w800,
                            ),
                      ),
                      Text(
                        'КБЖУ любого продукта',
                        style: TextStyle(
                          fontSize: 12,
                          color: Theme.of(context).hintColor,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      state.setThemeMode(
                        isDark ? ThemeMode.light : ThemeMode.dark,
                      );
                    },
                    icon: Icon(
                      isDark ? Icons.light_mode_outlined : Icons.dark_mode_outlined,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 20, 8),
              child: _SearchEntry(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => SearchScreen(state: state),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 20, 0),
              child: _DailyTipCard(),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
              child: Row(
                children: [
                  Text(
                    'Категории',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 50,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: FoodCategory.values.length,
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final cat = FoodCategory.values[index];
                  return CategoryChip(
                    category: cat,
                    selected: false,
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => SearchScreen(
                          state: state,
                          initialCategory: cat,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 12),
              child: Row(
                children: [
                  Text(
                    'Популярное',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.w700,
                        ),
                  ),
                ],
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList.separated(
              itemCount: FoodDatabase.popular().length,
              separatorBuilder: (_, __) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = FoodDatabase.popular()[index];
                return AnimatedBuilder(
                  animation: state,
                  builder: (context, _) {
                    return FoodTile(
                      item: item,
                      isFavorite: state.isFavorite(item.id),
                      onToggleFavorite: () => state.toggleFavorite(item.id),
                      onTap: () {
                        state.registerView(item.id);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => DetailScreen(item: item, state: state),
                          ),
                        );
                      },
                    ).animate().fadeIn(
                          delay: (index * 40).ms,
                          duration: 280.ms,
                        ).slideY(begin: 0.1, end: 0);
                  },
                );
              },
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}

class _SearchEntry extends StatelessWidget {
  const _SearchEntry({required this.onTap});
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardTheme.color,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
          child: Row(
            children: [
              Icon(Icons.search_rounded, color: Theme.of(context).hintColor),
              const SizedBox(width: 12),
              Text(
                'Найти блюдо или продукт…',
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                  fontSize: 15,
                ),
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Text(
                  'КБЖУ',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DailyTipCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [AppColors.primary, AppColors.primaryDark],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(22),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'СОВЕТ ДНЯ',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Получай белок, жиры и углеводы из простых продуктов',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  'Введи название — увидишь точный КБЖУ',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Icon(
              Icons.local_dining_rounded,
              color: Colors.white,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
