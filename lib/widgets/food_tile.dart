import 'package:flutter/material.dart';

import '../models/food_item.dart';
import '../theme/app_theme.dart';

class FoodTile extends StatelessWidget {
  const FoodTile({
    super.key,
    required this.item,
    required this.onTap,
    this.isFavorite = false,
    this.onToggleFavorite,
  });

  final FoodItem item;
  final VoidCallback onTap;
  final bool isFavorite;
  final VoidCallback? onToggleFavorite;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).cardTheme.color,
      borderRadius: BorderRadius.circular(18),
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: BoxDecoration(
                  color: item.category.color.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Icon(
                  item.category.icon,
                  color: item.category.color,
                  size: 28,
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        _miniBadge(
                          '${item.calories.toStringAsFixed(0)} ккал',
                          AppColors.calories,
                        ),
                        const SizedBox(width: 6),
                        Flexible(
                          child: Text(
                            'Б ${item.protein.toStringAsFixed(1)} · Ж ${item.fat.toStringAsFixed(1)} · У ${item.carbs.toStringAsFixed(1)}',
                            style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).hintColor,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (onToggleFavorite != null)
                IconButton(
                  onPressed: onToggleFavorite,
                  icon: Icon(
                    isFavorite ? Icons.bookmark_rounded : Icons.bookmark_outline_rounded,
                    color: isFavorite ? AppColors.primary : Theme.of(context).hintColor,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _miniBadge(String text, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
    );
  }
}
