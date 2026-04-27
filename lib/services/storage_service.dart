import 'package:shared_preferences/shared_preferences.dart';

class StorageService {
  static const _favKey = 'favorites';
  static const _historyKey = 'history';
  static const _historyLimit = 30;

  Future<List<String>> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favKey) ?? <String>[];
  }

  Future<void> saveFavorites(List<String> ids) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_favKey, ids);
  }

  Future<List<String>> loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_historyKey) ?? <String>[];
  }

  Future<void> pushHistory(String id) async {
    final prefs = await SharedPreferences.getInstance();
    final list = prefs.getStringList(_historyKey) ?? <String>[];
    list.remove(id);
    list.insert(0, id);
    if (list.length > _historyLimit) list.removeRange(_historyLimit, list.length);
    await prefs.setStringList(_historyKey, list);
  }

  Future<void> clearHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_historyKey);
  }
}
