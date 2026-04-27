import 'package:flutter/foundation.dart';

import '../data/food_database.dart';
import '../models/food_item.dart';
import 'storage_service.dart';

class AppState extends ChangeNotifier {
  AppState(this._storage);

  final StorageService _storage;

  final Set<String> _favoriteIds = <String>{};
  final List<String> _historyIds = <String>[];
  ThemeMode _themeMode = ThemeMode.system;

  Set<String> get favoriteIds => _favoriteIds;
  List<String> get historyIds => List.unmodifiable(_historyIds);
  ThemeMode get themeMode => _themeMode;

  List<FoodItem> get favorites => _favoriteIds
      .map(FoodDatabase.findById)
      .whereType<FoodItem>()
      .toList();

  List<FoodItem> get history => _historyIds
      .map(FoodDatabase.findById)
      .whereType<FoodItem>()
      .toList();

  Future<void> load() async {
    _favoriteIds.addAll(await _storage.loadFavorites());
    _historyIds.addAll(await _storage.loadHistory());
    notifyListeners();
  }

  bool isFavorite(String id) => _favoriteIds.contains(id);

  Future<void> toggleFavorite(String id) async {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    await _storage.saveFavorites(_favoriteIds.toList());
    notifyListeners();
  }

  Future<void> registerView(String id) async {
    _historyIds.remove(id);
    _historyIds.insert(0, id);
    if (_historyIds.length > 30) {
      _historyIds.removeRange(30, _historyIds.length);
    }
    await _storage.pushHistory(id);
    notifyListeners();
  }

  Future<void> clearHistory() async {
    _historyIds.clear();
    await _storage.clearHistory();
    notifyListeners();
  }

  void setThemeMode(ThemeMode mode) {
    _themeMode = mode;
    notifyListeners();
  }
}
