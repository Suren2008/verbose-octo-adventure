import 'package:flutter_test/flutter_test.dart';
import 'package:nutriscan/data/food_database.dart';
import 'package:nutriscan/models/food_item.dart';

void main() {
  group('FoodDatabase', () {
    test('returns empty list for empty query', () {
      expect(FoodDatabase.search(''), isEmpty);
      expect(FoodDatabase.search('   '), isEmpty);
    });

    test('finds items by Russian name', () {
      final results = FoodDatabase.search('яблоко');
      expect(results, isNotEmpty);
      expect(results.first.id, 'apple');
    });

    test('finds items by English name', () {
      final results = FoodDatabase.search('banana');
      expect(results.first.id, 'banana');
    });

    test('partial match works', () {
      final results = FoodDatabase.search('кур');
      expect(results.any((f) => f.id == 'chicken_breast'), isTrue);
    });

    test('byCategory filters correctly', () {
      final fruits = FoodDatabase.byCategory(FoodCategory.fruit);
      expect(fruits, isNotEmpty);
      expect(fruits.every((f) => f.category == FoodCategory.fruit), isTrue);
    });

    test('all items have non-negative macros', () {
      for (final item in FoodDatabase.items) {
        expect(item.calories, greaterThanOrEqualTo(0), reason: item.id);
        expect(item.protein, greaterThanOrEqualTo(0), reason: item.id);
        expect(item.fat, greaterThanOrEqualTo(0), reason: item.id);
        expect(item.carbs, greaterThanOrEqualTo(0), reason: item.id);
      }
    });

    test('all item ids are unique', () {
      final ids = FoodDatabase.items.map((i) => i.id).toList();
      expect(ids.toSet().length, ids.length);
    });

    test('scaledTo scales macros correctly', () {
      final apple = FoodDatabase.findById('apple')!;
      final scaled = apple.scaledTo(200);
      expect(scaled.calories, closeTo(apple.calories * 2, 0.001));
      expect(scaled.protein, closeTo(apple.protein * 2, 0.001));
      expect(scaled.servingSize, 200);
    });
  });
}
