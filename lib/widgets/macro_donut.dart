import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../models/food_item.dart';
import '../theme/app_theme.dart';

class MacroDonut extends StatelessWidget {
  const MacroDonut({super.key, required this.item, this.size = 180});

  final FoodItem item;
  final double size;

  @override
  Widget build(BuildContext context) {
    final hasData = item.totalMacros > 0;
    final sections = hasData
        ? <PieChartSectionData>[
            _section(item.proteinPercent * 100, AppColors.protein),
            _section(item.fatPercent * 100, AppColors.fat),
            _section(item.carbsPercent * 100, AppColors.carbs),
          ]
        : <PieChartSectionData>[
            PieChartSectionData(
              value: 1,
              color: Theme.of(context).dividerColor,
              showTitle: false,
              radius: size * 0.18,
            ),
          ];

    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 3,
              centerSpaceRadius: size * 0.32,
              startDegreeOffset: -90,
              sections: sections,
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                item.calories.toStringAsFixed(0),
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: AppColors.calories,
                    ),
              ),
              Text(
                'ккал',
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: Theme.of(context).hintColor,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  PieChartSectionData _section(double value, Color color) => PieChartSectionData(
        value: value,
        color: color,
        showTitle: false,
        radius: size * 0.18,
      );
}
