import 'package:flutter/material.dart';

enum FoodCategory {
  fruit('Фрукты', Icons.apple_outlined, Color(0xFFEF5350)),
  vegetable('Овощи', Icons.eco_outlined, Color(0xFF66BB6A)),
  meat('Мясо', Icons.restaurant_outlined, Color(0xFFB71C1C)),
  fish('Рыба', Icons.set_meal_outlined, Color(0xFF42A5F5)),
  dairy('Молочные', Icons.water_drop_outlined, Color(0xFF90CAF9)),
  grain('Крупы', Icons.grain_outlined, Color(0xFFD7A86E)),
  bakery('Выпечка', Icons.bakery_dining_outlined, Color(0xFFE0AB6C)),
  dish('Блюда', Icons.dinner_dining_outlined, Color(0xFFFF7043)),
  drink('Напитки', Icons.local_cafe_outlined, Color(0xFF8D6E63)),
  sweet('Сладкое', Icons.cake_outlined, Color(0xFFEC407A)),
  nuts('Орехи', Icons.spa_outlined, Color(0xFF8D6E63)),
  other('Прочее', Icons.fastfood_outlined, Color(0xFF78909C));

  final String label;
  final IconData icon;
  final Color color;

  const FoodCategory(this.label, this.icon, this.color);
}

class FoodItem {
  final String id;
  final String name;
  final String nameEn;
  final FoodCategory category;
  final double calories;
  final double protein;
  final double fat;
  final double carbs;
  final double servingSize;
  final String servingUnit;

  const FoodItem({
    required this.id,
    required this.name,
    required this.nameEn,
    required this.category,
    required this.calories,
    required this.protein,
    required this.fat,
    required this.carbs,
    this.servingSize = 100,
    this.servingUnit = 'г',
  });

  FoodItem scaledTo(double grams) {
    final factor = grams / servingSize;
    return FoodItem(
      id: id,
      name: name,
      nameEn: nameEn,
      category: category,
      calories: calories * factor,
      protein: protein * factor,
      fat: fat * factor,
      carbs: carbs * factor,
      servingSize: grams,
      servingUnit: servingUnit,
    );
  }

  double get totalMacros => protein + fat + carbs;
  double get proteinPercent => totalMacros == 0 ? 0 : protein / totalMacros;
  double get fatPercent => totalMacros == 0 ? 0 : fat / totalMacros;
  double get carbsPercent => totalMacros == 0 ? 0 : carbs / totalMacros;

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'nameEn': nameEn,
        'category': category.name,
        'calories': calories,
        'protein': protein,
        'fat': fat,
        'carbs': carbs,
        'servingSize': servingSize,
        'servingUnit': servingUnit,
      };

  factory FoodItem.fromJson(Map<String, dynamic> json) => FoodItem(
        id: json['id'] as String,
        name: json['name'] as String,
        nameEn: json['nameEn'] as String,
        category: FoodCategory.values.firstWhere(
          (c) => c.name == json['category'],
          orElse: () => FoodCategory.other,
        ),
        calories: (json['calories'] as num).toDouble(),
        protein: (json['protein'] as num).toDouble(),
        fat: (json['fat'] as num).toDouble(),
        carbs: (json['carbs'] as num).toDouble(),
        servingSize: (json['servingSize'] as num?)?.toDouble() ?? 100,
        servingUnit: json['servingUnit'] as String? ?? 'г',
      );
}
