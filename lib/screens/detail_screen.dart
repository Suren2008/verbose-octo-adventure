import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../models/food_item.dart';
import '../services/app_state.dart';
import '../theme/app_theme.dart';
import '../widgets/macro_donut.dart';
import '../widgets/macro_pill.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.item, required this.state});

  final FoodItem item;
  final AppState state;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  double _grams = 100;

  @override
  Widget build(BuildContext context) {
    final scaled = widget.item.scaledTo(_grams);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Информация'),
        actions: [
          AnimatedBuilder(
            animation: widget.state,
            builder: (context, _) {
              final fav = widget.state.isFavorite(widget.item.id);
              return IconButton(
                onPressed: () => widget.state.toggleFavorite(widget.item.id),
                icon: Icon(
                  fav
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_outline_rounded,
                  color: fav ? AppColors.primary : null,
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(20, 4, 20, 28),
          children: [
            _Header(item: widget.item),
            const SizedBox(height: 20),
            _DonutCard(item: scaled),
            const SizedBox(height: 16),
            _MacrosRow(item: scaled),
            const SizedBox(height: 16),
            _PortionCard(
              grams: _grams,
              onChanged: (v) => setState(() => _grams = v),
            ),
            const SizedBox(height: 16),
            _BreakdownCard(item: scaled),
            const SizedBox(height: 16),
            _NutritionFacts(item: scaled),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.item});
  final FoodItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: item.category.color.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Icon(
            item.category.icon,
            color: item.category.color,
            size: 34,
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.name,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              const SizedBox(height: 2),
              Text(
                '${item.nameEn} · ${item.category.label}',
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                ),
              ),
            ],
          ),
        ),
      ],
    ).animate().fadeIn(duration: 280.ms).slideY(begin: 0.05);
  }
}

class _DonutCard extends StatelessWidget {
  const _DonutCard({required this.item});
  final FoodItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
        child: Column(
          children: [
            MacroDonut(item: item),
            const SizedBox(height: 14),
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 14,
              runSpacing: 6,
              children: [
                _legend('Белки', AppColors.protein, item.proteinPercent),
                _legend('Жиры', AppColors.fat, item.fatPercent),
                _legend('Углеводы', AppColors.carbs, item.carbsPercent),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _legend(String label, Color color, double percent) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 6),
        Text(
          '$label · ${(percent * 100).toStringAsFixed(0)}%',
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
      ],
    );
  }
}

class _MacrosRow extends StatelessWidget {
  const _MacrosRow({required this.item});
  final FoodItem item;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: MacroPill(
            label: 'БЕЛКИ',
            value: item.protein,
            unit: 'г',
            color: AppColors.protein,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: MacroPill(
            label: 'ЖИРЫ',
            value: item.fat,
            unit: 'г',
            color: AppColors.fat,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: MacroPill(
            label: 'УГЛЕВ.',
            value: item.carbs,
            unit: 'г',
            color: AppColors.carbs,
          ),
        ),
      ],
    );
  }
}

class _PortionCard extends StatelessWidget {
  const _PortionCard({required this.grams, required this.onChanged});
  final double grams;
  final ValueChanged<double> onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 18, 20, 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.scale_rounded, color: AppColors.primary),
                const SizedBox(width: 10),
                Text(
                  'Размер порции',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${grams.toStringAsFixed(0)} г',
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ],
            ),
            Slider(
              value: grams,
              min: 10,
              max: 500,
              divisions: 49,
              activeColor: AppColors.primary,
              onChanged: onChanged,
            ),
            Wrap(
              spacing: 8,
              children: [
                for (final preset in const [50.0, 100.0, 150.0, 200.0, 300.0])
                  ChoiceChip(
                    label: Text('${preset.toStringAsFixed(0)} г'),
                    selected: grams == preset,
                    onSelected: (_) => onChanged(preset),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BreakdownCard extends StatelessWidget {
  const _BreakdownCard({required this.item});
  final FoodItem item;

  @override
  Widget build(BuildContext context) {
    final caloriesFromProtein = item.protein * 4;
    final caloriesFromFat = item.fat * 9;
    final caloriesFromCarbs = item.carbs * 4;
    final total = (caloriesFromProtein + caloriesFromFat + caloriesFromCarbs)
        .clamp(1, double.infinity);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Источник калорий',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 14),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                height: 12,
                child: Row(
                  children: [
                    Expanded(
                      flex: (caloriesFromProtein / total * 1000).round(),
                      child: Container(color: AppColors.protein),
                    ),
                    Expanded(
                      flex: (caloriesFromFat / total * 1000).round(),
                      child: Container(color: AppColors.fat),
                    ),
                    Expanded(
                      flex: (caloriesFromCarbs / total * 1000).round(),
                      child: Container(color: AppColors.carbs),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 14),
            _row('Белки', caloriesFromProtein, total, AppColors.protein),
            const SizedBox(height: 6),
            _row('Жиры', caloriesFromFat, total, AppColors.fat),
            const SizedBox(height: 6),
            _row('Углеводы', caloriesFromCarbs, total, AppColors.carbs),
          ],
        ),
      ),
    );
  }

  Widget _row(String label, double kcal, double total, Color color) {
    final percent = (kcal / total * 100).clamp(0, 100);
    return Row(
      children: [
        Container(
          width: 10,
          height: 10,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(3),
          ),
        ),
        const SizedBox(width: 8),
        Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
        const Spacer(),
        Text('${kcal.toStringAsFixed(0)} ккал · ${percent.toStringAsFixed(0)}%'),
      ],
    );
  }
}

class _NutritionFacts extends StatelessWidget {
  const _NutritionFacts({required this.item});
  final FoodItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Пищевая ценность',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
            ),
            const SizedBox(height: 4),
            Text(
              'на ${item.servingSize.toStringAsFixed(0)} ${item.servingUnit}',
              style: TextStyle(color: Theme.of(context).hintColor),
            ),
            const SizedBox(height: 14),
            _row(context, 'Калорийность', '${item.calories.toStringAsFixed(0)} ккал'),
            _row(context, 'Белки', '${item.protein.toStringAsFixed(1)} г'),
            _row(context, 'Жиры', '${item.fat.toStringAsFixed(1)} г'),
            _row(context, 'Углеводы', '${item.carbs.toStringAsFixed(1)} г'),
          ],
        ),
      ),
    );
  }

  Widget _row(BuildContext context, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Text(label, style: const TextStyle(fontSize: 14)),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
          ),
        ],
      ),
    );
  }
}
